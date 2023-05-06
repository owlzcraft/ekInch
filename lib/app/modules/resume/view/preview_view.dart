import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/modules/dashboard/widgets/dashboard_profile.dart';
import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:ekinch/app/modules/job/form/views/details_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/click_custom.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/custom_job_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/skill_container.dart';
import 'package:ekinch/app/modules/listpostjob/views/jobs_view.dart';
import 'package:ekinch/app/modules/resume/controller/resume_controller.dart';
import 'package:ekinch/app/modules/resume/view/editResume.dart';
import 'package:ekinch/app/modules/resume/view/widget/skillCard.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../custom_widget/color.dart';
import '../../../custom_widget/font_size.dart';
import '../../../generated/assets.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../settings/views/settings_view.dart';

class GetJobPreviewView extends StatefulWidget {
  String category;
  String gender;
  String dob;
  String quali;
  String experience;
  String board;
  String expTap;
  String date;
  String month;
  String year;
  String englishSpk;
  List<String> skill;

  GetJobPreviewView(
      {super.key,
      required this.category,
      required this.dob,
      required this.gender,
      required this.englishSpk,
      required this.experience,
      required this.board,
      required this.date,
      required this.expTap,
      required this.month,
      required this.year,
      required this.skill,
      required this.quali});

  @override
  State<GetJobPreviewView> createState() => GetJobPreviewViewState();
}

class GetJobPreviewViewState extends State<GetJobPreviewView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  ResumeController controller = Get.put(ResumeController());
  final List experienceList = ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24', '25', '26', '27', '28', '29', '30', '31', '32', '33', '34', '35', '36', '37', '38', '39', '40', '41', '42', '43', '44', '45', '46', '47', '48', '49', '50']
;

  Future showDataAlertExp(
      BuildContext context, String title, String subTitle, controller) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: const EdgeInsets.all(16),
            shape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  4.0,
                ),
              ),
            ),
            title: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: GoogleFonts.kadwa(
                      fontSize: F18(), fontWeight: FontWeight.w700),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Text(
                    subTitle,
                    style: GoogleFonts.kadwa(
                        fontSize: F16(), height: 1.2, color: KColors.textGrey),
                  ),
                ),
              ],
            ),
            content: StatefulBuilder(
                builder: (BuildContext context, StateSetter setState) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: const Color(0xFFCDCDCD))),
                    child: DropdownButtonFormField2(
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
                          borderSide:
                              const BorderSide(color: Color(0xFFCDCDCD)),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      isExpanded: false,
                      hint: Text(
                        "0",
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
                        controller.value = value as String;
                      },
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
                        fontSize: F24(),
                      ),
                    ),
                  ),
                ],
              );
            }),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: PreferredSize(
      //     preferredSize: Size.fromHeight(0),
      //     child: AppBar(
      //       automaticallyImplyLeading: false,
      //       backgroundColor: Colors.black,
      //     )),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(170),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 44,
                  backgroundColor: const Color(0xFFE0E0E0),
                  child: Container(
                    height: 95.sp,
                    width: 95.sp,
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
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                  style: GoogleFonts.kadwa(
                      color: Colors.white,
                      fontSize: F20(),
                      fontWeight: FontWeight.bold),
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
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 12.0, vertical: 9),
              child: InkWell(
                onTap: () {
                  Get.to(EditResume(
                    board: widget.board,
                    englishSpk: widget.englishSpk,
                    expTap: widget.expTap,
                    gender: widget.gender,
                    exp: widget.experience,
                    date: widget.date,
                    month: widget.month,
                    jobProfile: widget.category,
                    qualification: widget.quali,
                    year: widget.year,
                  ));
                },
                child: Container(
                  width: getHorizontalSize(58),
                  height: getVerticalSize(25),
                  decoration: BoxDecoration(
                      color: KColors.orange,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      "Edit",
                      style: GoogleFonts.kadwa(
                          fontSize: F14(), color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Container(
              //   color: Colors.black,
              //   child: Padding(
              //     padding: EdgeInsets.only(left: 8.sp, top: 45.sp, right: 8.sp),
              //     child: Row(
              //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //       crossAxisAlignment: CrossAxisAlignment.start,
              //       children: [
              //         IconButton(
              //           icon: SvgPicture.asset(Assets.drawerIcon_white),
              //           onPressed: () {
              //             if (!notDrawerKey.currentState!.isDrawerOpen) {
              //               notDrawerKey.currentState!.openDrawer();
              //             }
              //           },
              //         ),
              //         Column(
              //           crossAxisAlignment: CrossAxisAlignment.center,
              //           children: [
              //             CircleAvatar(
              //               radius: 48,
              //               backgroundColor: const Color(0xFFE0E0E0),
              //               child: Container(
              //                 height: 100.sp,
              //                 width: 100.sp,
              //                 decoration: BoxDecoration(
              //                   color: Colors.black,
              //                   shape: BoxShape.circle,
              //                   image: DecorationImage(
              //                       fit: BoxFit.cover,
              //                       image: LocalStorage.shared.getProfile() ==
              //                               "https://d3nypwrzdy6f4k.cloudfront.net/"
              //                           ? const AssetImage(
              //                               'assets/images/profile_icon.png')
              //                           : NetworkImage(
              //                                   "${LocalStorage.shared.getProfile()}")
              //                               as ImageProvider),
              //                   border: Border.all(
              //                       color: KColors.greyLine, width: 2.0),
              //                 ),
              //               ),
              //             ),
              //             Text(
              //               "${LocalStorage.shared.getUserData()?.userData?.firstName}",
              //               style: GoogleFonts.kadwa(
              //                   color: Colors.white,
              //                   fontSize: F20(),
              //                   fontWeight: FontWeight.bold),
              //             ),
              //             Text(
              //               "${LocalStorage.shared.getUserData()?.userData?.profession.toString()}",
              //               style: GoogleFonts.kadwa(
              //                 height: 1.2,
              //                 color: Colors.white,
              //                 fontSize: F14(),
              //               ),
              //             ),
              //             SizedBox(
              //               height: getVerticalSize(20),
              //             )
              //           ],
              //         ),
              //         InkWell(
              //           onTap: () {},
              //           child: Container(
              //             width: getHorizontalSize(58),
              //             height: getVerticalSize(27),
              //             decoration: BoxDecoration(
              //                 color: KColors.orange,
              //                 borderRadius: BorderRadius.circular(6)),
              //             child: Center(
              //               child: Text(
              //                 "Edit",
              //                 style: GoogleFonts.kadwa(
              //                     fontSize: F14(), color: Colors.black),
              //               ),
              //             ),
              //           ),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
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
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Text(
                                  "Basic Details",
                                  style: GoogleFonts.kadwa(
                                      color: Colors.black,
                                      fontSize: F18(),
                                      fontWeight: FontWeight.w700),
                                ),
                              ),
                              Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 5.sp),
                                  child: const Divider(
                                    color: KColors.lightGrey,
                                  )),
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Job Profile Title",
                                              style: GoogleFonts.kadwa(
                                                  color: Colors.black,
                                                  fontSize: F18(),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              widget.category,
                                              style: GoogleFonts.kadwa(
                                                  color: KColors.textGrey,
                                                  fontSize: F18(),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            Text(
                                              "Date of Birth",
                                              style: GoogleFonts.kadwa(
                                                  color: Colors.black,
                                                  fontSize: F18(),
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            Text(
                                              widget.dob,
                                              style: GoogleFonts.kadwa(
                                                  color: KColors.textGrey,
                                                  fontSize: F18(),
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        Padding(
                                          padding:
                                              const EdgeInsets.only(left: 30.0),
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Gender",
                                                style: GoogleFonts.kadwa(
                                                    color: Colors.black,
                                                    fontSize: F18(),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                widget.gender,
                                                style: GoogleFonts.kadwa(
                                                    color: KColors.textGrey,
                                                    fontSize: F18(),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                "Qualification",
                                                style: GoogleFonts.kadwa(
                                                    color: Colors.black,
                                                    fontSize: F18(),
                                                    fontWeight:
                                                        FontWeight.w700),
                                              ),
                                              Text(
                                                widget.quali,
                                                style: GoogleFonts.kadwa(
                                                    color: KColors.textGrey,
                                                    fontSize: F18(),
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                      )),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: KColors.greyLine),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Experience",
                                style: GoogleFonts.kadwa(
                                    color: Colors.black,
                                    fontSize: F18(),
                                    fontWeight: FontWeight.w700),
                              ),
                              // InkWell(
                              //   onTap: () {
                              //     showDataAlertExp(
                              //         context,
                              //         "How many years of experience in",
                              //         "Add your experience",
                              //         controller.experience);
                              //   },
                              //   child: Container(
                              //     width: getHorizontalSize(78),
                              //     height: getVerticalSize(27),
                              //     decoration: BoxDecoration(
                              //         color: KColors.orange,
                              //         borderRadius: BorderRadius.circular(100)),
                              //     child: Center(
                              //       child: Text(
                              //         "Change",
                              //         style: GoogleFonts.kadwa(
                              //             fontSize: F14(), color: Colors.black),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: const Divider(
                              color: KColors.lightGrey,
                            )),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Padding(
                            padding: EdgeInsets.symmetric(horizontal: 6.sp),
                            child: Row(
                              children: [
                                CircleAvatar(
                                  backgroundColor:
                                      const Color.fromARGB(255, 228, 227, 225),
                                  child: Image.asset(
                                    color: KColors.textGrey,
                                    Assets.job,
                                    scale: 4.3,
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "${widget.experience} years Experience",
                                        style: GoogleFonts.kadwa(
                                            color: Colors.black,
                                            fontSize: F18(),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Text(
                                        "${widget.category}",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            height: 1.2,
                                            fontSize: F18(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration: BoxDecoration(
                      border: Border.all(color: KColors.greyLine),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(vertical: 8.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 16.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Skills",
                                style: GoogleFonts.kadwa(
                                    color: Colors.black,
                                    fontSize: F18(),
                                    fontWeight: FontWeight.w700),
                              ),
                              InkWell(
                                onTap: () {
                                  Get.to(
                                      AddSkillView(
                                        addSkillList: [],
                                        resultList: controller.selectedSKills,
                                      ),
                                      arguments: "resume");
                                },
                                child: Container(
                                  width: getHorizontalSize(90),
                                  height: getVerticalSize(27),
                                  decoration: BoxDecoration(
                                      color: KColors.orange,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 2.0),
                                    child: Center(
                                      child: Text(
                                        "Add More+",
                                        style: GoogleFonts.kadwa(
                                            fontSize: F14(),
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        Padding(
                            padding: EdgeInsets.symmetric(horizontal: 5.sp),
                            child: const Divider(
                              color: KColors.lightGrey,
                            )),
                        Wrap(
                          alignment: WrapAlignment.spaceBetween,
                          direction: Axis.horizontal,
                          children: (widget.skill)
                              .map((e) => SkillCard(
                                    title: e,
                                  ))
                              .toList(),
                        )
                        // GridView.count(
                        //   crossAxisCount: 3,
                        //   children: <Widget>[
                        //     SkillContainerWidget(title: "Electrician"),
                        //     SkillContainerWidget(title: "Electrician"),
                        //     SkillContainerWidget(title: "Electrician"),
                        //     SkillContainerWidget(title: "Electrician"),
                        //     SkillContainerWidget(title: "Electrician"),
                        //     SkillContainerWidget(title: "Electrician"),
                        //     SkillContainerWidget(title: "Electrician"),
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
              // Padding(
              //   padding: const EdgeInsets.symmetric(
              //       vertical: 16.0, horizontal: 12.0),
              //   child: Center(
              //     child: DynamicButton("Submit", true, () {
              //       controller.GetJobForm();
              //     }),
              //   ),
              // ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabView(2),
    );
  }
}
