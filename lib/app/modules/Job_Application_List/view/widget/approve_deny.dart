import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/color.dart';

ApproveDenyCard(String image,String title, String profession,
   String experience) {
  return Stack(
    children: [
      Column(
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              CircleAvatar(
                  radius: 20.sp,
                  backgroundImage:
                      AssetImage("assets/images/profile_icon.png")),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.kadwa(
                          height: 1.2, fontSize: F16(), color: Colors.black),
                    ),
                    Text(
                      "$profession, $experience",
                      style: GoogleFonts.kadwa(
                          fontSize: F12(), color: KColors.textGrey),
                    )
                  ],
                ),
              ),
            ],
          ),
          const Divider(
            color: KColors.lightGrey,
            thickness: 0.8,
          ),
        ],
      ),
      Positioned(
        top: 10.0,
        right: 16.0,
        child: Row(
          children: [
            Icon(
              Icons.cancel_outlined,
              color: Colors.red,
              size: 25.sp,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0),
              child: Icon(
                Icons.check_circle_outline_rounded,
                color: Colors.green,
                size: 25.sp,
              ),
            ),
          ],
        ),
      )
    ],
  );
}
