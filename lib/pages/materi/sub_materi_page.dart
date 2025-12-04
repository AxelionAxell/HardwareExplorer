import 'package:flutter/material.dart';
import '../../models/materi.dart';
import '../../data/dummy_data.dart';

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
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => DetailMateriPage(materi: materi),
      ),
    );
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

// --- 2. DETAIL MATERI PAGE (HEADER FOTO + KONTEN DINAMIS) ---
class DetailMateriPage extends StatelessWidget {
  final Materi materi;
  const DetailMateriPage({super.key, required this.materi});

  @override
  Widget build(BuildContext context) {
    // Ambil konten dinamis dari mapping di SubMateriPage
    final dynamicContentSource = SubMateriPage.getContent(materi.title);

    List<Widget> dynamicContent = [];
    if (dynamicContentSource is List<Widget> Function(BuildContext)) {
      dynamicContent = dynamicContentSource(context);
    } else if (dynamicContentSource is List<Widget>) {
      dynamicContent = dynamicContentSource;
    } else {
      dynamicContent = [
        const SizedBox(height: 16),
        const Text(
          "Konten detail belum tersedia untuk materi ini.",
          style: TextStyle(fontStyle: FontStyle.italic),
        ),
      ];
    }

    final isDark = Theme.of(context).brightness == Brightness.dark;

    return Scaffold(
      appBar: AppBar(
        title: Text(materi.title),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // ====== HEADER GAMBAR SESUAI MATERI ======
            Padding(
              padding: const EdgeInsets.fromLTRB(16, 16, 16, 0),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: AspectRatio(
                  aspectRatio: 16 / 9,
                  child: Image.asset(
                    materi.detailImagePath,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return Container(
                        color: Colors.grey[800],
                        child: const Center(
                          child: Icon(
                            Icons.image_not_supported,
                            color: Colors.grey,
                            size: 48,
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ),

            const SizedBox(height: 16),

            // ====== JUDUL & DESKRIPSI SINGKAT ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(
                materi.title,
                style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            if (materi.description.isNotEmpty) ...[
              const SizedBox(height: 8),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text(
                  materi.description,
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                    fontSize: 14,
                    height: 1.5,
                    color: isDark ? Colors.white70 : Colors.black87,
                  ),
                ),
              ),
            ],

            const SizedBox(height: 24),

            // ====== KONTEN LENGKAP DARI DOCS (Module1Content/2/3/4) ======
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: dynamicContent,
              ),
            ),
          ],
        ),
      ),
    );
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