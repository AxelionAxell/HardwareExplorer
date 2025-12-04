import 'package:flutter/material.dart';
import '../shell/main_shell.dart';

class WelcomePage extends StatelessWidget {
  final String username;
  final Function(ThemeMode) onThemeChanged;

  const WelcomePage({
    super.key,
    required this.username,
    required this.onThemeChanged,
  });

  void _goToMain(BuildContext context) {
    const defaultBio = "None";

    Navigator.pushReplacement(
      context,
      MaterialPageRoute(
        builder: (_) => MainShell(
          username: username,
          initialBio: defaultBio,
          initialImagePath: null,
          onThemeChanged: onThemeChanged,
        ),
      ),
    );
  }

  Widget _featureTile(
      BuildContext context, {
        required IconData icon,
        required String title,
      }) {
    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      decoration: BoxDecoration(
        color: isDark ? const Color(0xFF111923) : Colors.grey[200],
        borderRadius: BorderRadius.circular(16),
      ),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
        leading: Container(
          width: 40,
          height: 40,
          decoration: BoxDecoration(
            // ignore: deprecated_member_use
            color: const Color(0xFF007BFF).withOpacity(0.15),
            borderRadius: BorderRadius.circular(12),
          ),
          child: const Icon(Icons.computer_rounded, color: Color(0xFF00A6FF)),
        ),
        title: Text(
          title,
          style: Theme.of(context).textTheme.bodyLarge?.copyWith(
            fontWeight: FontWeight.w600,
          ),
        ),
        trailing: const Icon(Icons.chevron_right_rounded,
            color: Colors.white60, size: 20),
        onTap: () => _goToMain(context),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final displayName = username.isEmpty ? 'User' : username;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // ====== HEADER / GAMBAR YANG IKUT SCROLL ======
              ClipRRect(
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(24),
                  bottomRight: Radius.circular(24),
                ),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    'assets/images/bg.png',
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // ====== KONTEN ======
              Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Selamat Datang, $displayName!',
                      style: Theme.of(context)
                          .textTheme
                          .headlineMedium
                          ?.copyWith(
                        fontWeight: FontWeight.bold,
                        fontSize: 26,
                      ),
                    ),
                    const SizedBox(height: 12),

                    Text(
                      'Aplikasi ini dirancang untuk membantumu mempelajari komponen dasar komputer dengan cara yang mudah dipahami, interaktif, dan menyenangkan. Semua materi disajikan secara lengkap, visual, dan cocok untuk pemula maupun pelajar yang ingin memahami hardware komputer lebih dalam.',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        fontSize: 15,
                        height: 1.5,
                        color: isDark
                            ? Colors.white70
                            // ignore: deprecated_member_use
                            : Colors.black.withOpacity(0.8),
                      ),
                    ),

                    const SizedBox(height: 24),

                    Container(
                      height: 1,
                      color: isDark ? Colors.white12 : Colors.black12,
                    ),

                    const SizedBox(height: 20),

                    Text(
                      'Fitur Utama',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 16),

                    _featureTile(
                      context,
                      icon: Icons.menu_book_rounded,
                      title: 'Belajar Materi',
                    ),
                    _featureTile(
                      context,
                      icon: Icons.quiz_rounded,
                      title: 'Quiz Interaktif',
                    ),
                    _featureTile(
                      context,
                      icon: Icons.support_agent_rounded,
                      title: 'Chat Support AI',
                    ),
                    _featureTile(
                      context,
                      icon: Icons.view_in_ar_rounded,
                      title: 'Explore Hardware',
                    ),

                    const SizedBox(height: 24),

                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: () => _goToMain(context),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF00A6FF),
                          foregroundColor: Colors.white,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18),
                          ),
                        ),
                        child: const Text(
                          'Mulai Belajar',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
