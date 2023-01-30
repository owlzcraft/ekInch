// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/bottomNavigate.wodget.dart';
import '../../../notication/view/notification_view.dart';
import '../../../settings/views/settings_view.dart';

class JobListView extends StatelessWidget {
  JobListView({super.key});
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(120),
        child: AppBar(
          title: const Text(
            "Job List",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                notDrawerKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
          bottom: PreferredSize(
              preferredSize: const Size.fromHeight(20),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const Text(
                      "New Jobs (120)",
                      style: TextStyle(
                          fontSize: 18,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      width: getHorizontalSize(100),
                    ),
                    const Text(
                      "Recent (12)",
                      style: TextStyle(
                          fontSize: 18,
                          color: KColors.textGrey,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              )),
          actions: [
            IconButton(
                onPressed: (() => (Get.to(JobListView()))),
                icon: SvgPicture.asset(Assets.share)),
            IconButton(
              padding: const EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            ),
          ],
          backgroundColor:
              // Colors.white.withOpacity(0.3),
              Colors.black, //You can make this transparent
          elevation: 0.0, //No shadow
        ),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          height: getVerticalSize(74),
          width: getHorizontalSize(432),
          color: KColors.greybg,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getVerticalSize(40),
                width: getVerticalSize(100),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.lightGrey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.filter),
                    SizedBox(
                      width: getHorizontalSize(6),
                    ),
                    const Text(
                      "Sort",
                      style: TextStyle(
                          color: KColors.textGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: getHorizontalSize(10),
              ),
              Container(
                height: getVerticalSize(40),
                width: getHorizontalSize(100),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.lightGrey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.filter),
                    SizedBox(
                      width: getHorizontalSize(6),
                    ),
                    const Text(
                      "Filter",
                      style: TextStyle(
                          color: KColors.textGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              // SizedBox()
            ],
          ),
        ),
        SizedBox(
          height: getVerticalSize(12),
        ),
        Container(
            width: getHorizontalSize(378),
            height: getVerticalSize(300),
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
                        const EdgeInsets.only(top: 8.0, right: 8.0, left: 16.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Sanjay Singh",
                                  style: GoogleFonts.kadwa(
                                      color: const Color(0xFF1A1D1E),
                                      fontSize: 18,
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  'Electrician',
                                  style: GoogleFonts.kadwa(
                                      fontSize: 12,
                                      color: const Color(0xFF6A6A6A)),
                                ),
                              ],
                            ),
                            const SizedBox(
                              width: 9,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Padding(
                                padding: const EdgeInsets.only(top: 8.0),
                                child: Container(
                                  height: getVerticalSize(17),
                                  width: getHorizontalSize(61),
                                  decoration: BoxDecoration(
                                      border: Border.all(color: KColors.orange),
                                      color: KColors.orange,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: const Center(
                                    child: Text(
                                      "Edit",
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 14,
                                          fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: getHorizontalSize(30),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 23.0, top: 20.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                Assets.watch,
                              ),
                              SizedBox(
                                height: getVerticalSize(4),
                              ),
                              Text(
                                "Under Review",
                                style: GoogleFonts.kadwa(
                                    color: KColors.textGrey,
                                    fontSize: 12,
                                    fontWeight: FontWeight.w400),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Divider(
                      color: KColors.greyLine,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                    child: Row(
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(Assets.location),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Text(
                                  "Rorkee",
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(6),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.edu),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Text(
                                  "Intermediate",
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(6),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.speak),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Text(
                                  "Good Hindi",
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(6),
                            ),
                          ],
                        ),
                        SizedBox(
                          width: getHorizontalSize(20),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                SvgPicture.asset(Assets.money),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Text(
                                  "1800-2500/month",
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(6),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.exp),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Text(
                                  "3 Years Experience",
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: getVerticalSize(6),
                            ),
                            Row(
                              children: [
                                SvgPicture.asset(Assets.mobile),
                                SizedBox(
                                  width: getHorizontalSize(10),
                                ),
                                Text(
                                  "+91 7878787891",
                                  style: GoogleFonts.kadwa(
                                      color: KColors.textGrey,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Divider(
                      color: KColors.greyLine,
                    ),
                  ),
                  Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getVerticalSize(40),
                width: getVerticalSize(147),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.lightGrey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: 
                    const Center(
                      child: Text(
                        "Activate Job",
                        style: TextStyle(
                            color: KColors.textGrey,
                            fontSize: 16,
                            fontWeight: FontWeight.bold),
                      
                ),
                    ),
              ),
              SizedBox(
                width: getHorizontalSize(15),
              ),
              Container(
                height: getVerticalSize(40),
                width: getHorizontalSize(128),
                decoration: BoxDecoration(
                    border: Border.all(color: Colors.red),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: 
                    Center(
                      child: const Text(
                        "Hide Job",
                        style: TextStyle(
                            color: Colors.red,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                   
                ),
                    ),
              ),])
                ]))
      ])),
      bottomNavigationBar: MyNavigator(),
    );
  }
}
