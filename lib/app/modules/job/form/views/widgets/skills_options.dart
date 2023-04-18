import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/utils/math_utils.dart';
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                title,
                style: GoogleFonts.kadwa(
                    color: KColors.textGrey,
                    fontSize: F18(),
                    ),
              ),
              
               Text(
                "ADD  ",
                style: GoogleFonts.kadwa(
                    color: Colors.black,
                    fontSize: F18(),
                    fontWeight: FontWeight.bold),
              )
            ],
          
      ),
    );
  }
}
