import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';

JobAppliedCard(
    String image,
    String title,
    String subtitle,
    String time,
    String qualification,
    String experience,
    String salary,
    String location,
    String language,
    String views) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: GestureDetector(
      onTap: () {
        // Get.to(JobDescription(company: "Ultratech", jobTitle: title, subtitle: subtitle, location: location, salary: salary, qualification: qualification, language: language, require: "require", jobInfo: "Job", experience: experience, jobTime: "jobTime", interviewTime: "interviewTime", address: "address"));
        // Get.to(JobDescription("UtraTech", title, subtitle, location, salary, qualification, language, "10am to 6pm   |  Mon to Sat ", "10am to 6pm | Friday", location));
      },
      child: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                border: Border.all(color: KColors.borderGrey),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 1,
                    blurRadius: 2,
                    offset: Offset(0, 4),
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            child: Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(image),
                      Padding(
                        padding: EdgeInsets.only(left: 10.sp),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              title,
                              style: GoogleFonts.kadwa(
                                  height: 1.3,
                                  fontSize: F18(),
                                  fontWeight: FontWeight.w400),
                            ),
                            Text(
                              subtitle,
                              style: GoogleFonts.kadwa(
                                  fontSize: F12(),
                                  color: KColors.textGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(
                                          'assets/images/grad.svg'),
                                      Padding(
                                        padding: EdgeInsets.only(left: 6.sp),
                                        child: Text(
                                          qualification,
                                          style: GoogleFonts.kadwa(
                                              fontSize: F14(),
                                              color: KColors.textGrey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                      Text(
                                        ' - ',
                                        style: GoogleFonts.kadwa(
                                            fontSize: F14(),
                                            color: KColors.textGrey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        experience,
                                        style: GoogleFonts.kadwa(
                                            fontSize: F14(),
                                            color: KColors.textGrey,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/money.svg'),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 10.sp),
                                          child: Text(
                                            salary,
                                            style: GoogleFonts.kadwa(
                                                fontSize: F14(),
                                                color: KColors.textGrey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        SvgPicture.asset(
                                            'assets/images/location.svg'),
                                        Text(
                                          location,
                                          style: GoogleFonts.kadwa(
                                              fontSize: F14(),
                                              color: KColors.textGrey,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 2.sp),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        SvgPicture.asset(
                                            'assets/images/seak.svg'),
                                        Padding(
                                          padding: EdgeInsets.only(left: 6.sp),
                                          child: Text(
                                            language,
                                            style: GoogleFonts.kadwa(
                                                fontSize: F14(),
                                                color: KColors.textGrey,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Divider(
                    color: KColors.borderGrey,
                    thickness: 0.5,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical:4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Expanded(child: Image.asset("assets/images/group.png")),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal:8.0),
                            child: Text(
                              views,
                              style: GoogleFonts.kadwa(
                                fontSize: F16(),
                                color: KColors.textGrey,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child:Container(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:8.0,horizontal: 4.0),
                            child: Center(child: Text("Job Applied",style: GoogleFonts.kadwa(fontSize: F16()),)),
                          ),
                          decoration: BoxDecoration(color: KColors.orange,borderRadius: BorderRadius.circular(100)),
                        ) )
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          Positioned(
            top: 8.sp,
            right: 12.sp,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SvgPicture.asset(
                  Assets.share_black,
                  color: KColors.lightGrey,
                ),
                Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    time,
                    style: GoogleFonts.kadwa(
                        fontSize: F12(),
                        color: KColors.lightGrey,
                        fontWeight: FontWeight.w400),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
