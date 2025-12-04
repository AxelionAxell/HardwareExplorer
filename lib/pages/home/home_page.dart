import 'package:flutter/material.dart';
import '../../data/dummy_data.dart';
import '../../models/module.dart';
import '../../widgets/materi_card.dart';
import '../materi/sub_materi_page.dart'; // Import halaman SubMateriPage yang baru

class HomePageContent extends StatefulWidget {
  final VoidCallback onSettingsTap;
  const HomePageContent({super.key, required this.onSettingsTap});

  @override
  State<HomePageContent> createState() => _HomePageContentState();
}

class _HomePageContentState extends State<HomePageContent> {
  String _searchQuery = "";

  // --- LOGIKA NAVIGASI MODUL (DIPERBAIKI) ---
  void _handleModuleTap(Module module) {
    if (module.moduleNumber == 'Module 1') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubMateriPage(
            moduleTitle: 'Dasar Perangkat Keras',
            materiList: module1Materi, // Mengirim data Module 1
          ),
        ),
      );
    } else if (module.moduleNumber == 'Module 2') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubMateriPage(
            moduleTitle: 'Input & Output Devices',
            materiList: module2Materi, // Mengirim data Module 2
          ),
        ),
      );
    } else if (module.moduleNumber == 'Module 3') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubMateriPage(
            moduleTitle: 'Storage & Memory',
            materiList: module3Materi, // Mengirim data Module 3
          ),
        ),
      );
    } else if (module.moduleNumber == 'Module 4') {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => SubMateriPage(
            moduleTitle: 'Dasar-Dasar Jaringan',
            materiList: module4Materi, // Mengirim data Module 4
          ),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // 1. Cek apakah sedang mencari
    final bool isSearching = _searchQuery.isNotEmpty;

    // 2. Filter Materi (Gunakan allMateri dari dummy_data yang sudah mencakup semua module)
    final filteredMateri = allMateri.where((materi) {
      final query = _searchQuery.toLowerCase();
      if (query.isEmpty) return true;
      return materi.title.toLowerCase().contains(query) ||
          materi.description.toLowerCase().contains(query);
    }).toList();

    // 3. Filter Modules
    final filteredModules = isSearching
        ? allModules.where((module) {
      final query = _searchQuery.toLowerCase();
      return module.title.toLowerCase().contains(query) ||
          module.description.toLowerCase().contains(query) ||
          module.moduleNumber.toLowerCase().contains(query);
    }).toList()
        : <Module>[];

    final bool isNotFound =
        isSearching && filteredMateri.isEmpty && filteredModules.isEmpty;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Home",
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.settings_outlined),
            onPressed: widget.onSettingsTap,
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10.0),
        children: [
          const SizedBox(height: 10),

          // Headline
          Text(
            'Tingkatkan Pengetahuan\nPerangkat Keras Anda!',
            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
              fontWeight: FontWeight.bold,
              height: 1.2,
              fontSize: 24,
            ),
            textAlign: TextAlign.center,
          ),

          const SizedBox(height: 30),

          // Search Box
          TextField(
            onChanged: (value) {
              setState(() {
                _searchQuery = value;
              });
            },
            style: const TextStyle(fontSize: 16),
            decoration: InputDecoration(
              hintText: 'Cari pelajaran atau modul...',
              prefixIcon: const Icon(Icons.search, color: Colors.grey),
              filled: true,
              fillColor: Theme.of(context).brightness == Brightness.dark
                  ? const Color(0xFF16222E)
                  : Colors.grey[200],
              contentPadding: const EdgeInsets.symmetric(vertical: 16),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide(
                  color: Theme.of(context).brightness == Brightness.dark
                      ? Colors.white24
                      : Colors.grey[400]!,
                  width: 1,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: const BorderSide(color: Colors.cyan, width: 2),
              ),
            ),
          ),

          const SizedBox(height: 30),

          // Hasil Pencarian
          if (isNotFound)
            Center(
              child: Padding(
                padding: const EdgeInsets.only(top: 40),
                child: Column(
                  children: [
                    Icon(Icons.search_off, size: 60, color: Colors.grey[600]),
                    const SizedBox(height: 16),
                    Text(
                      "Pelajaran tidak ditemukan",
                      style: TextStyle(color: Colors.grey[600], fontSize: 16),
                    ),
                  ],
                ),
              ),
            )
          else ...[
            // A. Bagian Modules (Hanya muncul jika ada pencarian & hasil)
            if (filteredModules.isNotEmpty) ...[
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Modules Found (${filteredModules.length})",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
              ...filteredModules.map((module) => Card(
                margin: const EdgeInsets.only(bottom: 16.0),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
                child: InkWell(
                  onTap: () => _handleModuleTap(module),
                  borderRadius: BorderRadius.circular(10),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Row(
                      children: [
                        // Gambar Module (Icon Kecil untuk Search Result)
                        ClipRRect(
                          borderRadius: BorderRadius.circular(8),
                          child: Image.asset(
                            module.imagePath,
                            width: 50,
                            height: 50,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) =>
                                Container(
                                    width: 50,
                                    height: 50,
                                    color: Colors.grey[800],
                                    child: const Icon(Icons.image_not_supported,
                                        size: 20, color: Colors.white)),
                          ),
                        ),
                        const SizedBox(width: 16),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(module.moduleNumber,
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall
                                      ?.copyWith(
                                      color: Colors.cyan,
                                      fontWeight: FontWeight.bold)),
                              const SizedBox(height: 4),
                              Text(module.title,
                                  style: Theme.of(context)
                                      .textTheme
                                      .titleMedium
                                      ?.copyWith(
                                      fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                        const Icon(Icons.arrow_forward_ios,
                            size: 14, color: Colors.grey),
                      ],
                    ),
                  ),
                ),
              )),
              const SizedBox(height: 10),
              if (filteredMateri.isNotEmpty)
                const Divider(thickness: 1, height: 30),
            ],

            // B. Bagian Materi (CPU, RAM, dll)
            if (isSearching &&
                filteredMateri.isNotEmpty &&
                filteredModules.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(bottom: 12.0),
                child: Text(
                  "Materi Found (${filteredMateri.length})",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),

            ...filteredMateri.map((materi) => Padding(
              padding: const EdgeInsets.only(bottom: 20.0),
              child: MateriCard(materi: materi),
            )),
          ],

          const SizedBox(height: 20),
        ],
      ),
    );
  }
}