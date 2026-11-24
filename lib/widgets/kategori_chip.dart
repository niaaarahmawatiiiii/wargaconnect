import 'package:flutter/material.dart';

// Widget tombol pilihan kategori.
class KategoriChip extends StatelessWidget {
  final String kategori;
  final bool terpilih;
  final VoidCallback onTap;

  const KategoriChip({
    super.key,
    required this.kategori,
    required this.terpilih,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    const warnaUtama = Color(0xFF19745F);

    return ChoiceChip(
      label: Text(kategori),
      selected: terpilih,
      onSelected: (_) => onTap(),
      selectedColor: warnaUtama,
      backgroundColor: Colors.white,
      labelStyle: TextStyle(
        color: terpilih ? Colors.white : Colors.black87,
        fontSize: 12,
        fontWeight: FontWeight.w500,
      ),
      side: BorderSide(
        color: terpilih ? warnaUtama : Colors.grey.shade400,
      ),
      showCheckmark: false,
    );
  }
}
