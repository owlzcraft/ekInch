// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widget/font_size.dart';

class LangCom extends StatelessWidget {
  final String active_img;
  final String inactive_img;
  final String textT;
  final String textB;
  final int active;

  // ignore: use_key_in_widget_constructors
  const LangCom(
      {this.active_img = "",
      this.inactive_img = "",
      this.textT = "",
      this.textB = "",
      this.active = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        color: (active == 1) ? const Color(0xFFFEBA0F) : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(6)),
      ),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[ 
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(textT,
                    style: GoogleFonts.kadwa(
                        fontSize: F28(),
                        color: (active == 1)
                            ? Colors.white
                            : Colors.black)),
                Text(textB,
                    style: GoogleFonts.kadwa(
                        fontSize: F28(),
                        color: (active == 1)
                            ? Colors.white
                            : Colors.black)),
              ],
            ),
            Image.asset(
              (active == 1) ? active_img : inactive_img,
              scale: 1.7,
            ),
          ],
        ),
      ),
    );
  }
}
