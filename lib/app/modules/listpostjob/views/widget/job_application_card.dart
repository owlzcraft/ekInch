import 'dart:core';

import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';
import '../../../../utils/localStorage.dart';
import '../../controller/post_job_controller.dart';
import '../jobDescription.dart';

class JobApplicationCard extends StatefulWidget {
  final String image;
  final String title;
  final String subtitle;
  final String time;
  final String jobId;
  final String location;
  final String salary;
  final String qualification;
  final String language;
  final String require;
  final String jobInfo;
  final String experience;
  final String jobTime;
  final String views;
  final String companyName;
  final String address;
  final bool status;

  const JobApplicationCard({
    super.key,
    required this.image,
    required this.status,
    required this.title,
    required this.companyName,
    required this.jobId,
    required this.subtitle,
    required this.time,
    required this.location,
    required this.salary,
    required this.qualification,
    required this.language,
    required this.require,
    required this.jobInfo,
    required this.experience,
    required this.jobTime,
    required this.address,
    required this.views,
  });

  @override
  State<JobApplicationCard> createState() => _JobApplicationCardState();
}

class _JobApplicationCardState extends State<JobApplicationCard> {
  ApplyJobController controller = Get.put(ApplyJobController());

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: GestureDetector(
        onTap: () {
          Get.to(JobDescription(
            status: widget.status,
            company: widget.companyName,
            jobTitle: widget.title,
            subtitle: widget.subtitle,
            location: widget.location,
            salary: widget.salary,
            qualification: widget.qualification,
            language: widget.language,
            require: widget.require,
            jobInfo: widget.jobInfo,
            experience: widget.experience,
            jobTime: widget.jobTime,
            // interviewTime: "interviewTime",
            address: widget.address,
            jobId: widget.jobId,
          ));
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
                                image: LocalStorage.shared.getProfile() ==
                                        "https://d3nypwrzdy6f4k.cloudfront.net/"
                                    ? const AssetImage(
                                        'assets/images/profile_icon.png')
                                    : NetworkImage(widget.image)
                                        as ImageProvider),
                            border:
                                Border.all(color: KColors.greyLine, width: 0.0),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 8.sp),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                widget.title,
                                style: GoogleFonts.kadwa(
                                    height: 1.3,
                                    fontSize: F18(),
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                widget.subtitle,
                                style: GoogleFonts.kadwa(
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
                                            widget.qualification,
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
                                          widget.experience,
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
                                              widget.salary,
                                              style: GoogleFonts.kadwa(
                                                  fontSize: F14(),
                                                  color: KColors.textGrey,
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/location.svg'),
                                          Text(
                                            widget.location,
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
                                              widget.language,
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
                            child: Image.asset(
                          "assets/images/group.png",
                          scale: 3.0,
                        )),
                        Expanded(
                          flex: 2,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 6.0),
                            child: Text(
                              widget.views,
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
                          child: OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(
                                  color: Colors.black, width: 1),
                              fixedSize: const Size(130, 0),
                              shape: const StadiumBorder(),
                            ),
                            onPressed: () {
                              controller.ApplyJob(
                                  widget.jobId,
                                  widget.address,
                                  widget.jobTime,
                                  widget.require,
                                  widget.location,
                                  widget.qualification,
                                  widget.language,
                                  widget.salary,
                                  widget.jobInfo,
                                  widget.title,
                                  widget.experience,
                                  widget.companyName,
                                  widget.subtitle);
                            },
                            child: Text(
                              AppLocalizations.of(context)!.applyNow,
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
                    padding: const EdgeInsets.only(top: 8.0),
                    child: Text(
                      widget.time,
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
}
