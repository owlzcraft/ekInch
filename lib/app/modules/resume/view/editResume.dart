// ignore_for_file: file_names, unrelated_type_equality_checks

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/resume/controller/resume_controller.dart';
import 'package:ekinch/app/modules/resume/view/widget/edit%20_textfield.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../job/form/views/widgets/dropdown.dart';

class EditResume extends StatefulWidget {
  final String jobProfile;
  final String qualification;
  final String gender;
  final String exp;
  final String board;
  final String englishSpk;
  final String expTap;
  final String date;
  final String month;
  final String year;
  const EditResume(
      {super.key,
      required this.board,
      required this.date,
      required this.englishSpk,
      required this.exp,
      required this.expTap,
      required this.gender,
      required this.jobProfile,
      required this.month,
      required this.qualification,
      required this.year});

  @override
  State<EditResume> createState() => _EditResumeState();
}

class _EditResumeState extends State<EditResume> {
  @override
  void initState() {
    super.initState();
    controller.jobCategory.text = widget.jobProfile;
    controller.qualification.text = widget.qualification;
    controller.gender.text = widget.gender;
    controller.experience.text = widget.exp;
    controller.date.text = widget.date;
    controller.month.text = widget.month;
    controller.year.text = widget.year;
  }

  ResumeController controller = Get.put(ResumeController());
  final List experienceList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50'
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> qualificationList = [
      AppLocalizations.of(context)!.tenThPass,
      AppLocalizations.of(context)!.twelvethPassAbove,
      AppLocalizations.of(context)!.graduateAbove,
      AppLocalizations.of(context)!.others
    ];
    final List<String> genderList = [
      AppLocalizations.of(context)!.male,
      AppLocalizations.of(context)!.female,
      AppLocalizations.of(context)!.other
    ];
    final List<String> professionList = [
      AppLocalizations.of(context)!.labour,
      AppLocalizations.of(context)!.plastermistri,
      AppLocalizations.of(context)!.tilesmistri,
      AppLocalizations.of(context)!.plumber,
      AppLocalizations.of(context)!.electrician,
      AppLocalizations.of(context)!.painter,
      AppLocalizations.of(context)!.carpenter,
      AppLocalizations.of(context)!.welder,
      AppLocalizations.of(context)!.barbender,
      AppLocalizations.of(context)!.contractor,
      AppLocalizations.of(context)!.dukandar,
      AppLocalizations.of(context)!.customer,
      AppLocalizations.of(context)!.engineer,
      AppLocalizations.of(context)!.architect,
      AppLocalizations.of(context)!.other
    ];
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
    return Scaffold(
      bottomNavigationBar: const BottomTabView(2),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          AppLocalizations.of(context)!.editJobDetails,
          style: GoogleFonts.kadwa(
              color: Colors.white,
              fontSize: F22(),
              fontWeight: FontWeight.w700),
        ),
        centerTitle: true,
        // bottom: PreferredSize(
        // preferredSize: const Size.fromHeight(150),
        // child: Column(
        //   crossAxisAlignment: CrossAxisAlignment.center,
        //   children: [
        //     Padding(
        //       padding: const EdgeInsets.only(top: 16.0, bottom: 4),
        //       child: CircleAvatar(
        //         radius: 40,
        //         backgroundColor: const Color(0xFFE0E0E0),
        //         child: Container(
        //           height: 90.sp,
        //           width: 90.sp,
        //           decoration: BoxDecoration(
        //             color: Colors.black,
        //             shape: BoxShape.circle,
        //             image: DecorationImage(
        //                 fit: BoxFit.cover,
        //                 image: LocalStorage.shared.getProfile() ==
        //                         "https://d3nypwrzdy6f4k.cloudfront.net/"
        //                     ? const AssetImage(
        //                         'assets/images/profile_icon.png')
        //                     : NetworkImage(
        //                             "${LocalStorage.shared.getProfile()}")
        //                         as ImageProvider),
        //             border: Border.all(color: KColors.greyLine, width: 2.0),
        //           ),
        //         ),
        //       ),
        //     ),
        //     Text(
        //       "${LocalStorage.shared.getUserData()?.userData?.firstName}",
        //       style: GoogleFonts.kadwa(
        //           color: Colors.white,
        //           fontSize: F20(),
        //           fontWeight: FontWeight.w700),
        //     ),
        //     Text(
        //       "${LocalStorage.shared.getUserData()?.userData?.profession.toString()}",
        //       style: GoogleFonts.kadwa(
        //         height: 1.2,
        //         color: Colors.white,
        //         fontSize: F14(),
        //       ),
        //     ),
        //     SizedBox(
        //       height: getVerticalSize(20),
        //     )
        //   ],
        // ),
        // ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_rounded,
            size: 28.sp,
          ),
          onPressed: () {
            Get.back();
          },
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Container(
            width: Get.width,
            color: Colors.black,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 16.0, bottom: 4),
                  child: CircleAvatar(
                    radius: 40,
                    backgroundColor: const Color(0xFFE0E0E0),
                    child: Container(
                      height: 90.sp,
                      width: 90.sp,
                      decoration: BoxDecoration(
                        color: Colors.black,
                        shape: BoxShape.circle,
                        image: DecorationImage(
                            fit: BoxFit.cover,
                            image: LocalStorage.shared.getProfile() ==
                                    "https://d3nypwrzdy6f4k.cloudfront.net/"
                                ? const AssetImage(
                                    'assets/images/profile_icon.png')
                                : NetworkImage(LocalStorage.shared.getProfile())
                                    as ImageProvider),
                        border: Border.all(color: KColors.greyLine, width: 2.0),
                      ),
                    ),
                  ),
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                  style: GoogleFonts.kadwa(
                      color: Colors.white,
                      fontSize: F20(),
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.profession.toString()}",
                  style: GoogleFonts.kadwa(
                    height: 1.2,
                    color: Colors.white,
                    fontSize: F14(),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                )
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // EditText("Full Name"),
                // TextField(
                //   onChanged: (value) {
                //     // controller.address.text = value as String;
                //   },
                //   decoration: InputDecoration(
                //     hintText: "Enter Your Full Name",
                //     contentPadding:
                //         EdgeInsets.symmetric(vertical: 8.sp, horizontal: 10),
                //     focusedBorder: OutlineInputBorder(
                //         borderRadius: BorderRadius.circular(5),
                //         borderSide: const BorderSide(color: Color(0xFFFEBA0F))),
                //     border: OutlineInputBorder(
                //       borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //   ),
                //   style: GoogleFonts.kadwa(
                //       fontSize: getFontSize(22), color: const Color(0xFF636363)),
                // ),
                EditText(AppLocalizations.of(context)!.jobProfile),
                EditTextField(context, widget.jobProfile, professionList,
                    controller.jobCategory),
                EditText(AppLocalizations.of(context)!.qualification),
                EditTextField(context, widget.qualification, qualificationList,
                    controller.qualification),
                EditText(AppLocalizations.of(context)!.gender),
                EditTextField(
                    context, widget.gender, genderList, controller.gender),
                EditText(AppLocalizations.of(context)!.experience),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        AppLocalizations.of(context)!.years,
                        style: GoogleFonts.kadwa(
                            fontSize: getFontSize(22),
                            color: const Color(0xFF636363)),
                      ),
                    ),
                    isDense: true,
                    contentPadding: EdgeInsets.zero,
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                  ),
                  isExpanded: false,
                  hint: Text(
                    widget.exp,
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
                  items: experienceList
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
                      return AppLocalizations.of(context)!
                          .pleaseSelectExperience;
                    }
                    return null;
                  },
                  onChanged: (value) {
                    controller.experience.text = value as String;
                  },
                ),
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
                    // mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: schoolMediums.map((m) {
                      controller.schoolBoard.text =
                          schoolMediums[controller.activeMedium.value];
                      int index = schoolMediums.indexOf(m);
                      return GestureDetector(
                        onTap: () {
                          controller.activeMedium.value = index;
                          controller.schoolBoard.text =
                              schoolMediums[controller.activeMedium.value];
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
                                border:
                                    Border.all(color: const Color(0xFFCDCDCD)),
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
                            controller.englishLevel.text =
                                englishFluency[controller.activeFluency.value];
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
                                  color: (controller.activeFluency == index)
                                      ? Colors.black
                                      : const Color(0xFFF8F8F8),
                                  borderRadius: BorderRadius.circular(10)),
                              child: Column(children: [
                                Text(
                                  m.toString(),
                                  style: GoogleFonts.kadwa(
                                      height: 1.2,
                                      fontSize: F16(),
                                      color: (controller.activeFluency == index)
                                          ? Colors.white
                                          : const Color(0xFF767676),
                                      fontWeight: FontWeight.w400),
                                ),
                                Text(
                                  AppLocalizations.of(context)!.english,
                                  style: GoogleFonts.kadwa(
                                      height: 1.2,
                                      fontSize: F16(),
                                      color: (controller.activeFluency == index)
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
                                  borderRadius: BorderRadius.circular(10)),
                              child: Center(
                                child: Text(
                                  m.toString(),
                                  style: GoogleFonts.kadwa(
                                      fontSize: F16(),
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
                    AppLocalizations.of(context)!.myDateOfBirth,
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w700, fontSize: F18()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDropDown(
                        controller.days,
                        widget.date,
                        AppLocalizations.of(context)!.day,
                        1,
                        0,
                        controller.date),
                    CustomDropDown(
                        controller.monthNumber,
                        widget.month,
                        AppLocalizations.of(context)!.month,
                        1,
                        4,
                        controller.month),
                    CustomDropDown(
                        controller.years,
                        widget.year,
                        AppLocalizations.of(context)!.year,
                        1,
                        0,
                        controller.year),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: DynamicButton(
                      AppLocalizations.of(context)!.saveC, true, () {
                    controller.UpdateGetForm();
                  }),
                )
              ],
            ),
          ),
        ],
      )),
    );
  }
}
