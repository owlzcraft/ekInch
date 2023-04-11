import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/payment/view/payments_view.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

PlansCard(
  Color color,
  String topTitle,
  String title,
  String subtitle,
  String p1,
  String p2,
  String p3,
  String p4,
  String p5,
  String p6,
) {
  return Stack(
    // alignment: Alignment,
    children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
        child: Container(
          width: getHorizontalSize(340),
          height: getVerticalSize(560),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(20)),
        ),
      ),
      Positioned(
          left: 70.sp,
          right: 70.sp,
          child: Container(
            // width: getHorizontalSize(80),
            height: getVerticalSize(40),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(100)),
            child: Center(
                child: Text(
              "Most Recommended",
              style: GoogleFonts.roboto(fontSize: F16()),
            )),
          )),
      Positioned(
          left: 20.sp,
          top: 50.sp,
          child: Column(
            children: [
              Text(
                "Starter Plan",
                style: GoogleFonts.roboto(
                    fontSize: F40(), fontWeight: FontWeight.w600),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Row(
                  children: [
                    Text(
                      "INR 999.00",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: F20(),
                          fontWeight: FontWeight.w500),
                    ),
                    Text(
                      "/ per annual",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: F16(),
                          fontWeight: FontWeight.w400),
                    ),
                  ],
                ),
              ),
              Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 30.0, vertical: 16.0),
                  child: SvgPicture.asset("assets/icons/divider.svg")),
            ],
          )),
      Positioned(
          bottom: 120.sp,
          left: 40.sp,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RowCard(p1),
              RowCard(p2),
              RowCard(p3),
              RowCard(p4),
              RowCard(p5),
              RowCard(p6),
            ],
          )),
      Positioned(
          bottom: 60.sp,
          left: 70.sp,
          right: 76.sp,
          child: InkWell(
            onTap: () {
              Get.to(PaymentView());
            },
            child: Container(
              width: getHorizontalSize(170),
              height: getVerticalSize(50),
              decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(100)),
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Subscribe Now",
                      style: GoogleFonts.roboto(
                          color: Colors.white,
                          fontSize: F18(),
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 2.0),
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      ),
                    )
                  ],
                ),
              ),
            ),
          ))
    ],
  );
}

RowCard(String desc) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Row(
      children: [
        Image.asset(
          "assets/images/check.png",
          scale: 2.0,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0),
          child: Text(
            desc,
            style: GoogleFonts.roboto(
                color: Colors.black,
                fontSize: F16(),
                fontWeight: FontWeight.w400),
          ),
        ),
      ],
    ),
  );
}
