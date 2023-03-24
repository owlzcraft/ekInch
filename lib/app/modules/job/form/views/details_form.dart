// ignore_for_file: unused_import, unrelated_type_equality_checks

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/dropdown.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/dash_header.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottom_bar.dart';
import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:ekinch/app/modules/job/form/views/job_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/profile_form.dart';
import 'package:ekinch/app/modules/job/jobInterested/views/job_interested_view.dart';
import 'package:ekinch/app/modules/mobile/widget/black_button.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../utils/localStorage.dart';
import '../../../dashboard/widgets/navigation.dart';

class DetailsForm extends StatelessWidget {
  DetailsForm({super.key});
  JobController controller = Get.put(JobController());
  final List<String> Gender = [
    "Male",
    "Female",
  ];
  final List<String> month = [
    'January',
    'February,"March',
    "April",
    "May",
    "June",
    "July",
    "August",
    "September",
    "October",
    "November",
    "December"
  ];
  final List<String> days = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
  final List<String> monthNumber = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];
  List<String> years = List.generate(101, (index) => (2023 - index).toString());

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const SettingsView(),
        bottomNavigationBar: BottomTabView(2),

        // bottomNavigationBar: BottomBar(),
        appBar: DynamicAppBar(
            "${LocalStorage.shared.getUserData()?.userData?.firstName}",
            "Hello,",
            false,
            scaffoldKey),
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Please fill all Details",
                      style: GoogleFonts.kadwa(
                          fontWeight: FontWeight.w700, fontSize: F18()),
                    ),
                    Text("Your profile help us to find best job for you",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w400,
                            color: const Color(0xFF767676),
                            fontSize: F16())),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownButtonFormField2(
                        decoration: InputDecoration(
                          prefixIcon: Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child:
                                Image.asset('assets/images/name_text_icon.png'),
                          ),
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFCDCDCD)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        isExpanded: false,
                        hint: Text(
                          "Select Gender",
                          style: GoogleFonts.kadwa(
                              fontSize: getFontSize(22),
                              color: const Color(0xFF636363)),
                        ),
                        icon: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Colors.black45,
                          ),
                        ),
                        iconSize: 30,
                        buttonHeight: 60,
                        dropdownDecoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                        ),
                        items: Gender.map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: const Color(0xFF636363)),
                              ),
                            )).toList(),
                        validator: (value) {
                          if (value == null) {
                            return 'Please Select Gender';
                          }
                        },
                        onChanged: (value) {
                          controller.gender = value as String;
                        },
                      ),
                    ),
                    Text(
                      "Qualification ?*",
                      style: GoogleFonts.kadwa(
                          fontWeight: FontWeight.w700, fontSize: F18()),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFCDCDCD)),
                                      color: (controller
                                                  .activeQualification.value ==
                                              0)
                                          ? Colors.black
                                          : const Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.qualificationData[0]['text1']
                                            .toString(),
                                        style: GoogleFonts.kadwa(
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    0)
                                                ? Colors.white
                                                : const Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        controller.qualificationData[0]['text2']
                                            .toString(),
                                        style: GoogleFonts.kadwa(
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    0)
                                                ? Colors.white
                                                : const Color(0xFF767676),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFCDCDCD)),
                                      color: (controller
                                                  .activeQualification.value ==
                                              1)
                                          ? Colors.black
                                          : const Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      controller.qualificationData[1]['text1']
                                          .toString(),
                                      style: GoogleFonts.kadwa(
                                          color: (controller.activeQualification
                                                      .value ==
                                                  1)
                                              ? Colors.white
                                              : const Color(0xFF767676),
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
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10, horizontal: 30),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFCDCDCD)),
                                      color: (controller
                                                  .activeQualification.value ==
                                              2)
                                          ? Colors.black
                                          : const Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(
                                    children: [
                                      Text(
                                        controller.qualificationData[2]['text1']
                                            .toString(),
                                        style: GoogleFonts.kadwa(
                                            height: 1.6,
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    2)
                                                ? Colors.white
                                                : const Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        controller.qualificationData[2]['text2']
                                            .toString(),
                                        style: GoogleFonts.kadwa(
                                            height: 1.6,
                                            color: (controller
                                                        .activeQualification
                                                        .value ==
                                                    2)
                                                ? Colors.white
                                                : const Color(0xFF767676),
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
                                padding: const EdgeInsets.symmetric(
                                    vertical: 10, horizontal: 30),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFCDCDCD)),
                                    color:
                                        (controller.activeQualification.value ==
                                                3)
                                            ? Colors.black
                                            : const Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Column(
                                  children: [
                                    Text(
                                      controller.qualificationData[3]['text1']
                                          .toString(),
                                      style: GoogleFonts.kadwa(
                                          height: 1.6,
                                          color: (controller.activeQualification
                                                      .value ==
                                                  3)
                                              ? Colors.white
                                              : const Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      controller.qualificationData[3]['text2']
                                          .toString(),
                                      style: GoogleFonts.kadwa(
                                          height: 1.6,
                                          color: (controller.activeQualification
                                                      .value ==
                                                  3)
                                              ? Colors.white
                                              : const Color(0xFF767676),
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
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "My School Board Was ?*",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, fontSize: F18()),
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
                                  ? const EdgeInsets.only(right: 10)
                                  : const EdgeInsets.only(),
                              child: Container(
                                width: (Get.width / 3) - 20,
                                padding: const EdgeInsets.symmetric(
                                    vertical: 20, horizontal: 10),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: const Color(0xFFCDCDCD)),
                                    // ignore: unrelated_type_equality_checks
                                    color: (controller.activeMedium == index)
                                        ? Colors.black
                                        : const Color(0xFFF8F8F8),
                                    borderRadius: BorderRadius.circular(10)),
                                child: Center(
                                    child: Text(
                                  m.toString(),
                                  style: GoogleFonts.kadwa(
                                      fontSize: F14(),
                                      height: 1.6,
                                      color: (controller.activeMedium == index)
                                          ? Colors.white
                                          : const Color(0xFF767676),
                                      fontWeight: FontWeight.w400),
                                )),
                              ),
                            ),
                          );
                        }).toList(),
                      );
                    }),
                    Padding(
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "How i Speak English ?*",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, fontSize: F18()),
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
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(),
                                child: Container(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFCDCDCD)),
                                      color: (controller.activeFluency == index)
                                          ? Colors.black
                                          : const Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Column(children: [
                                    Text(
                                      m.toString(),
                                      style: GoogleFonts.kadwa(
                                          fontSize: F14(),
                                          color: (controller.activeFluency ==
                                                  index)
                                              ? Colors.white
                                              : const Color(0xFF767676),
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      "English",
                                      style: GoogleFonts.kadwa(
                                          fontSize: F14(),
                                          color: (controller.activeFluency ==
                                                  index)
                                              ? Colors.white
                                              : const Color(0xFF767676),
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
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "I’m Fresher/Experience*",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, fontSize: F18()),
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
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(),
                                child: Container(
                                  // width: (Get.width / 2) - 30,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 20, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFCDCDCD)),
                                      color: (controller.activeExp == index)
                                          ? Colors.black
                                          : const Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                    child: Text(
                                      m.toString(),
                                      style: GoogleFonts.kadwa(
                                          fontSize: F14(),
                                          color: (controller.activeExp == index)
                                              ? Colors.white
                                              : const Color(0xFF767676),
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
                      padding: const EdgeInsets.only(top: 15, bottom: 5),
                      child: Text(
                        "My Date Of Birth*",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, fontSize: F18()),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        CustomDropDown(days, "Day", "Day", 1, 4),
                        CustomDropDown(monthNumber, "Month", "Month", 1, 4),
                        CustomDropDown(years, "Years", "Year", 1, 4),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 40.sp),
                      child: DynamicButton("Submit", true, () {
                        Get.to(formFillView());
                      }),
                    )
                  ]),
            ),
          ),
        ));
  }
}
