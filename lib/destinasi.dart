import 'package:flutter/material.dart';

/// Data satu destinasi wisata. Immutable, jadi boleh dibuat dengan const.
class Destinasi {
  const Destinasi({
    required this.id,
    required this.nama,
    required this.lokasi,
    required this.kategori,
    required this.deskripsi,
    required this.daya,
    required this.ikon,
  });

  final int id;
  final String nama;
  final String lokasi;
  final String kategori;
  final String deskripsi;
  final List<String> daya;
  final IconData ikon;
}

// Ringkasan umum; periksa kembali dan ganti dengan tulisan Anda sendiri.
const daftarDestinasi = <Destinasi>[
  Destinasi(
    id: 1,
    nama: 'Danau Toba',
    lokasi: 'Kab. Samosir, Simalungun, dan sekitarnya',
    kategori: 'Alam',
    deskripsi:
        'Danau vulkanik terbesar di Indonesia dengan Pulau Samosir di '
        'tengahnya. Cocok untuk menikmati pemandangan, berperahu, dan '
        'mengenal budaya Batak.',
    daya: ['Danau vulkanik', 'Pemandangan', 'Budaya Batak'],
    ikon: Icons.water,
  ),
  Destinasi(
    id: 2,
    nama: 'Pulau Samosir',
    lokasi: 'Kab. Samosir',
    kategori: 'Budaya',
    deskripsi:
        'Pulau di tengah Danau Toba dengan desa-desa adat Batak, kain '
        'ulos, dan tepian danau yang tenang.',
    daya: ['Desa adat', 'Kain ulos', 'Penginapan tepi danau'],
    ikon: Icons.landscape,
  ),
  Destinasi(
    id: 3,
    nama: 'Bukit Lawang',
    lokasi: 'Kab. Langkat',
    kategori: 'Alam',
    deskripsi:
        'Pintu masuk ke kawasan Taman Nasional Gunung Leuser, terkenal '
        'sebagai tempat melihat orangutan Sumatra di habitat alaminya.',
    daya: ['Orangutan', 'Trekking hutan', 'Sungai Bahorok'],
    ikon: Icons.forest,
  ),
  Destinasi(
    id: 4,
    nama: 'Berastagi',
    lokasi: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Kota dataran tinggi berhawa sejuk dengan pasar buah, kebun, '
        'dan pemandangan Gunung Sibayak serta Gunung Sinabung.',
    daya: ['Udara sejuk', 'Pasar buah', 'Pendakian'],
    ikon: Icons.terrain,
  ),
  Destinasi(
    id: 5,
    nama: 'Istana Maimun',
    lokasi: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Istana peninggalan Kesultanan Deli yang dibangun pada akhir '
        'abad ke-19, berpadu unsur Melayu dengan gaya arsitektur dari '
        'berbagai budaya.',
    daya: ['Kesultanan Deli', 'Arsitektur', 'Wisata kota'],
    ikon: Icons.account_balance,
  ),
  Destinasi(
    id: 6,
    nama: 'Air Terjun Sipiso-piso',
    lokasi: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun di ujung utara Danau Toba yang jatuh dari tebing '
        'tinggi, dengan titik pandang untuk melihat danau dan lembah '
        'di sekitarnya.',
    daya: ['Air terjun', 'Titik pandang', 'Pemandangan'],
    ikon: Icons.waterfall_chart,
  ),
  Destinasi(
    id: 7,
    nama: 'Masjid Raya Al-Mashun',
    lokasi: 'Kota Medan',
    kategori: 'Religi',
    deskripsi:
        'Masjid bersejarah di pusat Kota Medan peninggalan Kesultanan '
        'Deli dengan kubah dan ornamen yang khas.',
    daya: ['Masjid bersejarah', 'Arsitektur', 'Wisata religi'],
    ikon: Icons.mosque,
  ),
];

/// Mencari destinasi berdasarkan id. Hasilnya nullable: null bila tidak ada.
Destinasi? cariDestinasi(int? id) {
  for (final d in daftarDestinasi) {
    if (d.id == id) return d;
  }
  return null;
}