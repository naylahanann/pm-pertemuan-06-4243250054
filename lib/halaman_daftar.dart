import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wisata_sumut/destinasi.dart';

/// Halaman daftar: grid yang jumlah kolomnya mengikuti lebar ruang yang
/// tersedia (LayoutBuilder), bukan lebar layar seluruhnya.
class DaftarDestinasi extends StatelessWidget {
  const DaftarDestinasi({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Wisata Sumatera Utara')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final kolom = switch (constraints.maxWidth) {
            < 600 => 2,
            < 900 => 3,
            _ => 4,
          };
          return GridView.builder(
            padding: const EdgeInsets.all(16),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: kolom,
              mainAxisSpacing: 12,
              crossAxisSpacing: 12,
              childAspectRatio: 0.85,
            ),
            itemCount: daftarDestinasi.length,
            itemBuilder: (context, i) =>
                KartuDestinasi(destinasi: daftarDestinasi[i]),
          );
        },
      ),
    );
  }
}

/// Kartu satu destinasi. Diketuk untuk membuka halaman detailnya.
class KartuDestinasi extends StatelessWidget {
  const KartuDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: () => context.go('/destinasi/${destinasi.id}'),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: ColoredBox(
                color: skema.primaryContainer,
                child: Center(
                  child: Icon(
                    destinasi.ikon,
                    size: 48,
                    color: skema.onPrimaryContainer,
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    destinasi.nama,
                    style: teks.titleSmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(
                    destinasi.lokasi,
                    style: teks.bodySmall,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}