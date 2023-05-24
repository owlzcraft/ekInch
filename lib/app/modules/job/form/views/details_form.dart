// ignore_for_file: unused_import, unrelated_type_equality_checks
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/dropdown.dart';
import 'package:ekinch/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/dash_header.dart';
import 'package:ekinch/app/generated/assets.dart';
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
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../utils/localStorage.dart';
import '../../../dashboard/widgets/navigation.dart';

class DetailsForm extends StatelessWidget {
  DetailsForm({super.key});
  GetJobController controller = Get.put(GetJobController());
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

  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var schoolMediums = [
      AppLocalizations.of(context)!.hindi,
      AppLocalizations.of(context)!.english,
      AppLocalizations.of(context)!.others
    ].obs;
    var englishFluency = [
      AppLocalizations.of(context)!.no,
      AppLocalizations.of(context)!.goodEnglish,
      AppLocalizations.of(context)!.fluentEnglish
    ].obs;
    var expData = [
      AppLocalizations.of(context)!.fresher,
      AppLocalizations.of(context)!.experience
    ].obs;
    final List<String> gender = [
      AppLocalizations.of(context)!.male,
      AppLocalizations.of(context)!.female,
    ];
    // final List<String> month = [
    //   AppLocalizations.of(context)!.january,
    //   AppLocalizations.of(context)!.february,
    //   AppLocalizations.of(context)!.march,
    //   AppLocalizations.of(context)!.april,
    //   AppLocalizations.of(context)!.may,
    //   AppLocalizations.of(context)!.june,
    //   AppLocalizations.of(context)!.july,
    //   AppLocalizations.of(context)!.august,
    //   AppLocalizations.of(context)!.september,
    //   AppLocalizations.of(context)!.october,
    //   AppLocalizations.of(context)!.november,
    //   AppLocalizations.of(context)!.december
    // ];
    return Scaffold(
        key: scaffoldKey,
        drawer: const SettingsView(),
        bottomNavigationBar: const BottomTabView(2),

        // bottomNavigationBar: BottomBar(),
        appBar: DynamicAppBar(
            "${LocalStorage.shared.getUserData()?.userData?.firstName}",
            AppLocalizations.of(context)!.hello,
            false,
            scaffoldKey),
        body: SingleChildScrollView(
          child: Container(
            width: Get.width,
            color: Colors.white,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Form(
                key: _formKey,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        AppLocalizations.of(context)!.pleasefillallDetails,
                        style: GoogleFonts.kadwa(
                            height: 1.1,
                            fontWeight: FontWeight.w700,
                            fontSize: F18()),
                      ),
                      Text(
                          AppLocalizations.of(context)!
                              .yourprofilehelpustofindbestjobforyou,
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
                              child: Image.asset(
                                  'assets/images/name_text_icon.png'),
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
                            AppLocalizations.of(context)!.selectGender,
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
                          items: gender
                              .map((item) => DropdownMenuItem<String>(
                                    value: item,
                                    child: Text(
                                      item,
                                      style: GoogleFonts.kadwa(
                                          fontSize: getFontSize(22),
                                          color: const Color(0xFF636363)),
                                    ),
                                  ))
                              .toList(),
                          validator: (value) {
                            if (value == null) {
                              return AppLocalizations.of(context)!.selectGender;
                            }
                            return null;
                          },
                          onChanged: (value) {
                            controller.gender = value as String;
                          },
                        ),
                      ),
                      // Text(
                      //   "Qualification ?*",
                      //   style: GoogleFonts.kadwa(
                      //       fontWeight: FontWeight.w700, fontSize: F18()),
                      // ),
                      // Obx(() {
                      //   return Row(children: [
                      //     Expanded(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           controller.activeQualification.value = 0;
                      //         },
                      //         child: AnimatedContainer(
                      //           duration: const Duration(microseconds: 800),
                      //           curve: Curves.bounceIn,
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(
                      //                 right: 10, bottom: 10),
                      //             child: Container(
                      //               width: double.infinity,
                      //               padding: const EdgeInsets.symmetric(
                      //                   vertical: 10, horizontal: 30),
                      //               decoration: BoxDecoration(
                      //                   border: Border.all(
                      //                       color: const Color(0xFFCDCDCD)),
                      //                   color: (controller.activeQualification
                      //                               .value ==
                      //                           0)
                      //                       ? Colors.black
                      //                       : const Color(0xFFF8F8F8),
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //               child: Column(
                      //                 children: [
                      //                   Text(
                      //                     controller.qualificationData[0]
                      //                             ['text1']
                      //                         .toString(),
                      //                     style: GoogleFonts.kadwa(
                      //                         height: 1.2,
                      //                         fontSize: F16(),
                      //                         color: (controller
                      //                                     .activeQualification
                      //                                     .value ==
                      //                                 0)
                      //                             ? Colors.white
                      //                             : const Color(0xFF767676),
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                   Text(
                      //                     controller.qualificationData[0]
                      //                             ['text2']
                      //                         .toString(),
                      //                     style: GoogleFonts.kadwa(
                      //                         height: 1.2,
                      //                         fontSize: F16(),
                      //                         color: (controller
                      //                                     .activeQualification
                      //                                     .value ==
                      //                                 0)
                      //                             ? Colors.white
                      //                             : const Color(0xFF767676),
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           controller.activeQualification.value = 1;
                      //         },
                      //         child: AnimatedContainer(
                      //           duration: const Duration(microseconds: 800),
                      //           curve: Curves.bounceIn,
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(bottom: 10.0),
                      //             child: Container(
                      //               width: double.infinity,
                      //               padding: const EdgeInsets.symmetric(
                      //                   vertical: 20, horizontal: 30),
                      //               decoration: BoxDecoration(
                      //                   border: Border.all(
                      //                       color: const Color(0xFFCDCDCD)),
                      //                   color: (controller.activeQualification
                      //                               .value ==
                      //                           1)
                      //                       ? Colors.black
                      //                       : const Color(0xFFF8F8F8),
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //               child: Center(
                      //                 child: Text(
                      //                   controller.qualificationData[1]['text1']
                      //                       .toString(),
                      //                   style: GoogleFonts.kadwa(
                      //                       height: 1.2,
                      //                       fontSize: F16(),
                      //                       color: (controller
                      //                                   .activeQualification
                      //                                   .value ==
                      //                               1)
                      //                           ? Colors.white
                      //                           : const Color(0xFF767676),
                      //                       fontWeight: FontWeight.w400),
                      //                 ),
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ]);
                      // }),
                      // Obx(() {
                      //   return Row(children: [
                      //     Expanded(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           controller.activeQualification.value = 2;
                      //         },
                      //         child: AnimatedContainer(
                      //           duration: const Duration(microseconds: 800),
                      //           curve: Curves.bounceIn,
                      //           child: Padding(
                      //             padding: const EdgeInsets.only(right: 10.0),
                      //             child: Container(
                      //               width: double.infinity,
                      //               padding: const EdgeInsets.symmetric(
                      //                   vertical: 10, horizontal: 30),
                      //               decoration: BoxDecoration(
                      //                   border: Border.all(
                      //                       color: const Color(0xFFCDCDCD)),
                      //                   color: (controller.activeQualification
                      //                               .value ==
                      //                           2)
                      //                       ? Colors.black
                      //                       : const Color(0xFFF8F8F8),
                      //                   borderRadius:
                      //                       BorderRadius.circular(10)),
                      //               child: Column(
                      //                 children: [
                      //                   Text(
                      //                     controller.qualificationData[2]
                      //                             ['text1']
                      //                         .toString(),
                      //                     style: GoogleFonts.kadwa(
                      //                         height: 1.2,
                      //                         fontSize: F16(),
                      //                         color: (controller
                      //                                     .activeQualification
                      //                                     .value ==
                      //                                 2)
                      //                             ? Colors.white
                      //                             : const Color(0xFF767676),
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                   Text(
                      //                     controller.qualificationData[2]
                      //                             ['text2']
                      //                         .toString(),
                      //                     style: GoogleFonts.kadwa(
                      //                         height: 1.2,
                      //                         fontSize: F16(),
                      //                         color: (controller
                      //                                     .activeQualification
                      //                                     .value ==
                      //                                 2)
                      //                             ? Colors.white
                      //                             : const Color(0xFF767676),
                      //                         fontWeight: FontWeight.w400),
                      //                   ),
                      //                 ],
                      //               ),
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     ),
                      //     Expanded(
                      //       child: GestureDetector(
                      //         onTap: () {
                      //           controller.activeQualification.value = 3;
                      //         },
                      //         child: AnimatedContainer(
                      //           duration: const Duration(microseconds: 800),
                      //           curve: Curves.bounceIn,
                      //           child: Container(
                      //             width: double.infinity,
                      //             padding: const EdgeInsets.symmetric(
                      //                 vertical: 10, horizontal: 30),
                      //             decoration: BoxDecoration(
                      //                 border: Border.all(
                      //                     color: const Color(0xFFCDCDCD)),
                      //                 color: (controller
                      //                             .activeQualification.value ==
                      //                         3)
                      //                     ? Colors.black
                      //                     : const Color(0xFFF8F8F8),
                      //                 borderRadius: BorderRadius.circular(10)),
                      //             child: Column(
                      //               children: [
                      //                 Text(
                      //                   controller.qualificationData[3]['text1']
                      //                       .toString(),
                      //                   style: GoogleFonts.kadwa(
                      //                       height: 1.2,
                      //                       fontSize: F16(),
                      //                       color: (controller
                      //                                   .activeQualification
                      //                                   .value ==
                      //                               3)
                      //                           ? Colors.white
                      //                           : const Color(0xFF767676),
                      //                       fontWeight: FontWeight.w400),
                      //                 ),
                      //                 Text(
                      //                   controller.qualificationData[3]['text2']
                      //                       .toString(),
                      //                   style: GoogleFonts.kadwa(
                      //                       height: 1.2,
                      //                       fontSize: F16(),
                      //                       color: (controller
                      //                                   .activeQualification
                      //                                   .value ==
                      //                               3)
                      //                           ? Colors.white
                      //                           : const Color(0xFF767676),
                      //                       fontWeight: FontWeight.w400),
                      //                 ),
                      //               ],
                      //             ),
                      //           ),
                      //         ),
                      //       ),
                      //     )
                      //   ]);
                      // }),
                      Padding(
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        child: Text(
                          AppLocalizations.of(context)!.mySchoolMediumWas,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F18()),
                        ),
                      ),
                      Obx(() {
                        return Row(
                          children: schoolMediums.map((m) {
                            controller.schoolBoard.text =
                                schoolMediums[controller.activeMedium.value];
                            int index = schoolMediums.indexOf(m);
                            return GestureDetector(
                              onTap: () {
                                controller.activeMedium.value = index;
                                controller.schoolBoard.text = schoolMediums[
                                    controller.activeMedium.value];
                              },
                              child: Padding(
                                padding: (index == 0 || index == 1)
                                    ? const EdgeInsets.only(right: 10)
                                    : const EdgeInsets.only(),
                                child: Container(
                                  width: (Get.width / 3) - 20,
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 15, horizontal: 10),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                          color: const Color(0xFFCDCDCD)),
                                      color: (controller.activeMedium == index)
                                          ? Colors.black
                                          : const Color(0xFFF8F8F8),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Center(
                                      child: Text(
                                    m.toString(),
                                    style: GoogleFonts.kadwa(
                                        height: 1.2,
                                        fontSize: F16(),
                                        color:
                                            (controller.activeMedium == index)
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
                          AppLocalizations.of(context)!.howiSpeakEnglish,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F18()),
                        ),
                      ),
                      Obx(() {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: englishFluency.map((m) {
                            int index = englishFluency.indexOf(m);
                            controller.englishLevel.text =
                                englishFluency[controller.activeFluency.value];
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.activeFluency.value = index;
                                  controller.englishLevel.text = englishFluency[
                                      controller.activeFluency.value];
                                },
                                child: Padding(
                                  padding: (index == 0 || index == 1)
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(),
                                  child: Container(
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFCDCDCD)),
                                        color:
                                            (controller.activeFluency == index)
                                                ? Colors.black
                                                : const Color(0xFFF8F8F8),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Column(children: [
                                      Text(
                                        m.toString(),
                                        style: GoogleFonts.kadwa(
                                            height: 1.2,
                                            fontSize: F16(),
                                            color: (controller.activeFluency ==
                                                    index)
                                                ? Colors.white
                                                : const Color(0xFF767676),
                                            fontWeight: FontWeight.w400),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.english,
                                        style: GoogleFonts.kadwa(
                                            height: 1.2,
                                            fontSize: F16(),
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
                          AppLocalizations.of(context)!.imFresherExperience,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F18()),
                        ),
                      ),
                      Obx(() {
                        return Row(
                          // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: expData.map((m) {
                            int index = expData.indexOf(m);
                            controller.experienceTap.text =
                                expData[controller.activeExp.value];
                            return Expanded(
                              child: GestureDetector(
                                onTap: () {
                                  controller.activeExp.value = index;
                                  controller.experienceTap.text =
                                      expData[controller.activeExp.value];
                                },
                                child: Padding(
                                  padding: (index == 0)
                                      ? const EdgeInsets.only(right: 10)
                                      : const EdgeInsets.only(),
                                  child: Container(
                                    // width: (Get.width / 2) - 30,
                                    padding: const EdgeInsets.symmetric(
                                        vertical: 15, horizontal: 10),
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            color: const Color(0xFFCDCDCD)),
                                        color: (controller.activeExp == index)
                                            ? Colors.black
                                            : const Color(0xFFF8F8F8),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: Center(
                                      child: Text(
                                        m.toString(),
                                        style: GoogleFonts.kadwa(
                                            fontSize: F16(),
                                            color:
                                                (controller.activeExp == index)
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
                          AppLocalizations.of(context)!.myDateOfBirth,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F18()),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomDropDown(
                              days,
                              AppLocalizations.of(context)!.day,
                              AppLocalizations.of(context)!.day,
                              1,
                              0,
                              controller.date),
                          CustomDropDown(
                              monthNumber,
                              AppLocalizations.of(context)!.month,
                              AppLocalizations.of(context)!.month,
                              1,
                              4,
                              controller.month),
                          CustomDropDown(
                              years,
                              AppLocalizations.of(context)!.years,
                              AppLocalizations.of(context)!.years,
                              1,
                              0,
                              controller.year),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 40.sp),
                        child: DynamicButton(
                            AppLocalizations.of(context)!.submit, true, () {
                          if (_formKey.currentState!.validate()) {
                            Get.to(const formFillView());
                          } else {
                            errorSnackbar(AppLocalizations.of(context)!
                                .pleasefillallDetails);
                          }
                        }),
                      )
                    ]),
              ),
            ),
          ),
        ));
  }
}
