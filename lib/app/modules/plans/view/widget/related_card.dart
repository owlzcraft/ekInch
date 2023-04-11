import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

RelatedCard(Color color, String title, String price, String p1, String p2,
    String purchaseDate, String expireDate) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 10.0),
    child: Stack(
      children: [
        Container(
          width: getHorizontalSize(340),
          decoration: BoxDecoration(
              color: color, borderRadius: BorderRadius.circular(6)),
          child: Column(
            children: [
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      title,
                      style: GoogleFonts.poppins(
                          fontSize: F20(),
                          fontWeight: FontWeight.w500,
                          color: Colors.white),
                    ),
                    Row(
                      children: [
                        SvgPicture.asset("assets/icons/Rupee.svg"),
                        Text(
                          price,
                          style: GoogleFonts.poppins(
                              fontSize: F24(),
                              fontWeight: FontWeight.w600,
                              color: Colors.white),
                        ),
                      ],
                    )
                  ],
                ),
              ),
              SvgPicture.asset(
                "assets/icons/divider.svg",
                color: Colors.black,
                width: Get.width,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 2.sp,
                          backgroundColor: KColors.plansGreen,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            p1,
                            style: GoogleFonts.poppins(
                                fontSize: F12(),
                                fontWeight: FontWeight.w400,
                                color: KColors.plansGreen),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CircleAvatar(
                          radius: 2.sp,
                          backgroundColor: KColors.plansGreen,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            p2,
                            style: GoogleFonts.poppins(
                                fontSize: F12(),
                                fontWeight: FontWeight.w400,
                                color: KColors.plansGreen),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 13.0, bottom: 20.0),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Icon(
                          Icons.watch_later_outlined,
                          color: Colors.white,
                          size: 15.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            "Purchase Date :  $purchaseDate",
                            style: GoogleFonts.poppins(
                                fontSize: F12(),
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(
                          Icons.calendar_month_outlined,
                          color: Colors.white,
                          size: 15.sp,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Text(
                            "Expire Date :  $expireDate",
                            style: GoogleFonts.poppins(
                                fontSize: F12(),
                                fontWeight: FontWeight.w500,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
        Positioned(
          right: 16.sp,
          bottom: 20.sp,
          child: Container(
            width: getHorizontalSize(100),
            height: getVerticalSize(40),
            decoration: BoxDecoration(
                color: KColors.orange,
                borderRadius: BorderRadius.circular(100)),
            child: Center(
              child: Text(
                "Buy Now",
                style: GoogleFonts.poppins(
                    fontSize: F14(),
                    fontWeight: FontWeight.w500,
                    color: Colors.black),
              ),
            ),
          ),
        )
      ],
    ),
  );
}
