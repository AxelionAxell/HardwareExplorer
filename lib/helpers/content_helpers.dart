// lib/helpers/content_helpers.dart
import 'package:flutter/material.dart';

class ContentHelpers {
  // HEADER BESAR (JUDUL UTAMA MATERI)
  static Widget header(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12.0, top: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleLarge?.copyWith(
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  // SUBTITLE (JUDUL KECIL: Pengertian, Contoh, Cara Kerja, dll)
  static Widget subTitle(BuildContext context, String text) {
    return Padding(
      padding: const EdgeInsets.only(top: 16.0, bottom: 8.0),
      child: Text(
        text,
        style: Theme.of(context).textTheme.titleMedium?.copyWith(
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }

  // PARAGRAF BIASA (PAKAI TextSpan supaya bisa bold/kasih format kalau perlu)
  static Widget paragraph(BuildContext context, List<InlineSpan> spans) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: RichText(
        text: TextSpan(
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
            height: 1.6,
          ),
          children: spans,
        ),
      ),
    );
  }

  static Widget bulletList(BuildContext context, List<String> items) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      height: 1.5,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((text) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  '),
                Expanded(
                  child: Text(
                    text,
                    style: style,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}

  // SPASI VERTICAL (opsional kalau mau pakai)
  Widget spacing([double height = 12]) {
    return SizedBox(height: height);
  }

  // BULLET LIST RAPI
  Widget bulletList(BuildContext context, List<String> items) {
    final style = Theme.of(context).textTheme.bodyMedium?.copyWith(
      height: 1.5,
    );

    return Padding(
      padding: const EdgeInsets.only(top: 4.0, bottom: 12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: items.map((text) {
          return Padding(
            padding: const EdgeInsets.only(bottom: 4.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('•  '),
                Expanded(
                  child: Text(
                    text,
                    style: style,
                  ),
                ),
              ],
            ),
          );
        }).toList(),
      ),
    );
  }

