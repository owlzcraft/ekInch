import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/shape/gf_button_shape.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../custom_widget/color.dart';
import '../../../notication/view/notification_view.dart';
import '../../../profile/widgets/profile_image.dart';
import '../../../referNearn/views/refer_nearn_view.dart';
import '../../../settings/views/settings_view.dart';

class JobProfileView extends StatelessWidget {
  JobProfileView({super.key});
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: (() => (Get.to(JobProfileView()))),
              icon: SvgPicture.asset(Assets.share_white)),
          IconButton(
            padding: const EdgeInsetsDirectional.only(end: 9.11),
            onPressed: (() => {Get.to(() => NotificationView())}),
            icon: SvgPicture.asset(Assets.notification),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.black),
            ),
          ),
          Stack(children: [
            Container(
              height: getVerticalSize(90),
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
              ),
            ),
            Padding(
              padding: EdgeInsets.zero,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    ProfileImage(),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 50, right: 10),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                "Sanjay Singh",
                                style: GoogleFonts.kadwa(
                                    color: const Color(0xFF1A1D1E),
                                    fontSize: 27,
                                    fontWeight: FontWeight.w400),
                              ),
                              Text(
                                'Electrician Mechanic',
                                style: GoogleFonts.kadwa(
                                    fontSize: 16,
                                    color: const Color(0xFF6A6A6A)),
                              ),
                              Image.asset(
                                Assets.verified,
                                width: getHorizontalSize(114),
                                height: getVerticalSize(28),
                              ),
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              width: getHorizontalSize(55),
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
                  ],
                ),
              ),
            ),
          ]),
          Padding(
            padding: const EdgeInsets.only(
                left: 25.0, right: 25.0, top: 16.0, bottom: 12.0),
            child: Column(
              children: [
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      border: Border.all(color: KColors.greyLine),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, right: 8.0, left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Text(
                              "Self Employee",
                              style: GoogleFonts.kadwa(
                                  color: const Color(0xFF1A1D1E),
                                  fontSize: 18,
                                  fontWeight: FontWeight.w400),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(left: 20),
                              child: SvgPicture.asset(Assets.certified),
                            ),
                            Text(
                              "View Certificate",
                              style: GoogleFonts.kadwa(
                                  color: KColors.textGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: Divider(
                          color: KColors.greyLine,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 30),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.location),
                                      Text(
                                        "Rorkee",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.edu),
                                      Text(
                                        "Intermediate",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.speak),
                                      Text(
                                        "Good Hindi",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.birth),
                                      Text(
                                        "20 April, 1991",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.money),
                                    Text(
                                      "1800-2500/month",
                                      style: GoogleFonts.kadwa(
                                          color: KColors.textGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.exp),
                                    Text(
                                      "3 Years Experience",
                                      style: GoogleFonts.kadwa(
                                          color: KColors.textGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.mobile),
                                    Text(
                                      "+91 7878787891",
                                      style: GoogleFonts.kadwa(
                                          color: KColors.textGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.male_outlined,
                                      color: KColors.textGrey,
                                    ),
                                    // SvgPicture.asset(Assets.birth),

                                    Text(
                                      "Male",
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
                      Padding(
                        padding: const EdgeInsets.only(left: 18.0, top: 2.0,bottom: 10),
                        child: Row(
                          children: [
                            SvgPicture.asset(Assets.suitcase),
                            Text(
                              "Light Fitting, Invertor, Motor and Electric",
                              style: GoogleFonts.kadwa(
                                  color: KColors.textGrey,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        width: Get.width,
                        // height: getVerticalSize(80),
                        decoration: const BoxDecoration(
                            color: KColors.greybg,
                            borderRadius: BorderRadius.only(
                                bottomLeft: Radius.circular(4),
                                bottomRight: Radius.circular(4))),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.center,
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
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                              Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset(
                                    Assets.whatsapp,
                                    // width: getHorizontalSize(30),
                                    // height: getVerticalSize(30),
                                  ),
                                  Text(
                                    "WhatsApp",
                                    style: GoogleFonts.kadwa(
                                        color: KColors.textGrey,
                                        fontSize: 14,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                              Padding(
                                padding: const EdgeInsets.only(top: 3.0),
                                child: Column(
                                  children: [
                                    SvgPicture.asset(Assets.msg),
                                    Text(
                                      "SMS",
                                      style: GoogleFonts.kadwa(
                                          color: KColors.textGrey,
                                          fontSize: 14,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:28.0),
                  child: GFButton(
                    onPressed: () {
                      // check();
                    },
                    color: KColors.orange,
                    fullWidthButton: true,
                    size: 50.2,
                    text: "Hire Me",
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0,
                        fontFamily: 'Kadwa'),
                  ),
                ),
                Center(
                  child: Text(
                    "   Upoad Resume",
                    style: TextStyle(
                        color: Colors.black,
                        fontSize: 17,
                        fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: MyNavigator(),
    );
  }
}
