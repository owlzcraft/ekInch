import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/job/jobInterested/widget/card.dart';

import 'package:get/get.dart';

import '../controllers/job_interested_controller.dart';

class JobInterestedView extends GetView<JobInterestedController> {
  const JobInterestedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    JobInterestedController controller = Get.put(JobInterestedController());
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        elevation: 0,
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("I am Interested in",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
        leading: Icon(Icons.menu_sharp),
        actions: [
          Container(
              margin: const EdgeInsets.only(right: 10),
              child: const Icon(Icons.search))
        ],
        backgroundColor: Colors.black,
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
        color: Colors.white,
        child: GridView.count(
          scrollDirection: Axis.vertical,
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
      bottomNavigationBar: MyNavigator(),
    );
  }
}
