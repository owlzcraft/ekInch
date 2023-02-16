import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widget/color.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../referNearn/views/refer_nearn_view.dart';
import '../../settings/views/settings_view.dart';

class NotificationView extends StatelessWidget {
  NotificationView({super.key});
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer:   SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize:   Size.fromHeight(70),
        child: AppBar(
          title:   Text(
            "Notification",
            style: GoogleFonts.kadwa(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                notDrawerKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
          actions: [
            IconButton(
              padding:   EdgeInsetsDirectional.only(end: 9.11),
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
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.all(16.0),
              child: Text(
                "Latest ",
                style: GoogleFonts.kadwa(
                    color: Colors.black,
                    fontSize: 18,
                    fontWeight: FontWeight.w700),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    "assets/images/ek_inch_logo.png",
                    scale: 4,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_const_literals_to_create_immutables
                      children: [
                          Text(
                          "Wecome to Ek Inch App",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      "1:00PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.orange,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      "3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
            Padding(
              padding:   EdgeInsets.symmetric(horizontal:  8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(alignment: AlignmentDirectional.center, children: [
                    CircleAvatar(
                      backgroundColor: KColors.greyLine,
                      radius: 20,
                    ),
                    Icon(Icons.play_arrow)
                  ]),
                  Padding(
                    padding:   EdgeInsets.only(left: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      // ignore: prefer_ _literals_to_create_immutables
                      children: [
                          Text(
                          "New updated reels",
                          style: GoogleFonts.kadwa(
                              color: Colors.black,
                              fontSize: 16,
                              fontWeight: FontWeight.w400),
                        ),
                          Text(
                          "Learn and get more rewards from ekinch",
                          style: GoogleFonts.kadwa(
                              color: Colors.grey,
                              fontSize: 14,
                              fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                    Padding(
                    padding: EdgeInsets.only(left: 4.0),
                    child: Text(
                      " 3:15PM",
                      style: GoogleFonts.kadwa(
                          color: Colors.grey,
                          fontSize: 12,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ],
              ),
            ),
              Padding(
              padding: EdgeInsets.symmetric(vertical: 8.0),
              child: Divider(
                color: KColors.greyLine,
              ),
            ),
          ],
        ),
      ),
              bottomNavigationBar: BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
