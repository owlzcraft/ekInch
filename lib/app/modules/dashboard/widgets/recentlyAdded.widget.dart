import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HeroProfile extends StatelessWidget {
  final String image;
  final String job;
  final String name;
  final String location;
  final String date;
  final String time;
  final String minutes;
  const HeroProfile(
      {super.key,
      required this.date,
      required this.image,
      required this.job,
      required this.location,
      required this.minutes,
      required this.name,
      required this.time});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Card(
          elevation: 2,
          shadowColor: const Color(0xFF000000),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(20.sp)),
          color: Colors.transparent,
          child: Container(
            padding: const EdgeInsets.all(10),
            width: getHorizontalSize(330),
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(width: 1.sp, color: const Color(0xFFE6E6E6)),
              borderRadius: BorderRadius.circular(20.sp),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 26.sp,
                  backgroundColor: const Color(0xFFBFBCBC),
                  child: CircleAvatar(
                    radius: 24.sp,
                    backgroundImage: AssetImage(image),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 8.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        job,
                        style: GoogleFonts.kadwa(
                            height: 1.2,
                            fontSize: F12(),
                            color: const Color(0xFF6A6A6A),
                            fontWeight: FontWeight.w400),
                      ),
                      Text(
                        name,
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, fontSize: F18()),
                      ),
                      Text(
                        "$location  |  $time  |  $date",
                        style: GoogleFonts.kadwa(
                            color: const Color(0xFF6A6A6A),
                            fontWeight: FontWeight.w400,
                            fontSize: F12()),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
            top: 10.sp,
            right: 16.sp,
            child: Text(
              minutes,
              style: GoogleFonts.kadwa(
                  color: const Color(0xFF6A6A6A),
                  fontSize: F12(),
                  fontWeight: FontWeight.w500),
            ))
      ],
    );
  }
}
