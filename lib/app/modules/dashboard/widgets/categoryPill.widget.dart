import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

Widget categoryPill(String title, bool active) {
  return Container(
    margin: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 2.sp),
    width: 100.sp,
    height: 30.sp,
    decoration: BoxDecoration(
        color: (active) ?const Color(0xFFFEBA0F) :const Color(0xFFE0E0E0),
        borderRadius: BorderRadius.circular(20.sp)),
    child: Center(
      child: Text(
        title,
        style: GoogleFonts.kadwa(fontSize: F18(),fontWeight: FontWeight.w400),
      ),
    ),
  );
}
