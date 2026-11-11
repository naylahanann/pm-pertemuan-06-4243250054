import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:wisata_sumut/destinasi.dart';

class DetailDestinasi extends StatelessWidget {
  const DetailDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(destinasi.nama)),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final hero = HeroDestinasi(destinasi: destinasi);
          final info = InfoDestinasi(destinasi: destinasi);

          if (constraints.maxWidth >= 700) {
            return Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.all(16),
                    child: SizedBox(height: 360, child: hero),
                  ),
                ),
                Expanded(
                  child: SingleChildScrollView(
                    padding: const EdgeInsets.fromLTRB(0, 16, 16, 16),
                    child: info,
                  ),
                ),
              ],
            );
          }

          return ListView(
            children: [
              SizedBox(height: 240, child: hero),
              Padding(padding: const EdgeInsets.all(16), child: info),
            ],
          );
        },
      ),
    );
  }
}

/// Bagian gambar: Stack menumpuk latar, ikon besar, dan teks di atasnya.
class HeroDestinasi extends StatelessWidget {
  const HeroDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final skema = Theme.of(context).colorScheme;
    final teks = Theme.of(context).textTheme;

    return ClipRRect(
      borderRadius: BorderRadius.circular(16),
      child: Stack(
        fit: StackFit.expand,
        children: [
          ColoredBox(color: skema.primaryContainer),
          Positioned(
            right: -20,
            bottom: -24,
            child: Opacity(
              opacity: 0.2,
              child: Icon(
                destinasi.ikon,
                size: 160,
                color: skema.onPrimaryContainer,
              ),
            ),
          ),
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Chip(label: Text(destinasi.kategori)),
                const SizedBox(height: 8),
                Text(
                  destinasi.nama,
                  style: teks.headlineSmall?.copyWith(
                    color: skema.onPrimaryContainer,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

/// Bagian informasi: lokasi, deskripsi, dan daya tarik.
class InfoDestinasi extends StatelessWidget {
  const InfoDestinasi({super.key, required this.destinasi});

  final Destinasi destinasi;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            const Icon(Icons.location_on_outlined),
            const SizedBox(width: 8),
            Expanded(child: Text(destinasi.lokasi, style: teks.titleMedium)),
          ],
        ),
        const SizedBox(height: 16),
        Text(destinasi.deskripsi, style: teks.bodyLarge),
        const SizedBox(height: 16),
        Text('Daya tarik', style: teks.titleSmall),
        const SizedBox(height: 8),
        // Wrap turun ke baris baru bila chip tidak muat, jadi tidak overflow.
        Wrap(
          spacing: 8,
          runSpacing: 8,
          children: [for (final t in destinasi.daya) Chip(label: Text(t))],
        ),
      ],
    );
  }
}

/// Halaman 404: dipakai untuk id yang tidak ada dan alamat yang tidak dikenal.
class HalamanTidakDitemukan extends StatelessWidget {
  const HalamanTidakDitemukan({super.key, required this.pesan});

  final String pesan;

  @override
  Widget build(BuildContext context) {
    final teks = Theme.of(context).textTheme;

    return Scaffold(
      appBar: AppBar(title: const Text('404')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.travel_explore, size: 64),
              const SizedBox(height: 16),
              Text('Tidak ditemukan', style: teks.titleLarge),
              const SizedBox(height: 8),
              Text(pesan, textAlign: TextAlign.center),
              const SizedBox(height: 16),
              FilledButton(
                onPressed: () => context.go('/'),
                child: const Text('Kembali ke beranda'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}