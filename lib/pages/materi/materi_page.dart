import 'package:flutter/material.dart';
import '../../models/materi.dart';
import '../../models/module.dart';
import '../../data/dummy_data.dart';

// --- 0. HALAMAN UTAMA MATERI (UNTUK TAB DI BOTTOM NAV) ---
class MateriPage extends StatelessWidget {
  const MateriPage({super.key});

  void _openSubMateri(BuildContext context, Module module) {
    // Pilih list materi berdasarkan moduleNumber
    List<Materi> materiList;

    switch (module.moduleNumber) {
      case 'Module 1':
        materiList = module1Materi;
        break;
      case 'Module 2':
        materiList = module2Materi;
        break;
      case 'Module 3':
        materiList = module3Materi;
        break;
      case 'Module 4':
        materiList = module4Materi;
        break;
      default:
        materiList = [];
    }

    if (materiList.isEmpty) {
      // Kalau belum ada isi, bisa nanti dibikin dialog "coming soon"
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Materi untuk module ini belum tersedia.')),
      );
      return;
    }

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (_) => SubMateriPage(
          moduleTitle: module.title,
          materiList: materiList,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Materi'),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16.0),
        itemCount: allModules.length, // dari dummy_data.dart
        itemBuilder: (context, index) {
          final module = allModules[index];

          return Card(
            margin: const EdgeInsets.only(bottom: 16.0),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12),
            ),
            elevation: 4,
            child: InkWell(
              borderRadius: BorderRadius.circular(12),
              onTap: () => _openSubMateri(context, module),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                        module.imagePath,
                        width: 72,
                        height: 72,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          width: 72,
                          height: 72,
                          color: Colors.grey[800],
                          child: const Icon(Icons.image_not_supported, color: Colors.grey),
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            module.moduleNumber,
                            style: Theme.of(context).textTheme.labelMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                              color: Theme.of(context).colorScheme.primary,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            module.title,
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            module.description,
                            style: Theme.of(context).textTheme.bodySmall?.copyWith(fontSize: 12),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}


// --- 1. SUB MATERI PAGE (DINAMIS UNTUK SEMUA MODULE) ---
class SubMateriPage extends StatelessWidget {
  final String moduleTitle;
  final List<Materi> materiList;

  const SubMateriPage({
    super.key,
    required this.moduleTitle,
    required this.materiList,
  });

  // Helper function to get content based on materi title
  // Made static so it can be reused by DetailMateriPage
  static dynamic getContent(String title) {
    if (title.contains('Central Processing Unit') || title == 'CPU') return Module1Content.cpuContent;
    if (title.contains('Motherboard')) return Module1Content.motherboardContent;
    if (title.contains('Random Access Memory') || title == 'RAM') return Module1Content.ramContent;
    if (title.contains('Graphics Processing Unit') || title == 'GPU') return Module1Content.gpuContent;
    if (title.contains('Storage') && title.contains('Media Penyimpanan')) return Module1Content.storageContent;
    if (title.contains('Power Supply Unit') || title == 'PSU') return Module1Content.psuContent;

    if (title == 'Perangkat Input') return Module2Content.perangkatInput;
    if (title == 'Perangkat Output') return Module2Content.perangkatOutput;

    if (title == 'Pengertian Storage') return Module3Content.pengertianStorage;
    if (title == 'Jenis Storage') return Module3Content.jenisStorage;
    if (title == 'Jenis Media Penyimpanan') return Module3Content.jenisMediaPenyimpanan;
    if (title == 'Satuan Kapasitas') return Module3Content.satuanKapasitas;
    if (title == 'Tips Merawat Storage') return Module3Content.tipsMerawat;

    if (title == 'Pengertian Jaringan') return Module4Content.pengertianJaringan;
    if (title == 'Manfaat Jaringan') return Module4Content.manfaatJaringan;
    if (title == 'Jenis Jaringan') return Module4Content.jenisJaringan;
    if (title == 'Komponen Utama') return Module4Content.komponenJaringan;
    if (title == 'Jenis Koneksi') return Module4Content.jenisKoneksi;
    if (title == 'Istilah Dasar') return Module4Content.istilahDasar;
    if (title == 'Keamanan Jaringan') return Module4Content.keamananJaringan;

    return null;
  }

  void _handleMateriTap(BuildContext context, Materi materi) {
    final content = getContent(materi.title);

    if (content != null) {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => GenericMateriPage(title: materi.title, content: content)
          )
      );
    } else {
      Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) => MateriComingSoonPage(title: materi.title)
          )
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: Text(moduleTitle),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 24.0),
        itemCount: materiList.length,
        itemBuilder: (context, index) {
          final materi = materiList[index];
          return Card(
            margin: const EdgeInsets.only(bottom: 20.0),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            elevation: 4,
            child: InkWell(
              onTap: () => _handleMateriTap(context, materi),
              borderRadius: BorderRadius.circular(10),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.asset(
                          materi.detailImagePath,
                          width: 80,
                          height: 80,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) => Container(
                              width: 80,
                              height: 80,
                              color: Colors.grey[800],
                              child: const Icon(Icons.image_not_supported, color: Colors.grey)
                          )
                      ),
                    ),
                    const SizedBox(width: 16),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            materi.title,
                            style: Theme.of(context).textTheme.titleLarge?.copyWith(
                                fontWeight: FontWeight.bold,
                                fontSize: 16
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                              materi.description,
                              style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                  fontSize: 13
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis
                          ),
                        ],
                      ),
                    ),
                    const Icon(Icons.arrow_forward_ios, size: 16, color: Colors.grey),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

// --- 2. DETAIL MATERI PAGE (Updated to show rich content) ---
class DetailMateriPage extends StatelessWidget {
  final Materi materi;
  const DetailMateriPage({super.key, required this.materi});

  @override
  Widget build(BuildContext context) {
    // Reuse the mapping logic
    final content = SubMateriPage.getContent(materi.title);

    if (content != null) {
      return GenericMateriPage(title: materi.title, content: content);
    } else {
      // Fallback layout if content is missing
      return Scaffold(
        appBar: AppBar(title: Text(materi.title), backgroundColor: Theme.of(context).scaffoldBackgroundColor),
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Image.asset(
                      materi.detailImagePath,
                      width: double.infinity,
                      height: 250,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) => Container(
                          height: 250,
                          color: Colors.grey[800],
                          child: const Center(child: Icon(Icons.image_not_supported, color: Colors.grey, size: 50))
                      )
                  ),
                ),
                const SizedBox(height: 24),
                Text(materi.title, style: Theme.of(context).textTheme.headlineMedium),
                const SizedBox(height: 16),
                Text(
                    materi.description,
                    style: Theme.of(context).textTheme.bodyLarge?.copyWith(fontSize: 16, height: 1.5)
                ),
                const SizedBox(height: 16),
                const Text("Detail content not available yet.", style: TextStyle(fontStyle: FontStyle.italic)),
              ],
            ),
          ),
        ),
      );
    }
  }
}

// --- 3. GENERIC MATERI PAGE ---
class GenericMateriPage extends StatelessWidget {
  final String title;
  final dynamic content;
  const GenericMateriPage({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    List<Widget> dynamicContent;
    if (content is List<Widget> Function(BuildContext)) {
      dynamicContent = content(context);
    } else if (content is List<Widget>) {
      dynamicContent = content;
    } else {
      dynamicContent = [const Text("Error: Tipe konten tidak didukung.")];
    }

    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: dynamicContent),
        ),
      ),
    );
  }
}

// --- 4. MATERI COMING SOON PAGE ---
class MateriComingSoonPage extends StatelessWidget {
  final String title;
  const MateriComingSoonPage({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title), backgroundColor: Theme.of(context).scaffoldBackgroundColor),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.hourglass_empty, size: 80, color: Colors.grey),
            const SizedBox(height: 24),
            Text('Segera Hadir!', style: Theme.of(context).textTheme.headlineSmall),
            const SizedBox(height: 8),
            Text('Konten untuk "$title" sedang dibuat.'),
          ],
        ),
      ),
    );
  }
}