import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/all_request.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';
import '../../../listpostjob/views/jobDescription.dart';

class JobApplicationRequestCard extends StatelessWidget {
  String image;
  String title;
  String subtitle;
  String time;
  String qualification;
  String experience;
  String salary;
  String location;
  String language;
  String views;
  bool open;
  JobApplicationRequestCard(
      {super.key,
      required this.experience,
      required this.image,
      required this.language,
      required this.location,
      required this.open,
      required this.qualification,
      required this.salary,
      required this.subtitle,
      required this.time,
      required this.title,
      required this.views});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(AllApplicationListView(
              company: "companyName",
              title: title,
              location: location,
              salary: salary,
              qualification: qualification,
              language: language,
              experience: experience,
              time: time));
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
                      offset: const Offset(0, 4),
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
                        Container(
                          height: getVerticalSize(45),
                          width: getHorizontalSize(85),
                          decoration: BoxDecoration(
                            color: Colors.black,
                            shape: BoxShape.rectangle,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage("$image") as ImageProvider),
                            border:
                                Border.all(color: KColors.greyLine, width: 0.0),
                          ),
                        ),
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
                                    height: 1.2,
                                    fontSize: F14(),
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
                                            padding:
                                                EdgeInsets.only(left: 6.sp),
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
                    const Divider(
                      color: KColors.greyIcon,
                      thickness: 0.5,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                            flex: 1,
                            child: Image.asset("assets/images/group.png")),
                        Expanded(
                          flex: 3,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
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
                          flex: 3,
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: Colors.black, width: 1),
                              fixedSize: const Size(140, 0),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Text(
                              'View Request',
                              style: GoogleFonts.kadwa(
                                  color: Colors.black,
                                  fontSize: F16(),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            Positioned(
              top: 16.sp,
              right: 16.sp,
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: open
                        ? Container(
                            width: getHorizontalSize(60),
                            height: getVerticalSize(21),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color:
                                    const Color.fromARGB(255, 159, 242, 247)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Center(
                                child: Text(
                                  "Open",
                                  style: GoogleFonts.kadwa(
                                      fontSize: F12(), color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : Container(
                            width: getHorizontalSize(60),
                            height: getVerticalSize(21),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(40),
                                color: Color.fromARGB(255, 244, 129, 121)),
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 2.0),
                              child: Center(
                                child: Text(
                                  "Closed",
                                  style: GoogleFonts.kadwa(
                                      fontSize: F12(), color: Colors.black),
                                ),
                              ),
                            ),
                          ),
                  ),
                  SvgPicture.asset(
                    "assets/icons/3dot.svg",
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
