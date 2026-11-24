import 'package:flutter/material.dart';
import '../models/kegiatan.dart';

class KegiatanCard extends StatelessWidget {
  final Kegiatan kegiatan;

  const KegiatanCard({
    super.key,
    required this.kegiatan,
  });

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF19745F);

    // Memisahkan tanggal dan bulan untuk kotak tanggal.
    final bagianTanggal = kegiatan.tanggal.split(' ');

    return Card(
      color: Colors.white,
      elevation: 0,
      margin: const EdgeInsets.only(bottom: 10),
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(5),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Row(
          children: [
            // Kotak tanggal kegiatan.
            Container(
              width: 52,
              height: 65,
              decoration: BoxDecoration(
                border: Border.all(color: warnaUtama),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    bagianTanggal.first,
                    style: const TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    bagianTanggal.length > 1
                        ? bagianTanggal[1].toUpperCase()
                        : '',
                    style: const TextStyle(fontSize: 9),
                  ),
                ],
              ),
            ),

            const SizedBox(width: 12),

            // Detail kegiatan.
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    kegiatan.judul,
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 7),
                  Text(
                    '${kegiatan.waktu} | ${kegiatan.lokasi}',
                    style: const TextStyle(fontSize: 10),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    kegiatan.keterangan,
                    style: TextStyle(
                      fontSize: 10,
                      color: Colors.grey.shade600,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
