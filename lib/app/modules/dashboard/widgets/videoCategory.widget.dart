// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget VideoCategory(
    String image, String title, String videos, BuildContext context) {
  return Card(
    elevation: 3,
    shadowColor: const Color(0xFF000000),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
    color: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: const Color(0xFFDBDBDB), width: 1)),
      width: (Get.width / 3.5).sp,
      height: (Get.height / 6).sp,
      child: Center(
        child: Stack(children: [
          Positioned(
              left: 0,
              right: 0,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Text(''),
                  Image.asset(
                    image,
                    scale: 1.2.sp,
                  ),
                  Text(
                    title,
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w400, fontSize: F18()),
                  ),
                  Text(
                    '$videos ${AppLocalizations.of(context)!.videos}',
                    style: GoogleFonts.kadwa(
                        color: const Color(0xFF767676),
                        height: 1.2,
                        fontSize: F16()),
                  )
                ],
              )),
          Positioned(
              left: 72.sp,
              bottom: 85.sp,
              child: Icon(
                Icons.videocam_outlined,
                color: const Color(0xFF767676),
                size: 20.sp,
              ))
        ]),
      ),
    ),
  );
}
