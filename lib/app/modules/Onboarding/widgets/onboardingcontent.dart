import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

Widget onBoradingContent(String text_1, String text_3, String image) {
  return Container(
      // height: Get.height / 1.4,
      // padding: EdgeInsets.only(top: (Get.height / 30)),
      decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.circular(10)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text_1,
                textAlign: TextAlign.center,
                style: GoogleFonts.kadwa(
                    fontSize: F30(),
                    height: 1.2,
                    fontWeight: FontWeight.w700,
                    color: const Color(0xFF525252))),
          ),
          Text(text_3,
              textAlign: TextAlign.center,
              style: GoogleFonts.kadwa(
                height: 1.2,
                  fontWeight: FontWeight.w400, fontSize: F20())),
          Center(
              child: Image.asset(
            image,
            scale: 1.2,
          ))
        ],
      ));
}
