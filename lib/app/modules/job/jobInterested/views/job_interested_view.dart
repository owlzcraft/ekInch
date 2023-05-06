import 'package:ekinch/app/modules/listpostjob/controller/post_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/job/jobInterested/widget/card.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/postjob/views/postjob_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../dashboard/widgets/navigation.dart';
import '../../../postjob/controllers/postjob_controller.dart';
import '../controllers/job_interested_controller.dart';

class JobInterestedView extends StatelessWidget {
  JobInterestedView({Key? key}) : super(key: key);
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
   PostjobController  controller = Get.put(PostjobController());
    return Scaffold(
      key: notDrawerKey,
      drawer: const SettingsView(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: Text(
            "I am Interested in",
            style: GoogleFonts.kadwa(
                color: Colors.white, fontWeight: FontWeight.bold),
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
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                children: controller.jobCategory.map((e) {
                  var index = controller.jobCategory.indexOf(e);
                  return Obx(() => GestureDetector(
                        onTap: () {
                          print(controller.activeCategory.value);
                          print(controller
                                  .jobCategory[controller.activeCategory.value]
                              ['title']);
                          controller.profession1.text = controller
                              .jobCategory[controller.activeCategory.value]
                                  ['title']
                              .toString();
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
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20, left: 16.0, right: 16.0),
              child: DynamicButton("Proceed", true, () {
                Get.to(PostjobView());
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: BottomTabView(2),

      // bottomNavigationBar: MyNavigator(),
    );
  }
}
