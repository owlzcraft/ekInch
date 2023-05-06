import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../job/form/views/jobs_landing.dart';
import '../../profile/views/profile_view.dart';
import '../../records/views/records_view.dart';
import '../../reels/views/reels_view.dart';
import '../controllers/dashboard_controller.dart';
import '../views/dashboard_view.dart';

class BottomTabView extends StatelessWidget {
  final int currentIndex;
  BottomTabView(this.currentIndex);
//  int _currentIndex = currentIndex;

  @override
  Widget build(BuildContext context) {
    DashboardController dashboardController = Get.put(DashboardController());

    // int currentIndex = index;
    return Container(
        width: (MediaQuery.of(context).size.width).sp,
        height: (MediaQuery.of(context).size.height / 10.1518987342).sp,
        padding: EdgeInsets.symmetric(vertical: 15.sp, horizontal: 25.sp),
        decoration: BoxDecoration(
          color: Color(0xffFFFFFF),
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
                // dashboardController.GetDashboard();
              },
              child: currentIndex == 0
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
                  : InkWell(
                      onTap: () {
                        dashboardController.GetDashboard();
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/home.png",
                              color: KColors.greyIcon,
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
                      ),
                    )),
          GestureDetector(
              onTap: () {
                // Get.to(
                //   ReelsView(),
                //   transition: Transition.fadeIn,
                // );
              },
              child: currentIndex == 1
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFFEBA0F)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/library.png",
                            color: Colors.black,
                            width: (MediaQuery.of(context).size.width /
                                    19.8879551821)
                                .sp,
                            height: (MediaQuery.of(context).size.height /
                                    42.1792618629)
                                .sp,
                          ),
                          Text(
                            "Library",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: "kadwa"),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.to(
                          ReelsView(),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/library.png",
                              color: KColors.greyIcon,
                              width: (MediaQuery.of(context).size.width /
                                      19.8879551821)
                                  .sp,
                              height: (MediaQuery.of(context).size.height /
                                      42.1792618629)
                                  .sp,
                            ),
                            Text(
                              "Library",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "kadwa"),
                            )
                          ],
                        ),
                      ),
                    )),
          GestureDetector(
              onTap: () {
                // Get.to(
                //   JobLanding(),
                //   transition: Transition.fadeIn,
                // );
              },
              child: currentIndex == 2
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFFEBA0F)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/job.png",
                            color: Colors.black,
                            width: (MediaQuery.of(context).size.width /
                                    19.8879551821)
                                .sp,
                            height: (MediaQuery.of(context).size.height /
                                    42.1792618629)
                                .sp,
                          ),
                          Text(
                            "Jobs",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: "kadwa"),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.to(
                          JobLanding(),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/job.png",
                              color: KColors.greyIcon,
                              width: (MediaQuery.of(context).size.width /
                                      19.8879551821)
                                  .sp,
                              height: (MediaQuery.of(context).size.height /
                                      42.1792618629)
                                  .sp,
                            ),
                            Text(
                              "Jobs",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "kadwa"),
                            )
                          ],
                        ),
                      ),
                    )),
          GestureDetector(
              onTap: () {
                // Get.to(
                //   RecordsView(),
                //   transition: Transition.fadeIn,
                // );
              },
              child: currentIndex == 3
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFFEBA0F)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/records.png",
                            color: Colors.black,
                            width: (MediaQuery.of(context).size.width /
                                    19.8879551821)
                                .sp,
                            height: (MediaQuery.of(context).size.height /
                                    42.1792618629)
                                .sp,
                          ),
                          Text(
                            "Records",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: "kadwa"),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.to(
                          RecordsView(),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/records.png",
                              color: KColors.greyIcon,
                              width: (MediaQuery.of(context).size.width /
                                      19.8879551821)
                                  .sp,
                              height: (MediaQuery.of(context).size.height /
                                      42.1792618629)
                                  .sp,
                            ),
                            Text(
                              "Records",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "kadwa"),
                            )
                          ],
                        ),
                      ),
                    )),
          GestureDetector(
              onTap: () {
                // Get.to(
                //   ProfileView(),
                //   transition: Transition.fadeIn,
                // );
              },
              child: currentIndex == 4
                  ? Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(color: Color(0xFFFEBA0F)))),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Image.asset(
                            "assets/images/profile.png",
                            color: Colors.black,
                            width: (MediaQuery.of(context).size.width /
                                    19.8879551821)
                                .sp,
                            height: (MediaQuery.of(context).size.height /
                                    42.1792618629)
                                .sp,
                          ),
                          Text(
                            "Profile",
                            style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                                color: Colors.black,
                                fontFamily: "kadwa"),
                          )
                        ],
                      ),
                    )
                  : InkWell(
                      onTap: () {
                        Get.to(
                          ProfileView(),
                          transition: Transition.fadeIn,
                        );
                      },
                      child: Container(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Image.asset(
                              "assets/images/profile.png",
                              color: KColors.greyIcon,
                              width: (MediaQuery.of(context).size.width /
                                      19.8879551821)
                                  .sp,
                              height: (MediaQuery.of(context).size.height /
                                      42.1792618629)
                                  .sp,
                            ),
                            Text(
                              "Profile",
                              style: TextStyle(
                                  fontSize: 10.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.grey,
                                  fontFamily: "kadwa"),
                            )
                          ],
                        ),
                      ),
                    )),
        ]));
  }
}
