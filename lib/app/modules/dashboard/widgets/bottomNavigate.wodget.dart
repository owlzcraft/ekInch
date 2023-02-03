import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_application_00/app/modules/job/form/views/job_form.dart';
import 'package:flutter_application_00/app/modules/job/form/views/jobs_landing.dart';
import 'package:flutter_application_00/app/modules/job/profile/view/job_profile.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/profile/views/profile_view.dart';
import 'package:flutter_application_00/app/modules/records/views/records_view.dart';
import 'package:flutter_application_00/app/modules/reels/views/reels_view.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MyNavigator extends StatefulWidget {
  @override
  State<MyNavigator> createState() => _MyNavigatorState();
}

class _MyNavigatorState extends State<MyNavigator> {
  bool onHome = false;

  bool onLib = false;

  bool onJobs = false;

  bool onRecords = false;

  bool onProfile = false;

  @override
  Widget build(BuildContext context) {
    // print( MediaQuery.of(context).size.width);
    return Container(
        width: (MediaQuery.of(context).size.width).sp,
        height: (MediaQuery.of(context).size.height / 10.1518987342).sp,
        padding: EdgeInsets.symmetric(vertical: 17.sp, horizontal: 25.sp),
        decoration: BoxDecoration(
          color: const Color(0xffFFFFFF),
          boxShadow: [
            BoxShadow(
              color: Colors.grey,
              blurRadius: 8.sp,
              spreadRadius: 0,
              offset: const Offset(2, 0),
            ),
          ],
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(15.sp),
            topRight: Radius.circular(15.sp),
          ),
        ),
        child:
            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
          GestureDetector(
              onTap: () {
                onHome = true;
                onLib = false;
                onJobs = false;
                onRecords = false;
                onProfile = false;

                print(onRecords);
                Get.to(DashboardView());
              },
              child: onHome == true
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFFEBA0F)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/home.png",
                            width: (MediaQuery.of(context).size.width /
                                    19.8879551821)
                                .sp,
                            height: (MediaQuery.of(context).size.height /
                                    42.1792618629)
                                .sp,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: "kadwa"),
                          )
                        ],
                      ),
                    )
                  : Container(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/home.png",
                            color: Colors.grey,
                            width: (MediaQuery.of(context).size.width /
                                    19.8879551821)
                                .sp,
                            height: (MediaQuery.of(context).size.height /
                                    42.1792618629)
                                .sp,
                          ),
                          Text(
                            "Home",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.grey,
                                fontFamily: "kadwa"),
                          )
                        ],
                      ),
                    )),
          GestureDetector(
            onTap: () => Get.to(ReelsView()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/library.png",
                  width: (MediaQuery.of(context).size.width / 14.1724137931).sp,
                  height:
                      (MediaQuery.of(context).size.height / 34.2857142857).sp,
                ),
                Text(
                  "Library",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffACACAC),
                      fontFamily: "kadwa"),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () {
              Get.to(JobLanding());
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/job.png",
                  width: (MediaQuery.of(context).size.width / 19.8879551821).sp,
                  height:
                      (MediaQuery.of(context).size.height / 42.1792618629).sp,
                ),
                Text(
                  "Jobs",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffACACAC),
                      fontFamily: "kadwa"),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => {
              onHome = false,
              onRecords = true,
              print(onRecords),
              Get.to(RecordsView()),
            },
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  Assets.records,
                  width: (MediaQuery.of(context).size.width / 19.8879551821).sp,
                  height:
                      (MediaQuery.of(context).size.height / 42.1792618629).sp,
                ),
                Text(
                  "Records",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffACACAC),
                      fontFamily: "kadwa"),
                )
              ],
            ),
          ),
          GestureDetector(
            onTap: () => Get.to(ProfileView()),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset(
                  "assets/images/profile.png",
                  width: (MediaQuery.of(context).size.width / 19.8879551821).sp,
                  height:
                      (MediaQuery.of(context).size.height / 42.1792618629).sp,
                ),
                Text(
                  "Profile",
                  style: TextStyle(
                      fontSize: 10.sp,
                      fontWeight: FontWeight.w400,
                      color: const Color(0xffACACAC),
                      fontFamily: "kadwa"),
                )
              ],
            ),
          ),
        ]));
  }
}
