import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Widget VideoCategory(String image, String title, String videos) {
  return Card(
    elevation: 3,
    shadowColor: Color(0xFF000000),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
    color: Colors.transparent,
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20.sp),
          border: Border.all(color: Color(0xFFDBDBDB), width: 1)),
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
                  Text(''),
                  Image.asset(
                    image,
                    scale: 1.2.sp,
                  ),
                  SizedBox(height: 5,),
                  Text(
                    title,
                    style: TextStyle(fontWeight: FontWeight.w400, fontSize: 18.sp),
                  ),SizedBox(height: 5,),
                  Text(
                    '$videos Videos',
                    style:const TextStyle(color: Color(0xFF767676)),
                  )
                ],
              )),
          Positioned(
              left: 72.sp,
              bottom: 85.sp,
              child: Icon(
                Icons.videocam_outlined,
                color:const Color(0xFF767676),
                size: 20.sp,
              ))
        ]),
      ),
    ),
  );
}
