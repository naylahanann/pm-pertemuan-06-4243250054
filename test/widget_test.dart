import 'package:flutter_test/flutter_test.dart';
import 'package:wisata_sumut/main.dart';

void main() {
  testWidgets('Daftar tampil dan mengetuk kartu membuka halaman detail', (
    WidgetTester tester,
  ) async {
    await tester.pumpWidget(const WisataApp());
    await tester.pumpAndSettle();

    // Halaman daftar.
    expect(find.text('Wisata Sumatera Utara'), findsOneWidget);
    expect(find.text('Danau Toba'), findsOneWidget);

    // Ketuk kartu: pindah ke halaman detail.
    await tester.tap(find.text('Danau Toba'));
    await tester.pumpAndSettle();
    expect(find.textContaining('Danau vulkanik terbesar'), findsOneWidget);
  });
}