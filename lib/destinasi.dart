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
        'Danau vulkanik terbesar di Indonesia yang menawarkan pemandangan alam indah,'
        'udara sejuk, serta wisata budaya Batak di Pulau Samosir.',
    daya: ['Danau vulkanik', 'Pemandangan', 'Budaya Batak'],
    ikon: Icons.water,
  ),
  Destinasi(
    id: 2,
    nama: 'Pulau Samosir',
    lokasi: 'Kab. Samosir',
    kategori: 'Budaya',
    deskripsi:
        'Pulau di tengah Danau Toba yang terkenal dengan keindahan alam,' 
        'suasana sejuk, dan budaya khas Batak.',
    daya: ['Desa adat', 'Kain ulos', 'Penginapan tepi danau'],
    ikon: Icons.holiday_village,
  ),
  Destinasi(
    id: 3,
    nama: 'Bukit Lawang',
    lokasi: 'Kab. Langkat',
    kategori: 'Alam',
    deskripsi:
        'Destinasi wisata alam yang terkenal dengan hutan tropis,' 
        'aliran sungai jernih, dan habitat orangutan Sumatera.',
    daya: ['Orangutan', 'Trekking hutan', 'Sungai Bahorok'],
    ikon: Icons.forest,
  ),
  Destinasi(
    id: 4,
    nama: 'Berastagi',
    lokasi: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Kota wisata di dataran tinggi yang memiliki udara sejuk,' 
        'pemandangan pegunungan, serta perkebunan buah dan bunga.',
    daya: ['Udara sejuk', 'Pasar buah', 'Pendakian'],
    ikon: Icons.terrain,
  ),
  Destinasi(
    id: 5,
    nama: 'Istana Maimun',
    lokasi: 'Kota Medan',
    kategori: 'Sejarah',
    deskripsi:
        'Bangunan bersejarah peninggalan Kesultanan Deli yang terkenal' 
        'dengan arsitektur unik dan perpaduan budaya Melayu, Islam, dan Eropa.',
    daya: ['Kesultanan Deli', 'Arsitektur', 'Wisata kota'],
    ikon: Icons.account_balance,
  ),
  Destinasi(
    id: 6,
    nama: 'Air Terjun Sipiso-piso',
    lokasi: 'Kab. Karo',
    kategori: 'Alam',
    deskripsi:
        'Air terjun yang terkenal dengan ketinggiannya dan' 
        'pemandangan alam yang indah menghadap kawasan Danau Toba.',
    daya: ['Air terjun', 'Titik pandang', 'Pemandangan'],
    ikon: Icons.waterfall_chart,
  ),
  Destinasi(
    id: 7,
    nama: 'Masjid Raya Al-Mashun',
    lokasi: 'Kota Medan',
    kategori: 'Religi',
    deskripsi:
        'Masjid bersejarah di Kota Medan dengan arsitektur megah' 
        'yang memadukan gaya Melayu, Timur Tengah, dan India.',
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