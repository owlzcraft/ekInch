// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/font_size.dart';

class SkillCard extends StatelessWidget {
  final String title;
  const SkillCard({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
      child: Container(
        decoration: BoxDecoration(
            color: const Color.fromARGB(255, 209, 207, 207),
            borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
          child: Text(
            title,
            style: GoogleFonts.kadwa(
                fontSize: F14(), color: const Color.fromARGB(255, 91, 90, 90)),
          ),
        ),
      ),
    );
  }
}
