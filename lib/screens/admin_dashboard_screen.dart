import 'package:flutter/material.dart';
import '../providers/admin_auth.dart';
import '../providers/info_provider.dart';

class AdminDashboardScreen extends StatefulWidget {
  const AdminDashboardScreen({super.key});

  @override
  State<AdminDashboardScreen> createState() =>
      _AdminDashboardScreenState();
}

class _AdminDashboardScreenState
    extends State<AdminDashboardScreen> {
  static const warnaUtama = Color(0xFF19745F);

  // Mengatur tab yang sedang dibuka.
  int tabTerpilih = 0;

  // Controller formulir pengumuman.
  final judulInfoController = TextEditingController();
  final isiInfoController = TextEditingController();

  // Controller formulir jadwal.
  final judulKegiatanController = TextEditingController();
  final tanggalController = TextEditingController();
  final waktuController = TextEditingController();
  final lokasiController = TextEditingController();

  // Kategori yang dipilih.
  String kategoriInfo = 'PKK';
  String kategoriKegiatan = 'Umum';

  final List<String> daftarKategori = [
    'RTRW',
    'PKK',
    'Posyandu',
    'Bansos',
    'Umum',
  ];

  @override
  void dispose() {
    judulInfoController.dispose();
    isiInfoController.dispose();
    judulKegiatanController.dispose();
    tanggalController.dispose();
    waktuController.dispose();
    lokasiController.dispose();
    super.dispose();
  }

  // Menyimpan pengumuman baru.
  void simpanPengumuman() {
    final judul = judulInfoController.text.trim();
    final isi = isiInfoController.text.trim();

    if (judul.isEmpty || isi.isEmpty) {
      tampilkanPesan('Judul dan isi pengumuman harus diisi.');
      return;
    }

    infoProvider.tambahPengumuman(
      judul: judul,
      kategori: kategoriInfo,
      isi: isi,
      tanggal: '2 Nov 2026',
    );

    judulInfoController.clear();
    isiInfoController.clear();

    tampilkanPesan('Pengumuman berhasil ditambahkan.');
  }

  // Menyimpan jadwal kegiatan baru.
  void simpanKegiatan() {
    final judul = judulKegiatanController.text.trim();
    final tanggal = tanggalController.text.trim();
    final waktu = waktuController.text.trim();
    final lokasi = lokasiController.text.trim();

    if (judul.isEmpty ||
        tanggal.isEmpty ||
        waktu.isEmpty ||
        lokasi.isEmpty) {
      tampilkanPesan('Semua data jadwal harus diisi.');
      return;
    }

    infoProvider.tambahKegiatan(
      judul: judul,
      kategori: kategoriKegiatan,
      tanggal: tanggal,
      waktu: waktu,
      lokasi: lokasi,
    );

    judulKegiatanController.clear();
    tanggalController.clear();
    waktuController.clear();
    lokasiController.clear();

    tampilkanPesan('Jadwal berhasil ditambahkan.');
  }

  // Menampilkan pesan kepada Admin.
  void tampilkanPesan(String pesan) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(pesan)),
    );
  }

  // Keluar dari akun Admin.
  void keluar() {
    AdminAuth.logout();

    Navigator.pushNamedAndRemoveUntil(
      context,
      '/',
      (route) => false,
    );
  }

  @override
  Widget build(BuildContext context) {
    // Halaman Admin hanya dapat dibuka setelah login.
    if (!AdminAuth.isLoggedIn) {
      return const Scaffold(
        body: Center(
          child: Text('Silakan login sebagai Admin RT.'),
        ),
      );
    }

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Dashboard Admin'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        actions: [
          IconButton(
            onPressed: keluar,
            icon: const Icon(Icons.logout),
            tooltip: 'Keluar',
          ),
        ],
      ),

      body: AnimatedBuilder(
        animation: infoProvider,
        builder: (context, child) {
          return ListView(
            padding: const EdgeInsets.all(15),
            children: [
              // Tab pengelolaan.
              Row(
                children: [
                  _tabButton('Kelola Pengumuman', 0),
                  _tabButton('Kelola Jadwal', 1),
                ],
              ),

              const SizedBox(height: 22),

              if (tabTerpilih == 0)
                _halamanPengumuman()
              else
                _halamanJadwal(),
            ],
          );
        },
      ),
    );
  }

  // Tombol pilihan tab Admin.
  Widget _tabButton(String judul, int index) {
    final aktif = tabTerpilih == index;

    return Expanded(
      child: OutlinedButton(
        onPressed: () {
          setState(() {
            tabTerpilih = index;
          });
        },
        style: OutlinedButton.styleFrom(
          backgroundColor: aktif ? warnaUtama : Colors.white,
          foregroundColor: aktif ? Colors.white : warnaUtama,
          side: const BorderSide(color: warnaUtama),
          padding: const EdgeInsets.symmetric(vertical: 13),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.zero,
          ),
        ),
        child: Text(
          judul,
          textAlign: TextAlign.center,
          style: const TextStyle(fontSize: 11),
        ),
      ),
    );
  }

  // Form dan daftar pengumuman.
  Widget _halamanPengumuman() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tambah Pengumuman',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        _label('Judul'),
        _input(
          controller: judulInfoController,
          hint: 'Masukkan judul pengumuman',
        ),

        const SizedBox(height: 12),

        _label('Kategori'),
        _pilihanKategori(
          nilai: kategoriInfo,
          onChanged: (nilai) {
            setState(() {
              kategoriInfo = nilai!;
            });
          },
        ),

        const SizedBox(height: 12),

        _label('Isi pengumuman'),
        _input(
          controller: isiInfoController,
          hint: 'Masukkan isi pengumuman',
          maxLines: 4,
        ),

        const SizedBox(height: 15),

        _tombolSimpan(
          teks: 'Simpan Pengumuman',
          aksi: simpanPengumuman,
        ),

        const SizedBox(height: 28),

        const Text(
          'Daftar Pengumuman',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        // Daftar pengumuman yang dapat dikelola Admin.
        ...infoProvider.pengumuman.map((item) {
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              title: Text(
                item.judul,
                style: const TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                '${item.kategori} | ${item.tanggal}',
                style: const TextStyle(fontSize: 10),
              ),
              trailing: PopupMenuButton<String>(
                onSelected: (pilihan) {
                  if (pilihan == 'arsip') {
                    infoProvider.arsipkanPengumuman(item.id);
                    tampilkanPesan('Informasi dipindahkan ke arsip.');
                  } else if (pilihan == 'hapus') {
                    infoProvider.hapusPengumuman(item.id);
                    tampilkanPesan('Pengumuman dihapus.');
                  }
                },
                itemBuilder: (context) => const [
                  PopupMenuItem(
                    value: 'arsip',
                    child: Text('Arsipkan'),
                  ),
                  PopupMenuItem(
                    value: 'hapus',
                    child: Text('Hapus'),
                  ),
                ],
              ),
            ),
          );
        }),
      ],
    );
  }

  // Form dan daftar jadwal kegiatan.
  Widget _halamanJadwal() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Tambah Jadwal Kegiatan',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 15),

        _label('Nama kegiatan'),
        _input(
          controller: judulKegiatanController,
          hint: 'Masukkan nama kegiatan',
        ),

        const SizedBox(height: 12),

        _label('Kategori'),
        _pilihanKategori(
          nilai: kategoriKegiatan,
          onChanged: (nilai) {
            setState(() {
              kategoriKegiatan = nilai!;
            });
          },
        ),

        const SizedBox(height: 12),

        _label('Tanggal'),
        _input(
          controller: tanggalController,
          hint: 'Contoh: 25 Nov',
        ),

        const SizedBox(height: 12),

        _label('Waktu'),
        _input(
          controller: waktuController,
          hint: 'Contoh: 07.00 WIB',
        ),

        const SizedBox(height: 12),

        _label('Lokasi'),
        _input(
          controller: lokasiController,
          hint: 'Masukkan lokasi kegiatan',
        ),

        const SizedBox(height: 15),

        _tombolSimpan(
          teks: 'Simpan Jadwal',
          aksi: simpanKegiatan,
        ),

        const SizedBox(height: 28),

        const Text(
          'Daftar Jadwal',
          style: TextStyle(
            fontSize: 15,
            fontWeight: FontWeight.bold,
          ),
        ),

        const SizedBox(height: 10),

        // Daftar jadwal yang dapat dihapus Admin.
        ...infoProvider.kegiatan.map((item) {
          return Card(
            elevation: 0,
            shape: RoundedRectangleBorder(
              side: BorderSide(color: Colors.grey.shade300),
              borderRadius: BorderRadius.circular(5),
            ),
            child: ListTile(
              title: Text(
                item.judul,
                style: const TextStyle(fontSize: 12),
              ),
              subtitle: Text(
                '${item.tanggal} | ${item.waktu}',
                style: const TextStyle(fontSize: 10),
              ),
              trailing: IconButton(
                onPressed: () {
                  infoProvider.hapusKegiatan(item.id);
                  tampilkanPesan('Jadwal berhasil dihapus.');
                },
                icon: const Icon(
                  Icons.delete_outline,
                  color: Colors.red,
                ),
              ),
            ),
          );
        }),
      ],
    );
  }

  // Label untuk setiap kolom formulir.
  Widget _label(String judul) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 7),
      child: Text(
        judul,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  // Kolom input formulir.
  Widget _input({
    required TextEditingController controller,
    required String hint,
    int maxLines = 1,
  }) {
    return TextField(
      controller: controller,
      maxLines: maxLines,
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(fontSize: 11),
        border: const OutlineInputBorder(),
        contentPadding: const EdgeInsets.all(12),
      ),
    );
  }

  // Dropdown kategori.
  Widget _pilihanKategori({
    required String nilai,
    required ValueChanged<String?> onChanged,
  }) {
    return DropdownButtonFormField<String>(
      initialValue: nilai,
      decoration: const InputDecoration(
        border: OutlineInputBorder(),
        contentPadding: EdgeInsets.symmetric(
          horizontal: 12,
          vertical: 8,
        ),
      ),
      items: daftarKategori.map((kategori) {
        return DropdownMenuItem(
          value: kategori,
          child: Text(
            kategori,
            style: const TextStyle(fontSize: 12),
          ),
        );
      }).toList(),
      onChanged: onChanged,
    );
  }

  // Tombol simpan formulir.
  Widget _tombolSimpan({
    required String teks,
    required VoidCallback aksi,
  }) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
        onPressed: aksi,
        style: ElevatedButton.styleFrom(
          backgroundColor: warnaUtama,
          foregroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(8),
          ),
        ),
        child: Text(teks),
      ),
    );
  }
}
