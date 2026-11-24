import 'package:flutter/material.dart';
import '../models/pengumuman.dart';

class InfoCard extends StatelessWidget {
  final Pengumuman pengumuman;
  final VoidCallback onTap;

  const InfoCard({
    super.key,
    required this.pengumuman,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF19745F);

    return Card(
      color: Colors.white,
      elevation: 0,
      shape: RoundedRectangleBorder(
        side: BorderSide(color: Colors.grey.shade400),
        borderRadius: BorderRadius.circular(5),
      ),
      child: InkWell(
        onTap: onTap,
        child: Padding(
          padding: const EdgeInsets.all(9),
          child: Row(
            children: [
              // Kotak kategori di sebelah kiri.
              Container(
                width: 52,
                height: 45,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  border: Border.all(color: warnaUtama),
                ),
                child: Text(
                  pengumuman.kategori,
                  textAlign: TextAlign.center,
                  style: const TextStyle(fontSize: 9),
                ),
              ),

              const SizedBox(width: 12),

              // Judul dan tanggal informasi.
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      pengumuman.judul,
                      style: const TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      pengumuman.tanggal,
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.grey.shade700,
                      ),
                    ),
                  ],
                ),
              ),

              const Icon(
                Icons.chevron_right,
                size: 18,
                color: Colors.grey,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
