import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:ekinch/app/modules/postjob/controllers/postjob_controller.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/mobile/widget/black_button.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../dashboard/widgets/navigation.dart';

class JobLanding extends StatefulWidget {
  const JobLanding({super.key});

  @override
  State<JobLanding> createState() => _JobLandingState();
}

class _JobLandingState extends State<JobLanding> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  GetJobController getJobcontroller = Get.put(GetJobController());
  PostjobController postJobController = Get.put(PostjobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SettingsView(),
      bottomNavigationBar: const BottomTabView(2),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.drawerIcon_black),
          onPressed: () {
            if (!scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openDrawer();
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
          AppLocalizations.of(context)!.jobs,
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
                    AppLocalizations.of(context)!.jobs2lakh,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.kadwa(
                        fontSize: F20(),
                        fontWeight: FontWeight.w400,
                        color: const Color(0xFF767676)),
                  ),
                  // Text(
                  //   "in Ek Inch",
                  //   style: GoogleFonts.kadwa(
                  //       fontSize: 20,
                  //       fontWeight: FontWeight.w400,
                  //       color: const Color(0xFF767676)),
                  // ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 20.0),
              child:
                  DynamicButton(AppLocalizations.of(context)!.getJob, true, () {
                getJobcontroller.CheckResumeStatusValue();
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: BlackButton(
                  AppLocalizations.of(context)!.hireMechanic, true, () {
                postJobController.checkPostJobStatus();
              }),
            ),
          ],
        ),
      )),
    );
  }
}
