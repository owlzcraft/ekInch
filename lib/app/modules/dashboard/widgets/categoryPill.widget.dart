import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
        style: const TextStyle(fontWeight: FontWeight.w400),
      ),
    ),
  );
}
