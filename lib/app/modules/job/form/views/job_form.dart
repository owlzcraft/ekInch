import 'package:ekinch/app/modules/dashboard/widgets/dashboard_profile.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/click_custom.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/custom_job_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:ekinch/app/modules/listpostjob/views/jobs_view.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../settings/views/settings_view.dart';

class formFillView extends StatefulWidget {
  formFillView({super.key});

  @override
  State<formFillView> createState() => _formFillViewState();
}

class _formFillViewState extends State<formFillView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  List<String> experience = ["Fresher", "1-5 Years", "5-10 Years"];
  List<String> qualification = ["10th Pass", "12th Pass", "Graduated"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(140),
        child: AppBar(
          centerTitle: false,
          bottom: PreferredSize(
            preferredSize: const Size(0.0, 4.0),
            child: Padding(
              padding: EdgeInsets.all(12.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                        style: GoogleFonts.kadwa(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.9),
                        child: Text(
                          "Please tell us about yourself",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 14,
                          ),
                        ),
                      ),
                    ],
                  ),
                  DashboardProfile()
                ],
              ),
            ),
          ),
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
            Stack(
              children: [
                Container(
                  height: getVerticalSize(30),
                  color: Colors.black,
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: JobForm(
                        "Job title of your proile",
                        "eg. Electrician",
                        'assets/images/profession_text_icon.png')),
              ],
            ),
            Padding(
                padding: const EdgeInsets.all(10),
                child: JobForm("Job Categeory", "eg. electrician at Ek Inch",
                    'assets/images/name_text_icon.png')),
            ClickAdd(context, "Experience", "How many years of experience in ?","Click to fill your experience",
                () {
              showDataAlert(context, "How many years of experience in",
                  "Add your experience", experience, experience[0]);
            }),
            ClickAdd(context, "Add Skills", "Do you have any skills ?","Click to fill your Skills", () {
              Get.to(AddSkillView());
            }),
            ClickAdd(context, "What is your qualification?",
                "Put your qualification here","Click to add your qualification", () {
              showDataAlert(context, "Add Your Degree or Qualification",
                  "Add your degree", qualification, qualification[0]);
            }),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: Center(
                child: DynamicButton("Submit", true, () {
                  Get.to(const JobView());
                }),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabView(2),
    );
  }
}
