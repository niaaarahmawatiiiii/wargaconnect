import 'package:flutter/material.dart';
import '../models/pengumuman.dart';
import '../models/kegiatan.dart';

class InfoProvider extends ChangeNotifier {
  // Data contoh pengumuman yang ditampilkan pada aplikasi.
  final List<Pengumuman> _pengumuman = [
    Pengumuman(
      id: 1,
      judul: 'Pertemuan PKK November',
      kategori: 'PKK',
      isi: 'Pertemuan rutin PKK bulan November.',
      tanggal: '2 Nov 2026',
      waktu: '19.30 WIB',
      lokasi: 'Rumah Ketua RT',
      keterangan: 'Harap hadir tepat waktu.',
    ),
    Pengumuman(
      id: 2,
      judul: 'Jadwal Posyandu Balita',
      kategori: 'Posyandu',
      isi: 'Kegiatan pemeriksaan kesehatan balita.',
      tanggal: '1 Nov 2026',
      waktu: '09.00 WIB',
      lokasi: 'Balai Warga',
      keterangan: 'Membawa buku KIA.',
    ),
    Pengumuman(
      id: 3,
      judul: 'Info Bantuan Sosial Tahap 3',
      kategori: 'Bansos',
      isi: 'Informasi penyaluran bantuan sosial tahap ketiga.',
      tanggal: '30 Okt 2026',
      waktu: '08.00 WIB',
      lokasi: 'Kantor Kelurahan',
      keterangan: 'Membawa kartu identitas.',
    ),
    Pengumuman(
      id: 4,
      judul: 'Pengumuman Kerja Bakti',
      kategori: 'RTRW',
      isi: 'Seluruh warga diharapkan mengikuti kerja bakti.',
      tanggal: '29 Okt 2026',
      waktu: '07.00 WIB',
      lokasi: 'Lingkungan RT',
      keterangan: 'Membawa peralatan kebersihan.',
    ),
    Pengumuman(
      id: 5,
      judul: 'Pemberitahuan Air Mati',
      kategori: 'Umum',
      isi: 'Akan dilakukan perbaikan saluran air.',
      tanggal: '27 Okt 2026',
      waktu: '08.00 WIB',
      lokasi: 'Lingkungan RT',
      keterangan: 'Mohon menyiapkan persediaan air.',
    ),
  ];

  // Data contoh kegiatan warga.
  final List<Kegiatan> _kegiatan = [
    Kegiatan(
      id: 1,
      judul: 'Kerja Bakti Lingkungan',
      kategori: 'RTRW',
      tanggal: '08 Nov',
      waktu: '07.00 WIB',
      lokasi: 'Jalan RT',
      keterangan: 'Membersihkan lingkungan bersama.',
    ),
    Kegiatan(
      id: 2,
      judul: 'Posyandu Balita',
      kategori: 'Posyandu',
      tanggal: '10 Nov',
      waktu: '09.00 WIB',
      lokasi: 'Balai Warga',
      keterangan: 'Pemeriksaan kesehatan balita.',
    ),
    Kegiatan(
      id: 3,
      judul: 'Pertemuan PKK',
      kategori: 'PKK',
      tanggal: '14 Nov',
      waktu: '19.30 WIB',
      lokasi: 'Rumah Ketua',
      keterangan: 'Pertemuan rutin anggota PKK.',
    ),
    Kegiatan(
      id: 4,
      judul: 'Rapat Warga',
      kategori: 'Umum',
      tanggal: '20 Nov',
      waktu: '20.00 WIB',
      lokasi: 'Pos Ronda',
      keterangan: 'Membahas kegiatan lingkungan.',
    ),
  ];

  // Data arsip informasi lama.
  final List<Pengumuman> _arsip = [
    Pengumuman(
      id: 101,
      judul: 'Kerja Bakti Akhir Bulan',
      kategori: 'RTRW',
      isi: 'Dokumentasi informasi kerja bakti.',
      tanggal: '25 Okt 2026',
    ),
    Pengumuman(
      id: 102,
      judul: 'Posyandu Lansia',
      kategori: 'Posyandu',
      isi: 'Informasi kegiatan posyandu lansia.',
      tanggal: '20 Okt 2026',
    ),
    Pengumuman(
      id: 103,
      judul: 'Penyaluran Bansos Tahap 2',
      kategori: 'Bansos',
      isi: 'Informasi penyaluran bantuan sosial.',
      tanggal: '12 Okt 2026',
    ),
    Pengumuman(
      id: 104,
      judul: 'Senam Pagi PKK',
      kategori: 'PKK',
      isi: 'Informasi kegiatan senam pagi.',
      tanggal: '28 Sep 2026',
    ),
    Pengumuman(
      id: 105,
      judul: 'Pembagian Kartu Warga',
      kategori: 'Umum',
      isi: 'Informasi pembagian kartu warga.',
      tanggal: '10 Sep 2026',
    ),
  ];

  // Mengambil data agar dapat ditampilkan oleh halaman aplikasi.
  List<Pengumuman> get pengumuman =>
      List.unmodifiable(_pengumuman);

  List<Kegiatan> get kegiatan =>
      List.unmodifiable(_kegiatan);

  List<Pengumuman> get arsip =>
      List.unmodifiable(_arsip);

  // Membuat ID baru untuk pengumuman.
  int get _idPengumuman {
    if (_pengumuman.isEmpty) return 1;

    return _pengumuman
            .map((item) => item.id)
            .reduce((a, b) => a > b ? a : b) +
        1;
  }

  // Membuat ID baru untuk kegiatan.
  int get _idKegiatan {
    if (_kegiatan.isEmpty) return 1;

    return _kegiatan
            .map((item) => item.id)
            .reduce((a, b) => a > b ? a : b) +
        1;
  }

  // Menambahkan pengumuman baru.
  void tambahPengumuman({
    required String judul,
    required String kategori,
    required String isi,
    required String tanggal,
  }) {
    _pengumuman.insert(
      0,
      Pengumuman(
        id: _idPengumuman,
        judul: judul,
        kategori: kategori,
        isi: isi,
        tanggal: tanggal,
      ),
    );

    notifyListeners();
  }

  // Menghapus pengumuman.
  void hapusPengumuman(int id) {
    _pengumuman.removeWhere((item) => item.id == id);
    notifyListeners();
  }

  // Memindahkan pengumuman ke arsip.
  void arsipkanPengumuman(int id) {
    final index = _pengumuman.indexWhere(
      (item) => item.id == id,
    );

    if (index == -1) return;

    _arsip.insert(0, _pengumuman.removeAt(index));

    notifyListeners();
  }

  // Menambahkan jadwal kegiatan baru.
  void tambahKegiatan({
    required String judul,
    required String kategori,
    required String tanggal,
    required String waktu,
    required String lokasi,
  }) {
    _kegiatan.add(
      Kegiatan(
        id: _idKegiatan,
        judul: judul,
        kategori: kategori,
        tanggal: tanggal,
        waktu: waktu,
        lokasi: lokasi,
      ),
    );

    notifyListeners();
  }

  // Menghapus jadwal kegiatan.
  void hapusKegiatan(int id) {
    _kegiatan.removeWhere((item) => item.id == id);
    notifyListeners();
  }
}

// Satu objek provider digunakan bersama oleh seluruh halaman.
final InfoProvider infoProvider = InfoProvider();
