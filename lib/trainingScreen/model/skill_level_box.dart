import 'package:flutter/material.dart';

class SkillLevelIcon extends StatelessWidget {
  final int level;

  const SkillLevelIcon({required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        Color color;
        if (index < level) {
          if (level == 1) {
            color = const Color(0xFF8AEF8D); // Level 1: Kotak pertama hijau
          } else if (level == 2) {
            color = const Color(0xFFFDEF6F); // Level 2: Dua kotak kuning
          } else {
            color = const Color(0xFFFF7167); // Level 3: Tiga kotak merah
          }
        } else {
          color = Colors.grey; // Kotak yang tidak aktif
        }

        return Container(
          width: 15,
          height: 15,
          margin: const EdgeInsets.symmetric(horizontal: 1.5),
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(7),
          ),
        );
      }),
    );
  }
}