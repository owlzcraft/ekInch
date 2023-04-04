import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget servicesAndNews(String heading, String sub_heading, bool isLive,
    String bottom_image, String date, String time) {
  return Container(
    padding: const EdgeInsets.all(12),
    width: getHorizontalSize(170),
    margin: const EdgeInsets.symmetric(horizontal: 5,vertical: 5),
    height: getVerticalSize(250),
    decoration: BoxDecoration(
        color:KColors.orange,
        borderRadius: BorderRadius.circular(20)),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Text(
          heading,
          style: GoogleFonts.kadwa(height: 1.4,fontSize: F14(), fontWeight: FontWeight.w400),
        ),
        isLive
            ? Row(
              mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Image.asset('assets/images/services_calender.png'),
                  Text(
                    ' $time | ${date}',
                    style: GoogleFonts.kadwa(
                    fontSize: F12(), color: const Color(0xFF484747)),
                  ),
                ],
              )
            : Text(
              sub_heading,
              style: GoogleFonts.kadwa(
                height: 1.2,
                  fontSize: F12(), color: const Color(0xFF484747)),
            ),
        (isLive) ? Image.asset("assets/images/live_img.png") : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            const Icon(Icons.arrow_circle_right_outlined),
            Image.asset(bottom_image)
          ],
        )
      ],
    ),
  );
}
