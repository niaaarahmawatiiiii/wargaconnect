class Kegiatan {
  // ID unik untuk setiap kegiatan.
  final int id;

  // Nama atau judul kegiatan.
  final String judul;

  // Kategori kegiatan.
  // Contoh: RTRW, PKK, Posyandu, Bansos, dan Umum.
  final String kategori;

  // Tanggal pelaksanaan kegiatan.
  final String tanggal;

  // Waktu pelaksanaan kegiatan.
  final String waktu;

  // Lokasi pelaksanaan kegiatan.
  final String lokasi;

  // Keterangan tambahan kegiatan.
  final String keterangan;

  // Constructor untuk membuat objek kegiatan.
  const Kegiatan({
    required this.id,
    required this.judul,
    required this.kategori,
    required this.tanggal,
    required this.waktu,
    required this.lokasi,
    this.keterangan = '-',
  });
}
