import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:io';
import 'package:shared_preferences/shared_preferences.dart';
import '../login/login_page.dart';
import '../home/home_page.dart';
import '../materi/materi_page.dart';
import '../chat_support/chat_support_page.dart';
import '../quiz/quiz_page.dart';
import '../settings/settings_page.dart';

class MainShell extends StatefulWidget {
  final String username;
  final String? initialBio;
  final String? initialImagePath;
  final Function(ThemeMode) onThemeChanged;

  const MainShell({
    super.key,
    required this.username,
    this.initialBio,
    this.initialImagePath,
    required this.onThemeChanged,
  });

  @override
  State<MainShell> createState() => _MainShellState();
}

class _MainShellState extends State<MainShell> {
  int _selectedIndex = 0;
  late String _currentUsername;
  late String _currentBio;
  File? _currentImage;
  late List<Widget> _widgetOptions;

  @override
  void initState() {
    super.initState();
    _currentUsername = widget.username;
    _currentBio = widget.initialBio ?? "Pelajar | Master Computer";
    _currentImage = widget.initialImagePath != null ? File(widget.initialImagePath!) : null;
    _widgetOptions = _buildWidgetOptions();
  }

  List<Widget> _buildWidgetOptions() {
    return <Widget>[
      HomePageContent(onSettingsTap: _handleSettingsTap), // Index 0
      const MateriPage(), // Index 1
      const ChatSupportPage(), // Index 2
      const QuizSelectionPage(), // Index 3
      SettingsPage( // Index 4
        username: _currentUsername,
        bio: _currentBio,
        image: _currentImage,
        onThemeChanged: widget.onThemeChanged,
        onProfileUpdated: _handleProfileUpdate,
        onLogout: _handleLogout,
      ),
    ];
  }

  void _handleProfileUpdate(String newUsername, String newBio, File? newImage) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('username', newUsername);
    await prefs.setString('bio', newBio);
    if (newImage != null) {
      await prefs.setString('imagePath', newImage.path);
    } else {
      await prefs.remove('imagePath');
    }

    setState(() {
      _currentUsername = newUsername;
      _currentBio = newBio;
      _currentImage = newImage;
      _widgetOptions = _buildWidgetOptions();
    });
  }

  void _handleLogout() async {

    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('chat_history');
    if (!mounted) return;
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
        builder: (context) => LoginPage(onThemeChanged: widget.onThemeChanged),
      ),
          (route) => false,
    );
  }

  void _handleSettingsTap() => _onItemTapped(4);
  void _onItemTapped(int index) => setState(() => _selectedIndex = index);

  // --- UI DIALOG KUSTOM ---
  Future<bool> _showExitDialog(BuildContext context) async {
    return await showDialog(
      context: context,
      barrierDismissible: false, // User harus memilih salah satu tombol
      builder: (context) => Dialog(
        backgroundColor: const Color(0xFF16202A), // Warna background gelap (Dark Theme)
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(24)),
        elevation: 10,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 32.0),
          child: Column(
            mainAxisSize: MainAxisSize.min, // Agar dialog menyesuaikan isi
            children: [
              // Judul Dialog
              const Text(
                'Keluar Aplikasi?',
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                  letterSpacing: 0.5,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 12),

              // Deskripsi
              const Text(
                'Apakah Anda yakin ingin keluar?',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.white54, // Abu-abu muda
                  height: 1.4,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),

              // Tombol Aksi
              Row(
                children: [
                  // Tombol TIDAK (Kiri)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(false),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF2C3E50), // Abu-abu gelap
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                      ),
                      child: const Text(
                        'Tidak',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                  const SizedBox(width: 16),

                  // Tombol YA (Kanan)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () => Navigator.of(context).pop(true),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF00A6FF), // Biru Cerah Primary
                        foregroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(vertical: 16),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                        elevation: 0,
                        shadowColor: const Color(0xFF00A6FF).withAlpha(80),
                      ),
                      child: const Text(
                        'Ya',
                        style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ) ?? false;
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvokedWithResult: (bool didPop, dynamic result) async {
        if (didPop) return;

        // Panggil Dialog Kustom
        final bool shouldExit = await _showExitDialog(context);

        if (shouldExit) {
          SystemNavigator.pop(); // Menutup aplikasi
        }
      },
      child: Scaffold(
        body: _widgetOptions.elementAt(_selectedIndex),
        bottomNavigationBar: BottomNavigationBar(
          items: const [
            BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
            BottomNavigationBarItem(icon: Icon(Icons.menu_book), label: 'Materi'),
            BottomNavigationBarItem(icon: Icon(Icons.support_agent_rounded), label: 'Support'),
            BottomNavigationBarItem(icon: Icon(Icons.quiz), label: 'Quiz'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Settings'),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Theme.of(context).primaryColor,
          unselectedItemColor: Colors.grey,
          onTap: _onItemTapped,
          type: BottomNavigationBarType.fixed,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
      ),
    );
  }
}