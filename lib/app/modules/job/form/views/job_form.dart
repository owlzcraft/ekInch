import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:flutter_application_00/app/modules/job/form/views/widgets/profile_form.dart';
import 'package:flutter_application_00/app/modules/job/profile/view/job_profile.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/shape.dart';
import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/bottomNavigate.wodget.dart';
import '../../../profile/views/profile_view.dart';
import '../../../settings/views/settings_view.dart';
import '../../job_list/view/job_list.dart';

class formFillView extends StatefulWidget {
  formFillView({super.key});

  @override
  State<formFillView> createState() => _formFillViewState();
}

class _formFillViewState extends State<formFillView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    showDataAlertExp() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "How many years of experience in",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Add your experience",
                      style: TextStyle(fontSize: 14.0, color: KColors.textGrey),
                    ),
                  ),
                ],
              ),
              content: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xFFCDCDCD))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "Fresher",
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: Color(0xFF636363)),
                              ),
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF999999),
                              ),
                            ),
                            isExpanded: true,
                            focusColor: Color(0xFFFEBA0F),
                            items: ["Fresher", "1-5 Years", "5-10 Years"]
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        value,
                                        style: GoogleFonts.kadwa(
                                            fontSize: getFontSize(22),
                                            color: Color(0xFF636363)),
                                      ),
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: GFButton(
                          onPressed: () {
                            Get.back();
                          },
                          color: KColors.orange,
                          fullWidthButton: true,
                          size: 50.2,
                          text: "Submit",
                          textStyle: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                          ),
                          // shape: GFButtonShape.standard,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    showDataAlertqualification() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Add Your Degree or Qualification",
                    style:
                        TextStyle(fontSize: 18.0, fontWeight: FontWeight.w700),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Text(
                      "Add your degree",
                      style: TextStyle(fontSize: 14.0, color: KColors.textGrey),
                    ),
                  ),
                ],
              ),
              content: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: Get.width,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xFFCDCDCD))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "10th Pass",
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: Color(0xFF636363)),
                              ),
                            ),
                            icon: Padding(
                              padding: const EdgeInsets.only(right: 10),
                              child: Icon(
                                Icons.keyboard_arrow_down,
                                color: Color(0xFF999999),
                              ),
                            ),
                            isExpanded: true,
                            focusColor: Color(0xFFFEBA0F),
                            items: ["10th Pass", "12th Pass", "Graduated"]
                                .map((String value) {
                              return DropdownMenuItem<String>(
                                  value: value,
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        value,
                                        style: GoogleFonts.kadwa(
                                            fontSize: getFontSize(22),
                                            color: Color(0xFF636363)),
                                      ),
                                    ),
                                  ));
                            }).toList(),
                            onChanged: (_) {},
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25.0),
                        child: GFButton(
                          onPressed: () {
                            Get.back();
                          },
                          color: KColors.orange,
                          fullWidthButton: true,
                          size: 50.2,
                          text: "Submit",
                          textStyle: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: 24.0,
                          ),
                          // shape: GFButtonShape.standard,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

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
              padding: EdgeInsets.only(
                  left: getHorizontalSize(16.0),
                  right: getHorizontalSize(16.0),
                  top: getVerticalSize(16.0),
                  bottom: getVerticalSize(30)),
              child: Row(
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                     Text(
                        "Sanjay Singh",
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
                  Padding(
                    padding: const EdgeInsets.only(left: 90),
                    child: InkWell(
                      onTap: () => {Get.to(ProfileView())},
                      child: CircleAvatar(
                        radius: 30,
                        backgroundColor: const Color(0xFFBFBCBC),
                        child: CircleAvatar(
                          radius: 28,
                          backgroundImage:
                              const AssetImage("assets/images/profile.jpg"),
                        ),
                      ),
                    ),
                  ),
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
                  child: Container(
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
                          Text(
                            "Job title of your proile",
                            style: GoogleFonts.kadwa(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10.0),
                            child: TextFormField(
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
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            color: KColors.greyLine)),
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(4)),
                                        borderSide: BorderSide(
                                            color: KColors.greyLine)))),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: Container(
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
                       Text(
                        "Job Categeory",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: TextFormField(
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
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.width,
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
                      Text(
                        "Experience",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.9),
                        child: Text(
                          "How many years of experience in ?",
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
                              showDataAlertExp();
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
                          Padding(
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
                                      fontWeight: FontWeight.w400),
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
                        style:GoogleFonts.kadwa(
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
                              showDataAlertqualification();
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
                Get.to(JobListView());
              }),
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
