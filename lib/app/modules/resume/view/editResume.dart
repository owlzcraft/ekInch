import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/resume/controller/resume_controller.dart';
import 'package:ekinch/app/modules/resume/view/widget/edit%20_textfield.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../job/form/views/widgets/dropdown.dart';

class EditResume extends StatefulWidget {
  String jobProfile;
  String qualification;
  String gender;
  String exp;
  String board;
  String englishSpk;
  String expTap;
  String date;
  String month;
  String year;
  EditResume(
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
  ResumeController controller = Get.put(ResumeController());
  final List<String> professionList = [
    "Electrician",
    "Painter",
    "Labour",
    "Mechanic"
  ];
  final List<String> QualificationList = [
    "10th Pass",
    "12th Pass",
    "Graduated",
    "Other"
  ];
  final List<String> GenderList = ["Male", "Female", "Other"];
  final List experienceList = [
    "0",
    "1",
    "2",
    "3",
    "4",
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomTabView(2),
      appBar: AppBar(
        automaticallyImplyLeading: true,
        title: Text(
          "Edit Job Details",
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
                                : NetworkImage(
                                        "${LocalStorage.shared.getProfile()}")
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
                EditText("Job Profile"),
                EditTextField("${widget.jobProfile}", professionList,
                    controller.jobCategory.text),
                EditText("Qualification"),
                EditTextField("${widget.qualification}", QualificationList,
                    controller.qualification),
                EditText("Gender"),
                EditTextField("${widget.gender}", GenderList, controller.gender),
                EditText("Experience"),
                DropdownButtonFormField2(
                  decoration: InputDecoration(
                    suffix: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40.0),
                      child: Text(
                        "Years",
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
                   "${widget.exp}",
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
                      return 'Please Select Experience';
                    }
                  },
                  onChanged: (value) {
                    controller.experience = value as String;
                  },
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10, bottom: 5),
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
                      controller.schoolBoard.text = controller
                          .schoolMediums[controller.activeMedium.value];
                      int index = controller.schoolMediums.indexOf(m);
                      return GestureDetector(
                        onTap: () {
                          controller.activeMedium.value = index;
                          controller.schoolBoard.text = controller
                              .schoolMediums[controller.activeMedium.value];
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
                      controller.englishLevel.text = controller
                          .englishFluency[controller.activeFluency.value];
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.activeFluency.value = index;
                            controller.englishLevel.text = controller
                                .englishFluency[controller.activeFluency.value];
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
                                  "English",
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
                      controller.experienceTap.text =
                          controller.expData[controller.activeExp.value];
                      return Expanded(
                        child: GestureDetector(
                          onTap: () {
                            controller.activeExp.value = index;
                            controller.experienceTap.text =
                                controller.expData[controller.activeExp.value];
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
                    "My Date Of Birth*",
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w700, fontSize: F18()),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    CustomDropDown(
                        controller.days, "${widget.date}", "Day", 1, 0, controller.date),
                    CustomDropDown(controller.monthNumber, "${widget.month}", "Month", 1, 4,
                        controller.month),
                    CustomDropDown(controller.years, "${widget.year}", "Year", 1, 0,
                        controller.year),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: DynamicButton("Save", true, () {
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
