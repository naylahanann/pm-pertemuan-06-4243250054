import 'package:go_router/go_router.dart';
import 'package:wisata_sumut/cangkang_navigasi.dart';
import 'package:wisata_sumut/destinasi.dart';
import 'package:wisata_sumut/halaman_daftar.dart';
import 'package:wisata_sumut/halaman_detail.dart';
import 'package:wisata_sumut/halaman_tentang.dart';

/// Rute:
///   /                → DaftarDestinasi
///   /destinasi/:id   → DetailDestinasi (404 bila id tidak ada)
///   /tentang         → Tentang
final router = GoRouter(
  initialLocation: '/',
  // Alamat yang tidak dikenal sama sekali (misalnya /abc).
  errorBuilder: (context, state) =>
      HalamanTidakDitemukan(pesan: 'Halaman ${state.uri} tidak ada.'),
  routes: [
    // Cangkang navigasi: bar atau rail tetap tampil, tiap tab menyimpan
    // tumpukan halamannya sendiri.
    StatefulShellRoute.indexedStack(
      builder: (context, state, navigationShell) =>
          CangkangNavigasi(shell: navigationShell),
      branches: [
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/',
              builder: (context, state) => const DaftarDestinasi(),
              routes: [
                GoRoute(
                  path: 'destinasi/:id',
                  builder: (context, state) {
                    // Parameter jalur selalu String?, jadi diurai dengan tryParse.
                    final id = int.tryParse(state.pathParameters['id'] ?? '');
                    final destinasi = cariDestinasi(id);
                    if (destinasi == null) {
                      return const HalamanTidakDitemukan(
                        pesan: 'Destinasi yang Anda cari tidak ditemukan.',
                      );
                    }
                    return DetailDestinasi(destinasi: destinasi);
                  },
                ),
              ],
            ),
          ],
        ),
        StatefulShellBranch(
          routes: [
            GoRoute(
              path: '/tentang',
              builder: (context, state) => const Tentang(),
            ),
          ],
        ),
      ],
    ),
  ],
);