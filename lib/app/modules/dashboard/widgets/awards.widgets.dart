import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Award_and_Certificate extends StatelessWidget {
  final String image;
  final String view;
  final String text;
  Award_and_Certificate(
      {this.image = "assets/image/ek-awrd.png",
      this.view = "Best Electrician Work",
      this.text = "Award"});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal:3.0),
      child: Container(
          width: getHorizontalSize(250),
          height: getVerticalSize(180),
          decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.cover,
              ),
              gradient: const LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(0, 0, 0, 0),
                  Color.fromARGB(0, 0, 0, 1),
                  Colors.grey
                ],
              ),
              borderRadius: BorderRadius.circular(20.sp)),
          child: Stack(children: [
            Positioned(
                child: Container(
              decoration: BoxDecoration(
                  gradient:const LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(0, 0, 0, 0),
                      Color.fromARGB(0, 0, 0, 1),
                      Colors.black
                    ],
                  ),
                  borderRadius: BorderRadius.circular(20.sp)),
            )),
            Positioned(
                left: 15.sp,
                bottom: 25.sp,
                child: Center(
                    child: Text(
                  text,
                  style: TextStyle(
                      fontSize: F16(),
                      color: Colors.white,
                      fontWeight: FontWeight.w700),
                ))),
            Positioned(
                left: 15.sp,
                bottom: 07.sp,
                child: Text(view,
                    style: TextStyle(fontSize: F14(), color: Colors.white))),
          ])),
    );
  }
}
