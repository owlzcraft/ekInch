import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../custom_widget/color.dart';

class SkillOptions {
  static Widget textField(String title) {
    return Container(
      width: getHorizontalSize(460),
      height: getVerticalSize(62),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: KColors.greyLine),
          borderRadius: BorderRadius.circular(6)),
      child:
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                title,
                style: GoogleFonts.kadwa(
                    color: KColors.textGrey,
                    fontSize: 18,
                    ),
              ),
              SizedBox(
                width: getHorizontalSize(185),
              ),
               Text(
                "ADD  ",
                style: GoogleFonts.kadwa(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.bold),
              )
            ],
          
      ),
    );
  }
}
