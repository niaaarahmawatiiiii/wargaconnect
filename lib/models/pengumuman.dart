class Pengumuman {
  // ID unik untuk setiap pengumuman.
  final int id;

  // Judul pengumuman.
  final String judul;

  // Kategori pengumuman.
  // Contoh: RTRW, PKK, Posyandu, Bansos, dan Umum.
  final String kategori;

  // Isi atau deskripsi pengumuman.
  final String isi;

  // Tanggal pengumuman diterbitkan.
  final String tanggal;

  // Waktu kegiatan jika tersedia.
  final String waktu;

  // Lokasi kegiatan jika tersedia.
  final String lokasi;

  // Keterangan tambahan pengumuman.
  final String keterangan;

  // Constructor untuk membuat objek pengumuman.
  const Pengumuman({
    required this.id,
    required this.judul,
    required this.kategori,
    required this.isi,
    required this.tanggal,
    this.waktu = '-',
    this.lokasi = '-',
    this.keterangan = '-',
  });
}
