import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/inviteScreen.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/statusScreen.dart';
import 'package:flutter_application_00/app/modules/settings/views/settings_view.dart';
import 'package:flutter_application_00/widgets/Upperbar.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/refer_nearn_controller.dart';

class ReferNearnView extends GetView<ReferNearnController> {
  ReferNearnView({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: notDrawerKey,
        bottomNavigationBar: MyNavigator(),
        drawer: const SettingsView(),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                notDrawerKey.currentState!.openDrawer();
              }
            },
          ),
          backgroundColor: Colors.black,
          title: const Text(
            'Refer and Earn',
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          bottom: const TabBar(
            indicator: BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: Color(0xFFFEBA0F)))),
            // indicatorColor: Color(0xFFFEBA0F),
            tabs: [Tab(text: 'Invite'), Tab(text: 'Status')],
          ),
          actions: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        "1500  ",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    ),
                    Center(child: SvgPicture.asset(Assets.reward_icon)),
                  ],
                ),
              ),
            )
          ],
        ),
        body: TabBarView(
          children: [InviteScreen(), StatusScreen()],
        ),
      ),
    );
  }
}
