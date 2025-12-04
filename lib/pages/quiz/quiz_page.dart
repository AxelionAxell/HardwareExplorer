import 'package:flutter/material.dart';
import '../../models/module.dart';
import '../../data/dummy_data.dart';

// =============================================================================
// 1. HALAMAN PEMILIHAN QUIZ (Select Quiz Page)
// =============================================================================
class QuizSelectionPage extends StatelessWidget {
  const QuizSelectionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final bgColor = Theme.of(context).brightness == Brightness.dark
        ? const Color(0xFF0F1924)
        : const Color(0xFFF5F7FA);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Select Quiz'),
        backgroundColor: bgColor,
        elevation: 0,
        centerTitle: true,
        titleTextStyle: TextStyle(
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87,
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
        iconTheme: IconThemeData(
          color: Theme.of(context).brightness == Brightness.dark ? Colors.white : Colors.black87,
        ),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(20.0),
        itemCount: allModules.length,
        itemBuilder: (context, index) {
          final module = allModules[index];
          // Warna aksen untuk tombol (tetap dipertahankan)
          final accentColor = const Color(0xFF00A6FF);

          return _buildQuizModuleCard(context, module, accentColor);
        },
      ),
    );
  }

  Widget _buildQuizModuleCard(BuildContext context, Module module, Color accentColor) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 20),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2A38) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(color: isDark ? Colors.white10 : Colors.transparent),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withAlpha(isDark ? 50 : 15),
            blurRadius: 15,
            offset: const Offset(0, 8),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start, // Align top agar rapi dengan teks
              children: [
                // --- GAMBAR MODULE (Ukuran disamakan dengan Materi Page) ---
                Container(
                  width: 80,  // Diubah dari 64 menjadi 80
                  height: 80, // Diubah dari 64 menjadi 80
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10), // Diubah dari 16 menjadi 10
                    boxShadow: [
                      BoxShadow(
                        color: accentColor.withAlpha(40),
                        blurRadius: 12,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Diubah dari 16 menjadi 10
                    child: Image.asset(
                      module.imagePath,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return Container(
                          color: Colors.grey[800],
                          child: const Icon(Icons.image_not_supported, color: Colors.white54),
                        );
                      },
                    ),
                  ),
                ),

                const SizedBox(width: 20),

                // --- TEKS JUDUL & DESKRIPSI ---
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        module.moduleNumber,
                        style: const TextStyle(
                          color: Colors.white70,
                          fontWeight: FontWeight.bold,
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        module.title, // Judul Modul (misal: Computer Hardware)
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: isDark ? Colors.white : Colors.black87,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 6),
                      Text(
                        module.description, // Deskripsi singkat
                        style: TextStyle(
                          color: isDark ? Colors.white54 : Colors.grey[600],
                          fontSize: 13,
                          height: 1.4,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 20),

            // --- TOMBOL START QUIZ ---
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  final questions = moduleQuizMap[module.title] ?? [];
                  if (questions.isNotEmpty) {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => QuizPage(
                          quizTitle: module.title,
                          questions: questions,
                        ),
                      ),
                    );
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Soal belum tersedia untuk modul ini.')),
                    );
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A6FF), // Biru terang seperti referensi
                  foregroundColor: Colors.white,
                  elevation: 0,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // Rounded pill shape
                  ),
                  shadowColor: const Color(0xFF00A6FF).withAlpha(80),
                ),
                child: const Text(
                  "Start Quiz",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =============================================================================
// 2. HALAMAN PENGERJAAN SOAL (Quiz Page)
// =============================================================================
class QuizPage extends StatefulWidget {
  final String quizTitle;
  final List<Question> questions;

  const QuizPage({super.key, required this.quizTitle, required this.questions});

  @override
  State<QuizPage> createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  int _currentQuestionIndex = 0;
  int? _selectedOptionIndex;
  late List<int?> _userAnswers;

  @override
  void initState() {
    super.initState();
    _userAnswers = List<int?>.filled(widget.questions.length, null);
  }

  void _submitAnswer() {
    if (_selectedOptionIndex == null) return;

    _userAnswers[_currentQuestionIndex] = _selectedOptionIndex;

    if (_currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        _currentQuestionIndex++;
        _selectedOptionIndex = null;
      });
    } else {
      _finishQuiz();
    }
  }

  void _finishQuiz() {
    int correctCount = 0;
    for (int i = 0; i < widget.questions.length; i++) {
      if (_userAnswers[i] == widget.questions[i].correctAnswerIndex) {
        correctCount++;
      }
    }

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (context) => QuizResultPage(
          score: correctCount,
          totalQuestions: widget.questions.length,
          questions: widget.questions,
          userAnswers: _userAnswers,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final question = widget.questions[_currentQuestionIndex];
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF0F1924) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: isDark ? Colors.white : Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Center(
          child: Text(
            "QUIZ PAGE",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
              color: const Color(0xFF00A6FF),
            ),
          ),
        ),
        actions: const [SizedBox(width: 48)], // Spacer agar title center
      ),
      body: SafeArea(
        child: Column(
          children: [
            // Progress Bar
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: LinearProgressIndicator(
                  value: (_currentQuestionIndex + 1) / widget.questions.length,
                  minHeight: 6,
                  backgroundColor: const Color(0xFF1E2A38),
                  valueColor: const AlwaysStoppedAnimation<Color>(Color(0xFF00A6FF)),
                ),
              ),
            ),

            Expanded(
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 10),
                    // Challenge X of Y
                    Center(
                      child: Text(
                        "CHALLENGE ${_currentQuestionIndex + 1} OF ${widget.questions.length}",
                        style: const TextStyle(
                          color: Color(0xFF00A6FF),
                          fontSize: 12,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 16),

                    // Pertanyaan Besar
                    Text(
                      question.questionText,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: isDark ? Colors.white : Colors.black87,
                        height: 1.3,
                      ),
                    ),
                    const SizedBox(height: 24),

                    // Ilustrasi Gambar (Contoh: Chip)
                    Container(
                      height: 180,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(20),
                        image: const DecorationImage(
                          image: NetworkImage(
                            'https://placehold.co/600x400/1E2A38/FFF?text=Hardware+Quiz',
                          ),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    const SizedBox(height: 32),

                    // Pilihan Jawaban (1 Kolom, full width – lebih rapi untuk teks panjang)
                    Column(
                      children: List.generate(question.options.length, (index) {
                        final isSelected = _selectedOptionIndex == index;

                        return Padding(
                          padding: const EdgeInsets.only(bottom: 12.0),
                          child: InkWell(
                            onTap: () {
                              setState(() {
                                _selectedOptionIndex = index;
                              });
                            },
                            borderRadius: BorderRadius.circular(30),
                            child: Container(
                              width: double.infinity,
                              padding: const EdgeInsets.symmetric(
                                horizontal: 16,
                                vertical: 14,
                              ),
                              decoration: BoxDecoration(
                                color: isSelected
                                    ? const Color(0xFF00A6FF).withAlpha(30)
                                    : (isDark
                                    ? const Color(0xFF1E2A38)
                                    : Colors.white),
                                borderRadius: BorderRadius.circular(30),
                                border: Border.all(
                                  color: isSelected
                                      ? const Color(0xFF00A6FF)
                                      : (isDark
                                      ? Colors.white10
                                      : Colors.grey[300]!),
                                  width: 2,
                                ),
                              ),
                              child: Text(
                                question.options[index],
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.bold,
                                  color: isDark
                                      ? Colors.white
                                      : Colors.black87,
                                  height: 1.4,
                                ),
                              ),
                            ),
                          ),
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ),

            // Tombol Submit
            Padding(
              padding: const EdgeInsets.all(24),
              child: ElevatedButton(
                onPressed: _selectedOptionIndex != null ? _submitAnswer : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A6FF),
                  foregroundColor: Colors.white,
                  disabledBackgroundColor: const Color(0xFF1E2A38),
                  disabledForegroundColor: Colors.white24,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30),
                  ),
                  elevation: _selectedOptionIndex != null ? 8 : 0,
                  shadowColor: const Color(0xFF00A6FF).withAlpha(100),
                ),
                child: Text(
                  _currentQuestionIndex < widget.questions.length - 1
                      ? 'NEXT'
                      : 'SUBMIT',
                  style: const TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}


// =============================================================================
// 3. HALAMAN HASIL QUIZ (Quiz Result Page)
// =============================================================================
class QuizResultPage extends StatelessWidget {
  final int score;
  final int totalQuestions;
  final List<Question> questions;
  final List<int?> userAnswers;

  const QuizResultPage({
    super.key,
    required this.score,
    required this.totalQuestions,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final percentage = (score / totalQuestions * 100).round();
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF0F1924) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.close, color: isDark ? Colors.white : Colors.black87),
          onPressed: () => Navigator.of(context).popUntil((route) => route.isFirst),
        ),
        title: const Text("Quiz Results", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 20),
          child: Column(
            children: [
              const Spacer(),
              // Icon Trophy Besar Hijau
              const Icon(Icons.emoji_events, size: 100, color: Color(0xFF00E676)),

              const SizedBox(height: 20),

              const Text("HIGH SCORE!", style: TextStyle(color: Color(0xFF00A6FF), fontWeight: FontWeight.bold, letterSpacing: 1.2)),

              const SizedBox(height: 8),

              // Teks Persentase Besar
              Text(
                "$percentage%",
                style: TextStyle(
                  fontSize: 64,
                  fontWeight: FontWeight.w900,
                  color: isDark ? Colors.white : Colors.black87,
                ),
              ),

              // Teks Deskripsi
              Text(
                "You got $score out of $totalQuestions correct",
                style: const TextStyle(
                  fontSize: 16,
                  color: Colors.white70,
                ),
              ),
              const SizedBox(height: 40),

              // Kartu Statistik List
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A38),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Color(0xFF00E676),
                    radius: 12,
                    child: Icon(Icons.check, size: 16, color: Colors.black),
                  ),
                  title: const Text("Correct Answers", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  trailing: Text("$score", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),
              const SizedBox(height: 12),
              Container(
                decoration: BoxDecoration(
                  color: const Color(0xFF1E2A38),
                  borderRadius: BorderRadius.circular(30),
                ),
                child: ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: Colors.redAccent,
                    radius: 12,
                    child: Icon(Icons.close, size: 16, color: Colors.black),
                  ),
                  title: const Text("Incorrect Answers", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  trailing: Text("${totalQuestions - score}", style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 18)),
                ),
              ),

              const Spacer(),

              // Tombol Review (Biru)
              ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => QuizReviewPage(
                        questions: questions,
                        userAnswers: userAnswers,
                      ),
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A6FF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                  elevation: 5,
                  shadowColor: const Color(0xFF00A6FF).withAlpha(100),
                ),
                child: const Text("Review Answers", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),
              const SizedBox(height: 16),

              // Tombol Take Another Quiz (Outline)
              OutlinedButton(
                onPressed: () {
                  Navigator.pop(context); // Kembali ke list quiz
                },
                style: OutlinedButton.styleFrom(
                  foregroundColor: const Color(0xFF00A6FF),
                  side: const BorderSide(color: Color(0xFF00A6FF), width: 2),
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("Take Another Quiz", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
              ),

              const SizedBox(height: 24),

              // Link Back to Home
              TextButton(
                onPressed: () {
                  Navigator.of(context).popUntil((route) => route.isFirst);
                },
                child: const Text(
                  "Back to Home",
                  style: TextStyle(color: Colors.white54),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


// =============================================================================
// 4. HALAMAN REVIEW JAWABAN (Review Answers Page)
// =============================================================================
class QuizReviewPage extends StatelessWidget {
  final List<Question> questions;
  final List<int?> userAnswers;

  const QuizReviewPage({
    super.key,
    required this.questions,
    required this.userAnswers,
  });

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF0F1924) : const Color(0xFFF5F7FA);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text('Review Answers'),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        foregroundColor: isDark ? Colors.white : Colors.black87,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(20),
              itemCount: questions.length,
              itemBuilder: (context, index) {
                return _buildReviewCard(context, index, isDark);
              },
            ),
          ),
          Container(
            padding: const EdgeInsets.all(24),
            decoration: BoxDecoration(
              color: isDark ? const Color(0xFF1E2A38) : Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black.withAlpha(isDark ? 50 : 10),
                  blurRadius: 10,
                  offset: const Offset(0, -5),
                ),
              ],
            ),
            child: SafeArea(
              child: ElevatedButton(
                onPressed: () => Navigator.pop(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF00A6FF),
                  foregroundColor: Colors.white,
                  minimumSize: const Size(double.infinity, 56),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                child: const Text("Back to Results", style: TextStyle(fontWeight: FontWeight.bold)),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildReviewCard(BuildContext context, int index, bool isDark) {
    final question = questions[index];
    final userAnswer = userAnswers[index];
    final correctAnswer = question.correctAnswerIndex;
    final isCorrect = userAnswer == correctAnswer;

    return Container(
      margin: const EdgeInsets.only(bottom: 24),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF1E2A38) : Colors.white,
        borderRadius: BorderRadius.circular(24),
        border: Border.all(
          color: isCorrect ? const Color(0xFF00E676).withAlpha(100) : Colors.redAccent.withAlpha(100),
          width: 1,
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  "Question ${index + 1}/${questions.length}",
                  style: const TextStyle(
                    color: Colors.white54,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text(
              question.questionText,
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
                color: isDark ? Colors.white : Colors.black87,
              ),
            ),
            const SizedBox(height: 20),
            ...List.generate(question.options.length, (optIndex) {
              final isSelected = userAnswer == optIndex;
              final isCorrectOption = correctAnswer == optIndex;

              Color bgColor = Colors.transparent;
              Color borderColor = isDark ? Colors.white10 : Colors.grey[200]!;
              Color textColor = isDark ? Colors.white70 : Colors.black54;
              IconData? icon;
              Color iconColor = Colors.transparent;

              if (isCorrectOption) {
                // Jawaban Benar (Selalu Hijau)
                borderColor = const Color(0xFF00E676);
                bgColor = const Color(0xFF00E676).withAlpha(20);
                textColor = Colors.white;
                icon = Icons.check_circle;
                iconColor = const Color(0xFF00E676);
              } else if (isSelected && !isCorrectOption) {
                // Jawaban Salah User (Merah)
                borderColor = Colors.redAccent;
                bgColor = Colors.redAccent.withAlpha(20);
                textColor = Colors.white;
                icon = Icons.cancel;
                iconColor = Colors.redAccent;
              }

              return Container(
                margin: const EdgeInsets.only(bottom: 12),
                padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
                decoration: BoxDecoration(
                  color: bgColor,
                  borderRadius: BorderRadius.circular(30),
                  border: Border.all(color: borderColor),
                ),
                child: Row(
                  children: [
                    if (icon != null) ...[
                      Icon(icon, color: iconColor, size: 20),
                      const SizedBox(width: 12),
                    ] else ...[
                      // Radio button kosong
                      Container(
                        width: 20, height: 20,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(color: Colors.white54),
                        ),
                      ),
                      const SizedBox(width: 12),
                    ],
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question.options[optIndex],
                            style: TextStyle(
                                color: textColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 14
                            ),
                          ),
                          if (isSelected && isCorrectOption)
                            const Text("Your Answer & Correct Answer", style: TextStyle(color: Color(0xFF00E676), fontSize: 10)),
                          if (isSelected && !isCorrectOption)
                            const Text("Your Answer", style: TextStyle(color: Colors.redAccent, fontSize: 10)),
                          if (!isSelected && isCorrectOption)
                            const Text("Correct Answer", style: TextStyle(color: Color(0xFF00E676), fontSize: 10)),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }),
          ],
        ),
      ),
    );
  }
}