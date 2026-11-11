import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

/// Kerangka navigasi adaptif.
/// Lebar layar < 840 dp memakai NavigationBar (bawah),
/// lebar >= 840 dp memakai NavigationRail (samping).
class CangkangNavigasi extends StatelessWidget {
  const CangkangNavigasi({super.key, required this.shell});

  final StatefulNavigationShell shell;

  void _pilih(int indeks) {
    // Mengetuk tab yang sedang aktif kembali ke halaman awal tab itu.
    shell.goBranch(indeks, initialLocation: indeks == shell.currentIndex);
  }

  @override
  Widget build(BuildContext context) {
    // sizeOf hanya memicu build ulang saat ukuran layar berubah.
    final lebar = MediaQuery.sizeOf(context).width;

    if (lebar >= 840) {
      return Scaffold(
        body: Row(
          children: [
            NavigationRail(
              selectedIndex: shell.currentIndex,
              onDestinationSelected: _pilih,
              labelType: NavigationRailLabelType.all,
              destinations: const [
                NavigationRailDestination(
                  icon: Icon(Icons.explore_outlined),
                  selectedIcon: Icon(Icons.explore),
                  label: Text('Destinasi'),
                ),
                NavigationRailDestination(
                  icon: Icon(Icons.info_outline),
                  selectedIcon: Icon(Icons.info),
                  label: Text('Tentang'),
                ),
              ],
            ),
            const VerticalDivider(width: 1),
            Expanded(child: shell),
          ],
        ),
      );
    }

    return Scaffold(
      body: shell,
      bottomNavigationBar: NavigationBar(
        selectedIndex: shell.currentIndex,
        onDestinationSelected: _pilih,
        destinations: const [
          NavigationDestination(
            icon: Icon(Icons.explore_outlined),
            selectedIcon: Icon(Icons.explore),
            label: 'Destinasi',
          ),
          NavigationDestination(
            icon: Icon(Icons.info_outline),
            selectedIcon: Icon(Icons.info),
            label: 'Tentang',
          ),
        ],
      ),
    );
  }
}