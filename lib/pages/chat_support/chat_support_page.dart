import 'package:flutter/material.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../data/offline_knowledge.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'dart:async';

// --- MODEL DATA ---
class ChatMessage {
  String text;
  final bool isUser;
  final String role;
  final DateTime timestamp;

  ChatMessage({
    required this.text,
    required this.isUser,
    required this.role,
    DateTime? timestamp,
  }) : timestamp = timestamp ?? DateTime.now();

  Map<String, dynamic> toJson() => {
    'text': text,
    'isUser': isUser,
    'role': role,
    'timestamp': timestamp.toIso8601String(),
  };

  factory ChatMessage.fromJson(Map<String, dynamic> json) => ChatMessage(
    text: json['text'],
    isUser: json['isUser'],
    role: json['role'] ?? (json['isUser'] ? 'user' : 'model'),
    timestamp: json['timestamp'] != null
        ? DateTime.parse(json['timestamp'])
        : DateTime.now(),
  );
}

class ChatSupportPage extends StatefulWidget {
  const ChatSupportPage({super.key});

  @override
  State<ChatSupportPage> createState() => _ChatSupportPageState();
}

class _ChatSupportPageState extends State<ChatSupportPage> {
  final TextEditingController _controller = TextEditingController();
  final ScrollController _scrollController = ScrollController();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

  Timer? _typingTimer;

  // _messages: Untuk tampilan chat di layar utama (Session aktif)
  final List<ChatMessage> _messages = [];

  // _fullHistory: Untuk menyimpan SEMUA riwayat (Database lokal)
  final List<ChatMessage> _fullHistory = [];

  bool _isLoading = false;

  // Warna sesuai referensi
  final Color _primaryBlue = const Color(0xFF00A6FF);
  final Color _bgDark = const Color(0xFF0F1924);
  final Color _bgCardDark = const Color(0xFF1E2A38);
  final Color _textWhite = Colors.white;
  final Color _textGrey = Colors.grey;

  @override
  void initState() {
    super.initState();
    _loadChatHistory();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    _typingTimer?.cancel();
    super.dispose();
  }

  // --- LOGIKA DATA ---

  Future<void> _loadChatHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final List<String>? messageStrings = prefs.getStringList('chat_history');

    if (messageStrings != null && messageStrings.isNotEmpty) {
      setState(() {
        final loaded = messageStrings
            .map((m) => ChatMessage.fromJson(jsonDecode(m)))
            .toList();

        // Isi kedua list saat start up
        _fullHistory.addAll(loaded);
        _messages.addAll(loaded);
      });
      WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    } else {
      _startNewChat(clearViewOnly: true);
    }
  }

  Future<void> _saveChatHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    // Simpan _fullHistory (bukan _messages) agar riwayat tidak hilang saat New Chat
    final List<String> messageStrings = _fullHistory
        .map((m) => jsonEncode(m.toJson()))
        .toList();

    await prefs.setStringList('chat_history', messageStrings);
  }

  // Fungsi New Chat: Hanya reset tampilan, tidak hapus history
  void _startNewChat({bool clearViewOnly = false}) {
    setState(() {
      _messages.clear(); // Bersihkan layar utama

      // Tambahkan sapaan baru (Hanya di layar utama, tidak perlu masuk history database)
      _messages.add(ChatMessage(
          text: "Hi! I'm your hardware assistant. Ask me anything about CPUs, GPUs, or how to build a PC!",
          isUser: false,
          role: 'model'
      ));
    });
    // Kita tidak memanggil _saveChatHistory di sini agar sapaan baru tidak spamming history
  }

  // Fungsi Clear All: Hapus segalanya
  Future<void> _clearHistory() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_history');
    setState(() {
      _fullHistory.clear();
      _startNewChat(clearViewOnly: true); // Reset UI
    });
    if (mounted) Navigator.pop(context);
  }

  void _scrollToBottom() {
    if (_scrollController.hasClients) {
      _scrollController.animateTo(
        _scrollController.position.maxScrollExtent,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  // --- LOGIKA KIRIM PESAN ---

  void _sendMessage() async {
    final text = _controller.text.trim();
    if (text.isEmpty || _isLoading) return;

    _typingTimer?.cancel();
    _controller.clear();

    final userMsg = ChatMessage(text: text, isUser: true, role: 'user');

    setState(() {
      _messages.add(userMsg);      // tampil di layar
      _fullHistory.add(userMsg);   // simpan ke history
      _isLoading = true;
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());
    await _saveChatHistory(); // simpan state terbaru

    // 🔹 1. Coba jawab dulu dari database offline (materi)
    final offlineAnswer = OfflineKnowledgeBase.findBestAnswer(text);

    if (offlineAnswer != null) {
      // Kalau ketemu di materi → langsung jawab dari offline, TANPA Gemini
      _animateAiResponse(offlineAnswer);
      return;
    }

    // 🔹 2. Kalau tidak ada di materi → baru panggil Gemini (ONLINE)
    try {
      final response = await _callGeminiApi(text);
      if (_isLoading) {
        _animateAiResponse(response);
      }
    } catch (e) {
      if (_isLoading) {
        // Fallback kalau koneksi error / API gagal
        _animateAiResponse(
          "Maaf, aku tidak dapat menjawab pertanyaan ini karena di luar materi dan koneksi ke server sedang bermasalah.",
        );
      }
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _stopGeneration() {
    _typingTimer?.cancel();
    setState(() {
      _isLoading = false;
    });
  }

  void _animateAiResponse(String fullText) {
    // Objek pesan AI yang sama dimasukkan ke kedua list
    // Karena Dart pass-by-reference, update text di satu tempat akan update di keduanya
    final aiMsg = ChatMessage(text: "", isUser: false, role: 'model');

    setState(() {
      _messages.add(aiMsg);
      _fullHistory.add(aiMsg);
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => _scrollToBottom());

    int index = 0;
    _typingTimer = Timer.periodic(const Duration(milliseconds: 20), (timer) {
      if (!mounted) {
        timer.cancel();
        return;
      }

      if (index < fullText.length) {
        setState(() {
          // Update teks pada objek referensi
          aiMsg.text += fullText[index];
        });
        index++;
        if (index % 5 == 0) _scrollToBottom();
      } else {
        timer.cancel();
        _saveChatHistory(); // Simpan history lengkap setelah respons selesai
        setState(() {
          _isLoading = false;
        });
        _scrollToBottom();
      }
    });
  }

  Future<String> _callGeminiApi(String prompt) async {
    const apiKey = "AIzaSyC7KehXDNGvD2K6Qf7mF-Q7IyjEl6jCz_8";

    if (apiKey.isEmpty) return "API Key belum diatur.";

    final apiUrl = 'https://generativelanguage.googleapis.com/v1beta/models/gemini-2.5-flash-preview-09-2025:generateContent?key=$apiKey';

    const systemInstruction = {
      "parts": [
        {
          "text": """You are a specialized AI Assistant for a PC Hardware learning application. 
          
          YOUR ROLE:
          - Provide expert assistance on computer hardware (CPU, GPU, RAM, Motherboard, etc.), PC building, networking, software troubleshooting, and general technology topics.
          
          STRICT CONSTRAINTS (FILTERING LOGIC):
          - You must ONLY answer questions related to Computers and Technology.
          - If a user asks about unrelated topics (e.g., History, Biology, Chemistry, Politics, Cooking, General Life, Math unrelated to computing), you must POLITELY REFUSE.
          
          REFUSAL EXAMPLES:
          - User: "Resep nasi goreng?" -> You: "Maaf, saya hanya dapat membantu pertanyaan seputar hardware komputer dan teknologi."
          
          RESPONSE FORMAT:
          - Use Markdown formatting.
          - Keep answers concise and helpful."""
        }
      ]
    };

    // Konteks diambil dari _messages (sesi aktif) agar relevan
    final List<ChatMessage> history = _messages.length > 5
        ? _messages.sublist(_messages.length - 5)
        : _messages;

    final validHistory = history.where((m) => m.text.isNotEmpty).toList();

    final List<Map<String, dynamic>> contents = validHistory.map((msg) {
      return {
        "role": msg.role,
        "parts": [{"text": msg.text}]
      };
    }).toList();

    if (contents.isEmpty || (contents.isNotEmpty && contents.last['role'] != 'user')) {
      contents.add({
        "role": "user",
        "parts": [{"text": prompt}]
      });
    }

    final payload = {
      "contents": contents,
      "systemInstruction": systemInstruction,
    };

    try {
      final response = await http.post(
        Uri.parse(apiUrl),
        headers: {'Content-Type': 'application/json'},
        body: jsonEncode(payload),
      ).timeout(const Duration(seconds: 30));

      if (response.statusCode == 200) {
        final result = jsonDecode(response.body);
        if (result['candidates'] != null &&
            result['candidates'][0]['content'] != null) {
          return result['candidates'][0]['content']['parts'][0]['text'];
        }
      }
      return "I'm having trouble thinking right now. (Error ${response.statusCode})";
    } catch (e) {
      return "Network error: $e";
    }
  }

  // --- UI WIDGETS ---

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKey,
      backgroundColor: _bgDark,
      drawer: _buildHistoryDrawer(),
      appBar: AppBar(
        backgroundColor: _bgDark,
        elevation: 0,
        centerTitle: true,
        title: Text(
          'AI Assistant',
          style: TextStyle(color: _textWhite, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
          icon: Icon(Icons.menu_rounded, color: _textWhite, size: 28),
          onPressed: () {
            _scaffoldKey.currentState?.openDrawer();
          },
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 20.0),
              itemCount: _messages.length + (_isLoading && _messages.last.isUser ? 1 : 0),
              itemBuilder: (context, index) {
                if (_isLoading && index == _messages.length) {
                  return _buildTypingIndicator();
                }

                final message = _messages[index];
                if (message.text.isEmpty && !message.isUser && _isLoading) return const SizedBox.shrink();

                return _buildMessageItem(message);
              },
            ),
          ),
          _buildInputArea(),
        ],
      ),
    );
  }

  // DRAWER HISTORY
  Widget _buildHistoryDrawer() {
    // Gunakan _fullHistory untuk menampilkan daftar di drawer
    final userMessages = _fullHistory.where((m) => m.isUser).toList().reversed.toList();

    return Drawer(
      backgroundColor: _bgDark,
      child: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // HEADER
            Padding(
              padding: const EdgeInsets.fromLTRB(20, 20, 10, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Chat History',
                    style: TextStyle(color: _textWhite, fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  IconButton(
                    icon: Icon(Icons.close, color: _textGrey),
                    onPressed: () => Navigator.pop(context),
                  )
                ],
              ),
            ),

            // TOMBOL NEW CHAT (Full Width)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
              child: ElevatedButton.icon(
                onPressed: () {
                  _startNewChat(); // Reset layar utama
                  Navigator.pop(context); // Opsional: tutup drawer agar user langsung bisa chat
                },
                icon: const Icon(Icons.add_rounded, color: Colors.white),
                label: const Text("New Chat", style: TextStyle(fontWeight: FontWeight.bold)),
                style: ElevatedButton.styleFrom(
                  backgroundColor: _primaryBlue,
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 48), // Full width
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                  elevation: 0,
                ),
              ),
            ),

            // SECTION RECENTS
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text('Recents', style: TextStyle(color: _textGrey, fontSize: 14)),
                  TextButton.icon(
                    onPressed: _clearHistory,
                    icon: const Icon(Icons.delete_outline, size: 16, color: Colors.redAccent),
                    label: const Text('Clear all', style: TextStyle(color: Colors.redAccent, fontSize: 14)),
                    style: TextButton.styleFrom(padding: EdgeInsets.zero),
                  )
                ],
              ),
            ),

            const SizedBox(height: 5),

            // LIST HISTORY
            Expanded(
              child: userMessages.isEmpty
                  ? Center(child: Text("No history yet", style: TextStyle(color: _textGrey)))
                  : ListView.builder(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                itemCount: userMessages.length,
                itemBuilder: (context, index) {
                  final msg = userMessages[index];
                  return Container(
                    margin: const EdgeInsets.only(bottom: 8),
                    decoration: BoxDecoration(
                      color: _bgCardDark,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: Colors.white10),
                    ),
                    child: ListTile(
                      leading: Container(
                        padding: const EdgeInsets.all(8),
                        decoration: BoxDecoration(
                          color: Colors.blue.withAlpha(20),
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: const Icon(Icons.chat_bubble_outline, color: Colors.blue, size: 20),
                      ),
                      title: Text(
                        msg.text,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(color: _textWhite, fontSize: 14),
                      ),
                      subtitle: Text(
                        "${msg.timestamp.hour}:${msg.timestamp.minute.toString().padLeft(2, '0')}",
                        style: TextStyle(color: _textGrey, fontSize: 12),
                      ),
                      // Bisa tambahkan aksi tap jika ingin me-load konteks lama (opsional)
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 2. CHAT BUBBLE & AVATAR
  Widget _buildMessageItem(ChatMessage message) {
    final isUser = message.isUser;
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        mainAxisAlignment: isUser ? MainAxisAlignment.end : MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (!isUser) ...[
            Container(
              margin: const EdgeInsets.only(right: 12),
              width: 36,
              height: 36,
              decoration: BoxDecoration(
                color: _bgCardDark,
                shape: BoxShape.circle,
                border: Border.all(color: Colors.white10),
              ),
              child: const Icon(Icons.smart_toy_outlined, color: Colors.blue, size: 20),
            ),
          ],
          Flexible(
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
              decoration: BoxDecoration(
                color: isUser ? _primaryBlue : _bgCardDark,
                borderRadius: BorderRadius.only(
                  topLeft: const Radius.circular(20),
                  topRight: const Radius.circular(20),
                  bottomLeft: isUser ? const Radius.circular(20) : const Radius.circular(4),
                  bottomRight: isUser ? const Radius.circular(4) : const Radius.circular(20),
                ),
              ),
              child: MarkdownBody(
                data: message.text,
                selectable: true,
                styleSheet: MarkdownStyleSheet(
                  p: TextStyle(color: _textWhite, fontSize: 15, height: 1.4),
                  strong: TextStyle(color: _textWhite, fontWeight: FontWeight.bold),
                  code: TextStyle(backgroundColor: Colors.black26, color: Colors.amberAccent, fontFamily: 'monospace'),
                ),
              ),
            ),
          ),
          if (isUser) const SizedBox(width: 40),
          if (!isUser) const SizedBox(width: 40),
        ],
      ),
    );
  }

  // 3. ANIMASI TYPING (...)
  Widget _buildTypingIndicator() {
    return Padding(
      padding: const EdgeInsets.only(bottom: 24.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: const EdgeInsets.only(right: 12),
            width: 36,
            height: 36,
            decoration: BoxDecoration(
              color: _bgCardDark,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.white10),
            ),
            child: const Icon(Icons.smart_toy_outlined, color: Colors.blue, size: 20),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            decoration: BoxDecoration(
              color: _bgCardDark,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomLeft: Radius.circular(4),
                bottomRight: Radius.circular(20),
              ),
            ),
            child: SizedBox(
              width: 40,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [_dot(0), _dot(1), _dot(2)],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _dot(int delay) {
    return TweenAnimationBuilder(
      tween: Tween<double>(begin: 0, end: 1),
      duration: const Duration(milliseconds: 600),
      curve: Curves.easeInOut,
      builder: (context, double value, child) {
        return Opacity(
          opacity: (value + (delay * 0.3)) % 1.0 < 0.5 ? 0.4 : 1.0,
          child: Container(
            width: 6,
            height: 6,
            decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
          ),
        );
      },
    );
  }

  // 4. INPUT AREA
  Widget _buildInputArea() {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      color: _bgDark,
      child: Row(
        children: [
          Expanded(
            child: TextField(
              controller: _controller,
              style: TextStyle(color: _textWhite),
              textCapitalization: TextCapitalization.sentences,
              decoration: InputDecoration(
                hintText: 'Ask about PC parts...',
                hintStyle: TextStyle(color: _textGrey),
                filled: true,
                fillColor: _bgCardDark,
                contentPadding: const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(30.0), borderSide: BorderSide.none),
              ),
              onSubmitted: (_) => _isLoading ? null : _sendMessage(),
            ),
          ),
          const SizedBox(width: 12),
          GestureDetector(
            onTap: _isLoading ? _stopGeneration : _sendMessage,
            child: Container(
              width: 50,
              height: 50,
              decoration: BoxDecoration(color: _primaryBlue, shape: BoxShape.circle),
              child: Icon(
                _isLoading ? Icons.stop_rounded : Icons.arrow_upward_rounded,
                color: Colors.white,
                size: 28,
              ),
            ),
          ),
        ],
      ),
    );
  }
}