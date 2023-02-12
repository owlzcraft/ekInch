
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget HeroProfile(String image, String job, String name, String location,
    String date, String time, String minutes) {
  return Card(
    elevation: 2,
    shadowColor: Color(0xFF000000),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20.sp)),
    color: Colors.transparent,
    child: Container(
      padding: EdgeInsets.all(10),
      width: (Get.width / 1.1).sp,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(width: 1.sp, color: const Color(0xFFE6E6E6)),
        borderRadius: BorderRadius.circular(20.sp),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          CircleAvatar(
            radius: 22.sp,
            backgroundColor: const Color(0xFFBFBCBC),
            child: CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage(image),
            ),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Text(
                      job,
                      style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontWeight: FontWeight.w400),
                    ),
                    SizedBox(
                      width: 100,
                    ),
                    Text(
                      minutes + " ago",
                      style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 12,
                          fontWeight: FontWeight.w500),
                    )
                  ],
                ),
                Text(
                  name,
                  style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
                ),
                SizedBox(height: 5),
                Text(
                  location + " | " + time + " | " + date,
                  style: TextStyle(
                      color: Color(0xFF6A6A6A),
                      fontWeight: FontWeight.w400,
                      fontSize: 12),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
