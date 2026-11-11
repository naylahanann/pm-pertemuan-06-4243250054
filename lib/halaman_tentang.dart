import 'package:flutter/material.dart';

/// Halaman Tentang: informasi singkat aplikasi dan pembuatnya.
class Tentang extends StatelessWidget {
  const Tentang({super.key});

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('Tentang')),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Wisata Sumatera Utara', style: teks.titleLarge),
                  const SizedBox(height: 8),
                  const Text(
                    'Katalog destinasi wisata Sumatera Utara. Dibuat untuk '
                    'Tugas Rutin 6 mata kuliah Pemrograman Mobile dengan '
                    'Flutter dan go_router.',
                  ),
                  const SizedBox(height: 16),
                  const Text('Nama : Nayla Luthfiah Hanan'),
                  const Text('NIM  : 4243250054'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}