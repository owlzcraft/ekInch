import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/job/form/views/details_form.dart';
import 'package:ekinch/app/modules/job/jobInterested/views/job_interested_view.dart';
import 'package:ekinch/app/modules/mobile/widget/black_button.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../dashboard/widgets/navigation.dart';

class JobLanding extends StatelessWidget {
  JobLanding({super.key});
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  GetJobController controller = Get.put(GetJobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SettingsView(),
      bottomNavigationBar: BottomTabView(2),
      // bottomNavigationBar: MyNavigator(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.drawerIcon_black),
          onPressed: () {
            if (!scaffoldKey.currentState!.isDrawerOpen) {
              //check if drawer is closed
              scaffoldKey.currentState!.openDrawer(); //open drawer
            }
          },
        ),
        actions: [
          IconButton(
              onPressed: (() => {Get.to(() => ReferNearnView())}),
              icon: SvgPicture.asset(Assets.share_black)),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: IconButton(
                onPressed: (() => {Get.to(() => NotificationView())}),
                icon: SvgPicture.asset(Assets.notification_black)),
          ),
        ],
        title: Text(
          'Jobs',
          style: GoogleFonts.kadwa(
              fontWeight: FontWeight.w700, color: Colors.black),
        ),
      ),
      body: Center(
          child: Container(
        width: Get.width,
        height: Get.height,
        color: Colors.white,
        padding: const EdgeInsets.symmetric(vertical: 30.0),
        child: Column(
          children: [
            Image.asset("assets/images/ek_inch_logo.png"),
            Text(
              'एक इंच',
              style:
                  GoogleFonts.jaldi(fontWeight: FontWeight.w400, fontSize: 40),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 20.0),
              child: Column(
                children: [
                  Text(
                    "2 Lakh+ Mechanic Registered",
                    style: GoogleFonts.kadwa(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF767676)),
                  ),
                  Text(
                    "in Ek Inch",
                    style: GoogleFonts.kadwa(
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF767676)),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child: DynamicButton("Get Job", true, () {
                controller.CheckResumeStatusValue();
                // Get.to(DetailsForm());
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BlackButton("Hire Mechanic", true, () {
                Get.to(JobInterestedView());
              }),
            ),
          ],
        ),
      )),
    );
  }
}
