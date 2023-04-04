import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget OtherServicesCard(
    String heading, String sub_heading, String bottom_image) {
  return Stack(
    children: [
      Container(
        width: getHorizontalSize(250),
        height: getVerticalSize(130),
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 5),
        decoration: BoxDecoration(
            color: KColors.orange, borderRadius: BorderRadius.circular(20)),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                heading,
                style: GoogleFonts.kadwa(
                    fontSize: F16(), fontWeight: FontWeight.w400),
              ),
              Text(
                sub_heading,
                style: GoogleFonts.kadwa(
                    height: 1.2,
                    fontSize: F12(),
                    color: const Color(0xFF484747)),
              ),
            ],
          ),
        ),
      ),
      Positioned(
        right: 16.0,
        bottom: 16.0,
        child: Image.asset(
          bottom_image,
          scale: 2.0,
        ),
      )
    ],
  );
}
