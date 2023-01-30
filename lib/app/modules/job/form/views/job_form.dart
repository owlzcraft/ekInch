import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:flutter_application_00/app/modules/job/form/views/widgets/profile_form.dart';
import 'package:flutter_application_00/app/modules/job/profile/view/job_profile.dart';
import 'package:flutter_application_00/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/shape.dart';
import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/bottomNavigate.wodget.dart';
import '../../../settings/views/settings_view.dart';
import '../../job_list/view/job_list.dart';

class formFillView extends StatelessWidget {
  formFillView({super.key});
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
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
              padding: const EdgeInsets.only(
                  left: 16.0, right: 16.0, top: 16.0, bottom: 30),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Sanjay Singh",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 27,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      const Text(
                        "Please tell us about yourself",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    width: getHorizontalSize(110),
                  ),
                  CircleAvatar(
                    radius: 20.sp,
                    backgroundColor: const Color(0xFFBFBCBC),
                    child: CircleAvatar(
                      radius: 18.sp,
                      backgroundImage:
                          const AssetImage("assets/images/profile.jpg"),
                    ),
                  ),
                ],
              ),
            ),
          ),
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon),
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
                  height: 30,
                  color: Colors.black,
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      left: 8.0, right: 8.0, bottom: 16.0),
                  child: Container(
                    width: getHorizontalSize(408),
                    height: getVerticalSize(142),
                    decoration: BoxDecoration(
                        border: Border.all(color: KColors.greyLine),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Job title of your proile",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          // Text
                          TextFormField(
                              onTap: () {
                                // setState(() {
                                //   drop = false;
                                // });
                              },
                              // controller: nameController,
                              validator: ((value) {
                                // print(value);
                                if (value!.isEmpty) {
                                  return "This Field Can't be Empty.";
                                }
                                return null;
                              }),
                              // cursorColor: const Color(0xFFFEBA0F),
                              style: const TextStyle(fontSize: 16),
                              decoration: const InputDecoration(
                                  prefixIcon: Icon(Icons.contacts_outlined,
                                      color: Colors.black),
                                  hintStyle: TextStyle(
                                      fontSize: 18, color: Color(0xFF999898)),
                                  hintText: "eg. electrician",
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide:
                                          BorderSide(color: KColors.greyLine)),
                                  border: OutlineInputBorder(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(4)),
                                      borderSide: BorderSide(
                                          color: KColors.greyLine)))),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              child: Container(
                width: getHorizontalSize(408),
                height: getVerticalSize(142),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Job Categeory",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      // Text
                      TextFormField(
                          onTap: () {
                            // setState(() {
                            //   drop = false;
                            // });
                          },
                          validator: ((value) {
                            if (value!.isEmpty) {
                              return "This Field Can't be Empty.";
                            }
                            return null;
                          }),
                          // cursorColor: const Color(0xFFFEBA0F),
                          style: const TextStyle(fontSize: 16),
                          decoration: const InputDecoration(
                              prefixIcon: Icon(Icons.person_outline,
                                  color: Colors.black),
                              hintStyle: TextStyle(
                                  fontSize: 18, color: Color(0xFF999898)),
                              hintText: "eg. electrician at Ek Inch",
                              focusedBorder: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: KColors.greyLine)),
                              border: OutlineInputBorder(
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(4)),
                                  borderSide:
                                      BorderSide(color: KColors.greyLine)))),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              child: Container(
                width: getHorizontalSize(408),
                height: getVerticalSize(142),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Experience",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "How many years of experience in ?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 132, 131, 131),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {
                              Get.to(ProfileFormView());
                            },
                            child: Container(
                              height: getVerticalSize(46),
                              width: getVerticalSize(260),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Center(
                                child: Text(
                                  "Click to fill your experience",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          InkWell(
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              child: Container(
                width: getHorizontalSize(408),
                height: getVerticalSize(142),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Add Skills",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Do you have any skills ?",
                        style: TextStyle(
                          color: Color.fromARGB(255, 132, 131, 131),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: getVerticalSize(46),
                              width: getVerticalSize(260),
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
                          const SizedBox(
                            width: 14,
                          ),
                          InkWell(
                            onTap: () {
                              Get.to(AddSkillView());
                            },
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 16.0),
              child: Container(
                width: getHorizontalSize(408),
                height: getVerticalSize(142),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "What is your qualification?",
                        style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(
                        height: 4,
                      ),
                      const Text(
                        "Put your qualification here",
                        style: TextStyle(
                          color: Color.fromARGB(255, 132, 131, 131),
                          fontSize: 14,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: () {},
                            child: Container(
                              height: getVerticalSize(46),
                              width: getVerticalSize(260),
                              decoration: BoxDecoration(
                                  border: Border.all(color: Colors.black),
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(100)),
                              child: const Center(
                                child: Text(
                                  "Click to add your qualification",
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 14,
                          ),
                          InkWell(
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
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: GFButton(
                onPressed: () {
                  Get.to(JobListView());
                },
                color: KColors.orange,
                fullWidthButton: true,
                size: 50.2,
                text: "Submit",
                textStyle: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w900,
                    fontSize: 24.0,
                    fontFamily: 'Kadwa'),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyNavigator(),
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
