// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';


UserCard(String image, String name, String profession) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10), color: Colors.white),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                    radius: 25.sp,
                    backgroundImage:
                        const AssetImage("assets/images/profile_icon.png")),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Text(
                        name,
                        style: GoogleFonts.kadwa(
                            fontSize: F18(),
                            fontWeight: FontWeight.w700,
                            color: Colors.black),
                      ),
                      Text(
                        profession,
                        style: GoogleFonts.kadwa(
                            fontSize: F14(),
                            height: 1.3,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
        Positioned(
            top: 8.sp,
            right: 16.sp,
            child: SvgPicture.asset("assets/icons/3dot.svg"))
      ],
    ),
  );
}
