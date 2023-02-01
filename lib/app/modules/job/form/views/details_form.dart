import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_00/app/custom_widget/dash_header.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/job/form/controllers/job.controller.dart';
import 'package:flutter_application_00/app/modules/job/form/views/job_form.dart';
import 'package:flutter_application_00/app/modules/job/jobInterested/views/job_interested_view.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/black_button.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/notication/view/notification_view.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:flutter_application_00/app/modules/settings/views/settings_view.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class DetailsForm extends StatelessWidget {
  DetailsForm({super.key});
  JobController controller = Get.put(JobController());
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const SettingsView(),
        appBar: DynamicAppBar("Sanjay Singh", "Hello,", false),
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            color: Colors.white,
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please fill all Details",
                      style: GoogleFonts.kadwa(fontWeight: FontWeight.w700),
                    ),
                    Text("Your profile help us to find best job for you",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w400,
                            color: Color(0xFF767676),
                            fontSize: 12)),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: Get.width,
                        padding: EdgeInsets.symmetric(vertical: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: Color(0xFFCDCDCD))),
                        child: DropdownButtonHideUnderline(
                          child: DropdownButton<String>(
                            hint: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Row(
                                children: [
                                  Image.asset(
                                    'assets/images/name_text_icon.png',
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "Select Gender",
                                      style: GoogleFonts.kadwa(
                                          fontSize: getFontSize(22),
                                          color: Color(0xFF636363)),
                                    ),
                                  ),
                                ],
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
                            items: ["Male", "Female", "Others"]
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
                    ),
                    Text(
                      "Qualification ?*",
                      style: GoogleFonts.kadwa(fontWeight: FontWeight.w700),
                    ),
                    Obx(() {
                      return Row(children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.activeQualification.value = 0;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 800),
                              curve: Curves.bounceIn,
                              child: Padding(
                                padding: const EdgeInsets.only(
                                    right: 10, bottom: 10),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFCDCDCD)),
                                      color: (controller
                                                  .activeQualification.value ==
                                              0)
                                          ? Colors.black
                                          : Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.qualificationData[0]['text1']
                                            .toString(),
                                        style: TextStyle(
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    0)
                                                ? Colors.white
                                                : Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        controller.qualificationData[0]['text2']
                                            .toString(),
                                        style: TextStyle(
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    0)
                                                ? Colors.white
                                                : Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.activeQualification.value = 1;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 800),
                              curve: Curves.bounceIn,
                              child: Padding(
                                padding: const EdgeInsets.only(bottom: 10.0),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 30),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFCDCDCD)),
                                      color: (controller
                                                  .activeQualification.value ==
                                              1)
                                          ? Colors.black
                                          : Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      controller.qualificationData[1]['text1']
                                          .toString(),
                                      style: TextStyle(
                                          color: (controller.activeQualification
                                                      .value ==
                                                  1)
                                              ? Colors.white
                                              : Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        )
                      ]);
                    }),
                    Obx(() {
                      return Row(children: [
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.activeQualification.value = 2;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 800),
                              curve: Curves.bounceIn,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: Container(
                                  width: double.infinity,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFCDCDCD)),
                                      color: (controller
                                                  .activeQualification.value ==
                                              2)
                                          ? Colors.black
                                          : Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.qualificationData[2]['text1']
                                            .toString(),
                                        style: TextStyle(
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    2)
                                                ? Colors.white
                                                : Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        controller.qualificationData[2]['text2']
                                            .toString(),
                                        style: TextStyle(
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    2)
                                                ? Colors.white
                                                : Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: () {
                              controller.activeQualification.value = 3;
                            },
                            child: AnimatedContainer(
                              duration: const Duration(microseconds: 800),
                              curve: Curves.bounceIn,
                              child: Container(
                                width: double.infinity,
                                padding: EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFCDCDCD)),
                                    color:
                                        (controller.activeQualification.value ==
                                                3)
                                            ? Colors.black
                                            : Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.qualificationData[3]['text1']
                                          .toString(),
                                      style: TextStyle(
                                          color: (controller.activeQualification
                                                      .value ==
                                                  3)
                                              ? Colors.white
                                              : Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      controller.qualificationData[3]['text2']
                                          .toString(),
                                      style: TextStyle(
                                          color: (controller.activeQualification
                                                      .value ==
                                                  3)
                                              ? Colors.white
                                              : Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      ]);
                    }),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "My School Medium Was ?*",
                        style: GoogleFonts.kadwa(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Obx(() {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: controller.schoolMediums.map((m) {
                          int index = controller.schoolMediums.indexOf(m);
                          return GestureDetector(
                            onTap: () {
                              controller.activeMedium.value = index;
                            },
                            child: Padding(
                              padding: (index == 0 || index == 1)
                                  ? EdgeInsets.only(right: 10)
                                  : EdgeInsets.only(),
                              child: Container(
                                width: (Get.width / 3) - 20,
                                padding: EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    border:
                                        Border.all(color: Color(0xFFCDCDCD)),
                                    color: (controller.activeMedium == index)
                                        ? Colors.black
                                        : Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  m.toString(),
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: (controller.activeMedium == index)
                                          ? Colors.white
                                          : Color(0xFF767676),
                                      fontWeight: FontWeight.w400),
                                )),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "How i Speak English ?*",
                        style: GoogleFonts.kadwa(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Obx(() {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: controller.englishFluency.map((m) {
                          int index = controller.englishFluency.indexOf(m);
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.activeFluency.value = index;
                              },
                              child: Padding(
                                padding: (index == 0 || index == 1)
                                    ? EdgeInsets.only(right: 10)
                                    : EdgeInsets.only(),
                                child: Container(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFCDCDCD)),
                                      color: (controller.activeFluency == index)
                                          ? Colors.black
                                          : Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(children: [
                                    Text(
                                      m.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: (controller.activeFluency ==
                                                  index)
                                              ? Colors.white
                                              : Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "English",
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: (controller.activeFluency ==
                                                  index)
                                              ? Colors.white
                                              : Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ]),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "I’m Fresher/Experience*",
                        style: GoogleFonts.kadwa(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Obx(() {
                      return Row(
                        // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: controller.expData.map((m) {
                          int index = controller.expData.indexOf(m);
                          return Expanded(
                            child: GestureDetector(
                              onTap: () {
                                controller.activeExp.value = index;
                              },
                              child: Padding(
                                padding: (index == 0)
                                    ? EdgeInsets.only(right: 10)
                                    : EdgeInsets.only(),
                                child: Container(
                                  // width: (Get.width / 2) - 30,
                                  padding: EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFCDCDCD)),
                                      color: (controller.activeExp == index)
                                          ? Colors.black
                                          : Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      m.toString(),
                                      style: TextStyle(
                                          fontSize: 14,
                                          color: (controller.activeExp == index)
                                              ? Colors.white
                                              : Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    Padding(
                      padding: EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "My Age is*",
                        style: GoogleFonts.kadwa(fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(right: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xFFCDCDCD))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "Day",
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
                                  items: controller.days.map((String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            value,
                                            style: GoogleFonts.kadwa(
                                                fontSize: getFontSize(22),
                                                color: Color(0xFF636363)),
                                          ),
                                        ));
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.symmetric(
                              vertical: 5,
                            ),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(color: Color(0xFFCDCDCD))),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                hint: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 10),
                                  child: Text(
                                    "Month",
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
                                items: controller.month.map((String value) {
                                  return DropdownMenuItem<String>(
                                      value: value,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(
                                            horizontal: 10.0),
                                        child: Text(
                                          value,
                                          style: GoogleFonts.kadwa(
                                              fontSize: getFontSize(22),
                                              color: Color(0xFF636363)),
                                        ),
                                      ));
                                }).toList(),
                                onChanged: (_) {},
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Container(
                              padding: EdgeInsets.symmetric(vertical: 5),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Color(0xFFCDCDCD))),
                              child: DropdownButtonHideUnderline(
                                child: DropdownButton<String>(
                                  hint: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10),
                                    child: Text(
                                      "Year",
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
                                  items: controller.years.map((String value) {
                                    return DropdownMenuItem<String>(
                                        value: value,
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 10.0),
                                          child: Text(
                                            value,
                                            style: GoogleFonts.kadwa(
                                                fontSize: getFontSize(22),
                                                color: Color(0xFF636363)),
                                          ),
                                        ));
                                  }).toList(),
                                  onChanged: (_) {},
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: DynamicButton("Submit", true, () {
                        Get.to(JobInterestedView());
                      }),
                    )
                  ]),
            ),
          ),
        ));
  }
}
