import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/notication/view/widget/notifcation_card.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
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
      key: notDrawerKey, drawer: SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text(
            "Notification",
            style: GoogleFonts.kadwa(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: F24()),
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
              padding: EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            ),
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
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
             NotificationCard(
                "assets/images/ek_inch_logo.png",
                "Wecome to Ek Inch App",
                "Learn and get more rewards from ekinch",
                "1:00PM"),
            NotificationCard(
                "assets/images/ek_inch_logo.png",
                "New updated reels",
                "Learn and get more rewards from ekinch",
                "1:00PM"),
                  NotificationCard(
                "assets/images/ek_inch_logo.png",
                "New updated reels",
                "Learn and get more rewards from ekinch",
                "1:00PM"),
                  NotificationCard(
                "assets/images/ek_inch_logo.png",
                "New updated reels",
                "Learn and get more rewards from ekinch",
                "1:00PM"),
                  NotificationCard(
                "assets/images/ek_inch_logo.png",
                "New updated reels",
                "Learn and get more rewards from ekinch",
                "1:00PM"),
                  NotificationCard(
                "assets/images/ek_inch_logo.png",
                "New updated reels",
                "Learn and get more rewards from ekinch",
                "1:00PM"),
           
          ],
        ),
      ),
      bottomNavigationBar: BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
