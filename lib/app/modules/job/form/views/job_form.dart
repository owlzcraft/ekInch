import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/dashboard_profile.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/click_custom.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/custom_job_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/profile_form.dart';
import 'package:ekinch/app/modules/job/profile/view/job_profile.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:velocity_x/velocity_x.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/shape.dart';
import '../../../../custom_widget/font_size.dart';
import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/bottomNavigate.wodget.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../profile/views/profile_view.dart';
import '../../../settings/views/settings_view.dart';
import '../../job_list/view/job_list.dart';
import '../../job_list/view/jobs_list.dart';

class formFillView extends StatefulWidget {
  formFillView({super.key});

  @override
  State<formFillView> createState() => _formFillViewState();
}

class _formFillViewState extends State<formFillView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.9),
                        child: const Text(
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
            ClickAdd(context, "Experience", "How many years of experience in ?",
                () {
              showDataAlert(context, "How many years of experience in",
                  "Add your experience", experience, experience[0]);
            }),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Add Skills",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.9),
                        child: Text(
                          "Do you have any skills ?",
                          style: TextStyle(
                            color: Color.fromARGB(255, 132, 131, 131),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: InkWell(
                              onTap: () {
                                Get.to(AddSkillView());
                              },
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 50),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Center(
                                  child: Text(
                                    "Click to fill your Skills",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(AddSkillView());
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: getVerticalSize(46),
                                width: getVerticalSize(99),
                                decoration: BoxDecoration(
                                    border: Border.all(color: KColors.orange),
                                    color: KColors.orange,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "What is your qualification?",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.9),
                        child: Text(
                          "Put your qualification here",
                          style: TextStyle(
                            color: Color.fromARGB(255, 132, 131, 131),
                            fontSize: 14,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              showDataAlert(
                                  context,
                                  "Add Your Degree or Qualification",
                                  "Add your degree",
                                  qualification,
                                  qualification[0]);
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 50),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Center(
                                  child: Text(
                                    "Click to fill your Skills",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: () {},
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                height: getVerticalSize(46),
                                width: getVerticalSize(99),
                                decoration: BoxDecoration(
                                    border: Border.all(color: KColors.orange),
                                    color: KColors.orange,
                                    borderRadius: BorderRadius.circular(100)),
                                child: const Center(
                                  child: Text(
                                    "Add",
                                    style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 16,
                                        fontWeight: FontWeight.w100),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Center(
              child: DynamicButton("Submit", true, () {
                Get.to(JobsList());
              }),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomTabView(2),

      // bottomNavigationBar: MyNavigator(),
    );
    // return Scaffold(
    //   backgroundColor: Colors.lightBlueAccent,
    //   body: Column(
    //     crossAxisAlignment: CrossAxisAlignment.start,
    //     children: <Widget>[
    //       Container(
    //         padding: EdgeInsets.only(
    //             top: 60.0, left: 30.0, right: 30.0, bottom: 30.0),
    //         child: Column(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: <Widget>[
    //             Text(
    //               'Hello',
    //               style: TextStyle(
    //                 color: Colors.white,
    //                 fontSize: 50.0,
    //                 fontWeight: FontWeight.w700,
    //               ),
    //             ),
    //           ],
    //         ),
    //       ),
    //       Expanded(
    //         child: Container(
    //           padding: EdgeInsets.symmetric(horizontal: 20.0),
    //           decoration: BoxDecoration(
    //             color: Colors.white,
    //             borderRadius: BorderRadius.only(
    //               topLeft: Radius.circular(20.0),
    //               topRight: Radius.circular(20.0),
    //             ),
    //           ),
    //         ),
    //       ),
    //     ],
    //   ),
    // );
  }
}
