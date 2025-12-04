import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'theme/app_theme.dart';
import 'pages/login/login_page.dart';
import 'pages/shell/main_shell.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  final SharedPreferences prefs = await SharedPreferences.getInstance();
  final String? username = prefs.getString('username');
  final String? bio = prefs.getString('bio');
  final String? imagePath = prefs.getString('imagePath');

  runApp(MyApp(
    initialUsername: username,
    initialBio: bio,
    initialImagePath: imagePath,
  ));
}

class MyApp extends StatefulWidget {
  final String? initialUsername;
  final String? initialBio;
  final String? initialImagePath;

  const MyApp({
    super.key,
    this.initialUsername,
    this.initialBio,
    this.initialImagePath,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  ThemeMode _themeMode = ThemeMode.dark;

  void _setThemeMode(ThemeMode mode) {
    setState(() {
      _themeMode = mode;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Belajar Hardware',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      darkTheme: AppTheme.darkTheme,
      themeMode: _themeMode,
      home: (widget.initialUsername != null && widget.initialUsername!.isNotEmpty)
          ? MainShell(
        username: widget.initialUsername!,
        initialBio: widget.initialBio,
        initialImagePath: widget.initialImagePath,
        onThemeChanged: _setThemeMode,
      )
          : LoginPage(
        onThemeChanged: _setThemeMode,
      ),
    );
  }
}
