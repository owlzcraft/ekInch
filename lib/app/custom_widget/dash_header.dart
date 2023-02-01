import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/language/views/language_view.dart';
import 'package:flutter_application_00/app/modules/notication/view/notification_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar DynamicAppBar(String name, String greetMsg, bool lang, GlobalKey<ScaffoldState> scaffoldKey) {
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
              onPressed: (() => {Get.to(() => LanguageView())}),
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
      preferredSize: Size.fromHeight(70),
      child: Container(
        color: Colors.black,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                padding: EdgeInsets.only(left: 10),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      greetMsg,
                      style: TextStyle(
                          fontSize: 16, color: const Color(0xffE0E0E0)),
                    ),
                    Text(name,
                        style: TextStyle(
                            fontSize: 24,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
              CircleAvatar(
                radius: 20,
                backgroundColor: const Color(0xFFBFBCBC),
                child: CircleAvatar(
                  radius: 18,
                  backgroundImage:
                      const AssetImage("assets/images/profile.jpg"),
                ),
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
