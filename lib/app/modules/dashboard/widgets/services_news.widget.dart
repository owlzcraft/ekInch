import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Widget servicesAndNews(String heading, String sub_heading, bool isLive,
    String bottom_image, String date, String time) {
  return Container(
    padding: EdgeInsets.all(10),
    width: (Get.width / 2.5).sp,
    margin: EdgeInsets.symmetric(horizontal: 10),
    height: (Get.height / 4.04809009283).sp,
    decoration: BoxDecoration(
        color: Color(0xFFFEBA0F), borderRadius: BorderRadius.circular(20)),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(heading, style: TextStyle(fontWeight: FontWeight.w400),),
          ],
        ),
        isLive
            ? Container(
                child: Row(
                  children: [
                    Image.asset('assets/images/services_calender.png'),
                    Text(' $time',style: TextStyle(fontSize: 12, color: Color(0xFF484747)),),
                    Text(" | ",style: TextStyle(fontSize: 12, color: Color(0xFF484747)),),
                    Text(date,style: TextStyle(fontSize: 12, color: Color(0xFF484747)),)
                  ],
                ),
              )
            : Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(sub_heading, style: TextStyle(fontSize: 12, color: Color(0xFF484747)),),
              ],
            ),
        (isLive) ? Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image.asset("assets/images/live_img.png"),
          ],
        ) : Container(),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Icon(Icons.arrow_circle_right_outlined),
            Image.asset(bottom_image)
          ],
        )
      ],
    ),
  );
}
