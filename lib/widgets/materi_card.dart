import 'package:flutter/material.dart';
import '../models/materi.dart';
import '../pages/materi/materi_page.dart';
// Import this to access DetailMateriPage

class MateriCard extends StatelessWidget {
  final Materi materi;

  const MateriCard({super.key, required this.materi});

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: const BorderRadius.vertical(top: Radius.circular(15)),
            child: Image.asset(
              materi.homeImagePath,
              height: 180,
              width: double.infinity,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                return Container(
                  height: 180,
                  color: Colors.grey[800],
                  child: const Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(Icons.image_not_supported, color: Colors.grey, size: 50),
                        SizedBox(height: 8),
                        Text('Gagal memuat gambar'),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  materi.title,
                  style: Theme.of(context).textTheme.headlineSmall?.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  materi.description,
                  style: Theme.of(context).textTheme.bodyLarge,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 16),
                Align(
                  alignment: Alignment.bottomRight,
                  child: ElevatedButton(
                    onPressed: () {
                      // Navigate to DetailMateriPage defined in sub_materi_page.dart
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => DetailMateriPage(materi: materi)),
                      );
                    },
                    child: const Text('Mulai Belajar'),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}