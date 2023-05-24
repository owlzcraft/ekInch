// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/language/views/language_view.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/profile/views/profile_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/localStorage.dart';
import 'color.dart';

AppBar DynamicAppBar(String name, String greetMsg, bool lang,
    GlobalKey<ScaffoldState> scaffoldKey) {
  return AppBar(
    elevation: 0.0,
    backgroundColor: Colors.black,
    leading: IconButton(
      icon: SvgPicture.asset(Assets.drawerIcon_white),
      onPressed: () {
        if (!scaffoldKey.currentState!.isDrawerOpen) {
          //check if drawer is closed
          scaffoldKey.currentState!.openDrawer(); //open drawer
        }
      },
    ),
    actions: <Widget>[
      lang
          ? IconButton(
              onPressed: (() => {Get.to(() => const LanguageView())}),
              icon: SvgPicture.asset(
                Assets.languageIcon,
                color: Colors.white,
              ))
          : Container(),
      Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
            onPressed: (() => {Get.to(() => NotificationView())}),
            icon: SvgPicture.asset(Assets.notification_white)),
      ),
    ],
    bottom: PreferredSize(
      preferredSize: const Size.fromHeight(70),
      child: Container(
        color: Colors.black,
        child: Container(
          padding: const EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: const EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greetMsg,
                      style: GoogleFonts.kadwa(
                          height: 1.7,
                          fontSize: F20(),
                          color: const Color(0xffE0E0E0)),
                    ),
                    Text(name,
                        style: GoogleFonts.kadwa(
                            fontSize: F28(),
                            color: Colors.white,
                            height: 1.2,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              InkWell(
                  onTap: () => {Get.to(const ProfileView())},
                  child: CircleAvatar(
                    radius: 30,
                    backgroundColor: const Color(0xFFE0E0E0),
                    child: Container(
                      height: 70.sp,
                      width: 70.sp,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: LocalStorage.shared.getProfile() ==
                                    "https://d3nypwrzdy6f4k.cloudfront.net/"
                                ? const AssetImage(
                                    'assets/images/profile_icon.png')
                                : NetworkImage(LocalStorage.shared.getProfile())
                                    as ImageProvider),
                        border: Border.all(color: KColors.greyLine, width: 2.0),
                      ),
                    ),
                  )),
            ],
          ),
        ),
      ),
    ),
  );
}
