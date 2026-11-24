import 'package:flutter/material.dart';
import '../models/pengumuman.dart';

class DetailInformasiScreen extends StatelessWidget {
  final Pengumuman pengumuman;

  const DetailInformasiScreen({
    super.key,
    required this.pengumuman,
  });

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF19745F);

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('Detail'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Label kategori informasi.
            Container(
              width: 65,
              height: 45,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                border: Border.all(color: warnaUtama),
              ),
              child: Text(
                pengumuman.kategori,
                style: const TextStyle(fontSize: 11),
              ),
            ),

            const SizedBox(height: 28),

            // Judul informasi.
            Text(
              pengumuman.judul,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),

            const SizedBox(height: 22),

            Text(
              pengumuman.isi,
              style: const TextStyle(fontSize: 14),
            ),

            const SizedBox(height: 25),

            // Tanggal publikasi.
            Text(
              'Dipublikasikan: ${pengumuman.tanggal}',
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 18),

            const Divider(thickness: 1),

            const SizedBox(height: 15),

            // Informasi waktu.
            Text(
              'Waktu  : ${pengumuman.waktu}',
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 18),

            // Informasi lokasi.
            Text(
              'Lokasi : ${pengumuman.lokasi}',
              style: const TextStyle(fontSize: 12),
            ),

            const SizedBox(height: 18),

            // Keterangan tambahan.
            Text(
              'Ket.     : ${pengumuman.keterangan}',
              style: const TextStyle(fontSize: 12),
            ),
          ],
        ),
      ),
    );
  }
}
