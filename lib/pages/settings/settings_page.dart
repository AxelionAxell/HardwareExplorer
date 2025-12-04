import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:url_launcher/url_launcher.dart';
import 'dart:io';

class SettingsPage extends StatelessWidget {
  final String username;
  final String bio;
  final File? image;
  final Function(ThemeMode) onThemeChanged;
  final Function(String, String, File?) onProfileUpdated;
  final VoidCallback onLogout;

  const SettingsPage({
    super.key,
    required this.username,
    required this.bio,
    required this.image,
    required this.onThemeChanged,
    required this.onProfileUpdated,
    required this.onLogout,
  });

  Future<void> _launchURL(BuildContext context, String urlString) async {
    final Uri url = Uri.parse(urlString);
    try {
      if (!await launchUrl(url, mode: LaunchMode.externalApplication)) {
        throw 'Could not launch $url';
      }
    } catch (e) {
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Tidak dapat membuka link: $e')));
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF0F1924) : const Color(0xFFF5F7FA);
    final cardColor = isDark ? const Color(0xFF1E2A38) : Colors.white;
    final textColor = isDark ? Colors.white : Colors.black87;
    final subTextColor = isDark ? Colors.white54 : Colors.grey[600];

    // Inisial untuk Foto Profil (Jika tidak ada gambar)
    final String initial = username.isNotEmpty ? username[0].toUpperCase() : '?';

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        title: const Text("Settings"),
        centerTitle: true,
        backgroundColor: bgColor,
        elevation: 0,
        foregroundColor: textColor,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // ================== 1. BAGIAN PROFILE ==================
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => EditProfilePage(
                      initialUsername: username,
                      initialBio: bio,
                      initialImage: image,
                      onProfileUpdated: onProfileUpdated,
                    ),
                  ),
                );
              },
              child: Stack(
                children: [
                  Container(
                    width: 120,
                    height: 120,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                      border: Border.all(color: cardColor, width: 4),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withAlpha(isDark ? 50 : 20),
                          blurRadius: 15,
                          offset: const Offset(0, 5),
                        ),
                      ],
                      image: image != null
                          ? DecorationImage(image: FileImage(image!), fit: BoxFit.cover)
                          : null,
                    ),
                    child: image == null
                        ? Center(
                      child: Text(
                        initial,
                        style: TextStyle(
                          fontSize: 48,
                          fontWeight: FontWeight.bold,
                          color: Theme.of(context).primaryColor,
                        ),
                      ),
                    )
                        : null,
                  ),
                  Positioned(
                    bottom: 0,
                    right: 0,
                    child: Container(
                      padding: const EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        color: Theme.of(context).primaryColor,
                        shape: BoxShape.circle,
                        border: Border.all(color: bgColor, width: 2),
                      ),
                      child: const Icon(Icons.edit, size: 16, color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 16),
            Text(
              username,
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: textColor,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              bio.isEmpty ? "No bio yet" : bio,
              style: TextStyle(
                fontSize: 14,
                color: subTextColor,
              ),
              textAlign: TextAlign.center,
            ),

            const SizedBox(height: 32),

            // ================== 2. BAGIAN PREFERENCES ==================
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Preferences",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: ListTile(
                leading: Container(
                  padding: const EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    color: isDark ? Colors.white10 : Colors.grey[100],
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Icon(Icons.dark_mode_outlined, color: textColor),
                ),
                title: Text("Theme", style: TextStyle(fontWeight: FontWeight.w600, color: textColor)),
                trailing: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    Text(
                      isDark ? "Dark" : "Light",
                      style: TextStyle(color: subTextColor, fontSize: 14),
                    ),
                    const SizedBox(width: 8),
                    Switch(
                      value: isDark,
                      activeThumbColor: Colors.cyan,
                      onChanged: (val) => onThemeChanged(val ? ThemeMode.dark : ThemeMode.light),
                    ),
                  ],
                ),
              ),
            ),

            const SizedBox(height: 32),

            // ================== 3. BAGIAN HELP & SUPPORT ==================
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Help & Support",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: textColor,
                ),
              ),
            ),
            const SizedBox(height: 12),
            Container(
              decoration: BoxDecoration(
                color: cardColor,
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  _buildSupportTile(
                    context,
                    icon: Icons.camera_alt_outlined,
                    title: "Instagram",
                    subtitle: "@Axelionnaxell",
                    onTap: () => _launchURL(context, "https://www.instagram.com/axelionnaxell/"),
                    isDark: isDark,
                    textColor: textColor,
                    subTextColor: subTextColor,
                  ),
                  Divider(height: 1, color: isDark ? Colors.white10 : Colors.grey[200], indent: 60),
                  _buildSupportTile(
                    context,
                    icon: Icons.code,
                    title: "GitHub",
                    subtitle: "Axelion Axell",
                    onTap: () => _launchURL(context, "https://github.com/AxelionAxell"),
                    isDark: isDark,
                    textColor: textColor,
                    subTextColor: subTextColor,
                  ),
                  Divider(height: 1, color: isDark ? Colors.white10 : Colors.grey[200], indent: 60),
                  _buildSupportTile(
                    context,
                    icon: Icons.email_outlined,
                    title: "Email Support",
                    subtitle: "axelionaxell@gmail.com",
                    onTap: () => _launchURL(context, "mailto:axelionaxell@gmail.com"),
                    isDark: isDark,
                    textColor: textColor,
                    subTextColor: subTextColor,
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            // ================== 4. TOMBOL LOGOUT ==================
            ElevatedButton(
              onPressed: onLogout,
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF03A9F4), // Warna Biru cerah sesuai referensi
                foregroundColor: Colors.white,
                minimumSize: const Size(double.infinity, 56),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                elevation: 0,
              ),
              child: const Text(
                "Logout",
                style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            const SizedBox(height: 24),
          ],
        ),
      ),
    );
  }

  Widget _buildSupportTile(
      BuildContext context, {
        required IconData icon,
        required String title,
        required String subtitle,
        required VoidCallback onTap,
        required bool isDark,
        required Color textColor,
        required Color? subTextColor,
      }) {
    return ListTile(
      onTap: onTap,
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 4),
      leading: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: isDark ? Colors.white10 : Colors.grey[100],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Icon(icon, color: textColor),
      ),
      title: Text(title, style: TextStyle(fontWeight: FontWeight.w600, color: textColor)),
      subtitle: Text(subtitle, style: TextStyle(color: subTextColor, fontSize: 13)),
      trailing: Icon(Icons.chevron_right, color: subTextColor, size: 20),
    );
  }
}

// ================== EDIT PROFILE PAGE (TETAP ADA) ==================
class EditProfilePage extends StatefulWidget {
  final String initialUsername;
  final String initialBio;
  final File? initialImage;
  final Function(String, String, File?) onProfileUpdated;

  const EditProfilePage({super.key, required this.initialUsername, required this.initialBio, required this.initialImage, required this.onProfileUpdated});

  @override
  State<EditProfilePage> createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  late TextEditingController _usernameController;
  late TextEditingController _bioController;
  File? _tempImage;

  @override
  void initState() {
    super.initState();
    _usernameController = TextEditingController(text: widget.initialUsername);
    _bioController = TextEditingController(text: widget.initialBio);
    _tempImage = widget.initialImage;
  }

  @override
  void dispose() {
    _usernameController.dispose();
    _bioController.dispose();
    super.dispose();
  }

  void _save() {
    widget.onProfileUpdated(_usernameController.text, _bioController.text, _tempImage);
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final bgColor = isDark ? const Color(0xFF0F1924) : Colors.white;

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
          title: const Text("Edit Profile"),
          backgroundColor: bgColor,
          foregroundColor: isDark ? Colors.white : Colors.black,
          actions: [IconButton(icon: const Icon(Icons.check), onPressed: _save)]
      ),
      body: ListView(padding: const EdgeInsets.all(24), children: [
        Center(
          child: Stack(
            children: [
              CircleAvatar(
                radius: 60,
                backgroundColor: Colors.grey[200],
                backgroundImage: _tempImage != null ? FileImage(_tempImage!) : null,
                child: _tempImage == null
                    ? Text(widget.initialUsername.isNotEmpty ? widget.initialUsername[0].toUpperCase() : '?', style: const TextStyle(fontSize: 40))
                    : null,
              ),
              Positioned(
                bottom: 0,
                right: 0,
                child: CircleAvatar(
                  backgroundColor: Colors.blue,
                  radius: 20,
                  child: IconButton(
                    icon: const Icon(Icons.camera_alt, color: Colors.white, size: 20),
                    onPressed: () async {
                      final picker = ImagePicker();
                      final img = await picker.pickImage(source: ImageSource.gallery);
                      if(img != null) setState(() => _tempImage = File(img.path));
                    },
                  ),
                ),
              )
            ],
          ),
        ),
        const SizedBox(height: 32),
        TextField(
          controller: _usernameController,
          decoration: InputDecoration(
            labelText: "Username",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: isDark ? const Color(0xFF1E2A38) : Colors.grey[50],
          ),
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
        ),
        const SizedBox(height: 24),
        TextField(
          controller: _bioController,
          decoration: InputDecoration(
            labelText: "Bio",
            border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
            filled: true,
            fillColor: isDark ? const Color(0xFF1E2A38) : Colors.grey[50],
          ),
          style: TextStyle(color: isDark ? Colors.white : Colors.black),
          maxLines: 3,
        ),
      ]),
    );
  }
}