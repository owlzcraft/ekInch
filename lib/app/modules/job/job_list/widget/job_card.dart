import 'package:circle_progress_bar/circle_progress_bar.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/job/profile/view/job_profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';

JobCardWidget(
    String title,
    String subtitle,
    String location,
    String qualification,
    String language,
    String salary,
    String experience,
    String contactNumber) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
    child: InkWell(
      onTap: () {
        Get.to(JobProfileView(
          title: title,
          subTitle: "Electrician",
          location: location,
          qualification: qualification,
          language: language,
          salary: salary,
          contactNumber: contactNumber,
          dob: "20 April, 1990",
          gender: "Male",
          skill: "Light Fitting, Invertor, Motor",
          experience: experience,
        ));
      },
      child: Container(
          width: Get.width,
          decoration: BoxDecoration(
              border: Border.all(color: KColors.greyLine),
              color: Colors.white,
              borderRadius: BorderRadius.circular(4)),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      const EdgeInsets.only(top: 8.0, right: 16.0, left: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Container(
                            height: 50.sp,
                            width: 50.sp,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                      'assets/images/rohit_malhotra.png')
                                  // : NetworkImage("${LocalStorage.shared.getProfile()}") as ImageProvider
                                  ),
                              border: Border.all(
                                  color: KColors.greyLine, width: 2.0),
                            ),
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 10.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  title,
                                  style: GoogleFonts.kadwa(
                                      color: const Color(0xFF1A1D1E),
                                      fontSize: F20(),
                                      height: 1.2,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  subtitle,
                                  style: GoogleFonts.kadwa(
                                      fontSize: F14(),
                                      color: const Color(0xFF6A6A6A)),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        alignment: AlignmentDirectional.center,
                        children: [
                          SizedBox(
                            width: 60.sp,
                            child: const CircleProgressBar(
                              foregroundColor: KColors.green,
                              backgroundColor: Colors.black12,
                              value: 0.8,
                            ),
                          ),
                          Text(
                            "80%\nMatch",
                            style: GoogleFonts.kadwa(
                                fontSize: F12(), fontWeight: FontWeight.w400),
                            textAlign: TextAlign.center,
                          )
                        ],
                      ),
                    ],
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Divider(
                    color: KColors.greyLine,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(Assets.location),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  location,
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.edu),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  qualification,
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.speak),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  language,
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              SvgPicture.asset(Assets.money),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  salary,
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.exp),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  experience,
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              SvgPicture.asset(Assets.mobile),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  contactNumber,
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Container(
                    width: Get.width,
                    // height: getVerticalSize(80),
                    decoration: const BoxDecoration(
                        color: KColors.greybg,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(4),
                            bottomRight: Radius.circular(4))),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3),
                                    child: SvgPicture.asset(
                                      Assets.call,
                                    ),
                                  ),
                                  Text(
                                    "Call",
                                    style: GoogleFonts.kadwa(
                                        color: KColors.textGrey,
                                        fontSize: F16(),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(top: 3.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SvgPicture.asset(Assets.msg),
                                  Text(
                                    "chat",
                                    style: GoogleFonts.kadwa(
                                        color: KColors.textGrey,
                                        fontSize: F16(),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              ])),
    ),
  );
}
