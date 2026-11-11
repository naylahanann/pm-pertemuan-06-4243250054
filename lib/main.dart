// Tugas Rutin 6: Wisata Sumatera Utara
// Nama: Nayla Luthfiah Hanan  NIM: 4243250054
import 'package:flutter/material.dart';
import 'package:wisata_sumut/router.dart';

void main() {
  runApp(const WisataApp());
}

/// Widget akar: tema dari satu warna seed dan navigasi dari go_router.
class WisataApp extends StatelessWidget {
  const WisataApp({super.key});

  // Satu-satunya warna yang ditulis langsung; sisanya dari colorScheme.
  static const _seed = Colors.teal;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Wisata Sumatera Utara',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorScheme: ColorScheme.fromSeed(seedColor: _seed)),
      darkTheme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: _seed,
          brightness: Brightness.dark,
        ),
      ),
      routerConfig: router,
    );
  }
}