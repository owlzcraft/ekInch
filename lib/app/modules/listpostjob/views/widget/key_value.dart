// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../custom_widget/color.dart';

CustomRow(BuildContext context, String key, String value) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.start,
    children: [
      SizedBox(
          width: MediaQuery.of(context).size.width * 0.3,
          child: Text(
            key,
            style:
                GoogleFonts.kadwa(fontSize: F16(), fontWeight: FontWeight.w400),
          )),
      SizedBox(
        width: MediaQuery.of(context).size.width * 0.03,
        child: const Text(
          ":",
          style: TextStyle(color: KColors.textGrey),
        ),
      ),
      Expanded(
        child: Text(
          value,
          style: GoogleFonts.kadwa(
              color: KColors.textGrey,
              height: 1.3,
              fontSize: F16(),
              fontWeight: FontWeight.w400),
        ),
      )
    ],
  );
}
