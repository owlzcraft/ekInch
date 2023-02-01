import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/job/jobInterested/widget/card.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/notication/view/notification_view.dart';
import 'package:flutter_application_00/app/modules/settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/job_interested_controller.dart';

class JobInterestedView extends GetView<JobInterestedController> {
  JobInterestedView({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    JobInterestedController controller = Get.put(JobInterestedController());
    return Scaffold(
      key: notDrawerKey,
      drawer: const SettingsView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title:  Text(
            "I am Interested in",
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
              padding: const EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {}),
              icon: SvgPicture.asset(Assets.search_icon),
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
          children: [
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              color: Colors.white,
              child: GridView.count(
                scrollDirection: Axis.vertical,
                // scrollDirection: Axis.,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                children: controller.jobCategory.map((e) {
                  int index = controller.jobCategory.indexOf(e);
                  return Obx(() => GestureDetector(
                        onTap: () {
                          controller.activeCategory.value = index;
                        },
                        child: JobCategoryCard(
                            data: e,
                            active: index == controller.activeCategory.value
                                ? true
                                : false),
                      ));
                }).toList(),
              ),
            ),
            DynamicButton("Proceed", true, () {})
          ],
        ),
      ),
      bottomNavigationBar: MyNavigator(),
    );
  }
}
