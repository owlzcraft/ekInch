import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/recently_added/view/widget/user_card.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../notication/view/notification_view.dart';
import '../../postjob/widgets/shortDropDown.dart';
import '../../settings/views/settings_view.dart';

class RecentlyAddedView extends StatefulWidget {
  const RecentlyAddedView({super.key});

  @override
  State<RecentlyAddedView> createState() => RecentlyAddedViewState();
}

class RecentlyAddedViewState extends State<RecentlyAddedView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greybg,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text(
            "Recently Added",
            style: GoogleFonts.kadwa(
                fontSize: F24(),
                color: Colors.white,
                fontWeight: FontWeight.w700),
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
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            )
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      bottomNavigationBar: BottomTabView(9),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFeildGreyBorder(
              hintText: "Search name",
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                "Recently Added Users",
                style: GoogleFonts.kadwa(
                    fontSize: F20(),
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician")
          ],
        ),
      )),
    );
  }
}
