import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Video extends StatelessWidget {
  
  final String image;
  final String view;
  final String text;
  Video({this.image = "", this.view = "3345", this.text = "Building work"});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      width: (MediaQuery.of(context).size.width / 3.5).sp,
      height: (MediaQuery.of(context).size.height / 4.04809009283).sp,
      margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Stack(children: [
        Center(
            child: Icon(
          Icons.play_circle_outline,
          size: 30.sp,
          color: Colors.white,
        )),
        Positioned(
            top: 5.sp,
            right: 12.sp,
            child: Container(
                width: 33.5.sp,
                height: 13.5.sp,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(25.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.remove_red_eye_outlined, size: 14.sp),
                    Text(
              view,
              style:  GoogleFonts.kadwa(color: Colors.black,fontSize: F10()),
            )
                  ],
                ))),
        Positioned(
            left: 15.sp,
            bottom: 20.sp,
            child: Center(
                child: Text(
              text,
              style:  GoogleFonts.kadwa(color: Colors.white,fontSize: F16()),
            ))),
       
      ]),
    );
  }
}
