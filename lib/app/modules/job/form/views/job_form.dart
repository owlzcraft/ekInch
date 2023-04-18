import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/modules/dashboard/widgets/dashboard_profile.dart';
import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
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
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';
import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../resume/view/preview_view.dart';
import '../../../settings/views/settings_view.dart';

class formFillView extends StatefulWidget {
  formFillView({super.key});

  @override
  State<formFillView> createState() => _formFillViewState();
}

class _formFillViewState extends State<formFillView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  JobController controller = Get.put(JobController());
  // List<int> experience = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
  final List experienceList = [
    "0",
    "1",
    "2",
    "3",
    "4",
  ];
  var expData = "Click";
  bool expDone = false;
  bool skillsDone = false;
  bool qualificationDOne = false;
  List<String> experience = ["Fresher", "1-5 Years", "5-10 Years"];
  List<String> qualification = ["10th Pass", "12th Pass", "Graduated"];
  Future showDataAlertExp(BuildContext context, String title, String subTitle,
      List<String> list, String hint, controller) async {
    return await showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(16),
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
                  padding: EdgeInsets.symmetric(vertical: 8.0),
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
                        border: Border.all(color: Color(0xFFCDCDCD))),
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
        child: Form(
          key: _formKey,
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
                          "Job Categeory",
                          "eg. electrician at Ek Inch",
                          'assets/images/name_text_icon.png',
                          controller.jobCategory)),
                ],
              ),
              Padding(padding: EdgeInsets.all(6)),
              // Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: JobForm(
              //         "Job Categeory",
              //         "eg. electrician at Ek Inch",
              //         'assets/images/name_text_icon.png',
              //         controller.jobCategory)),
              ClickAdd(
                context,
                "Experience",
                "How many years of experience in ?",
                "Click to fill your experience",
                () {
                  setState(() {
                    expDone = true;
                    expData = controller.experience;
                  });
                  showDataAlertExp(
                      context,
                      "How many years of experience in",
                      "Add your experience",
                      experience,
                      experience[0],
                      controller.experience);
                },
              ),
              ClickAdd(context, "Add Skills", "Do you have any skills ?",
                  "Click to fill your Skills", () {
                setState(() {
                  skillsDone = true;
                });
                Get.to(AddSkillView());
              }),
              ClickAdd(
                  context,
                  "What is your qualification?",
                  "Put your qualification here",
                  "Click to add your qualification", () {
                setState(() {
                  qualificationDOne = true;
                });
                showDataAlert(
                    context,
                    "Add Your Degree or Qualification",
                    "Add your degree",
                    qualification,
                    qualification[0],
                    controller.qualification);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Center(
                  child: DynamicButton("Preview and Submit", true, () {
                    if (expDone && skillsDone && qualificationDOne) {
                      if (_formKey.currentState!.validate()) {
                        // Get.to(GetJobPreviewView(
                        //   category: '${controller.jobCategory.text}',
                        //   dob:
                        //       '${controller.date.text}/${controller.month.text}/${controller.year.text}',
                        //   gender: '${controller.gender}',
                        //   quali: '${controller.qualification}',
                        //   experience: '${controller.experience}',
                        // ));
                        controller.GetJobForm();
                      } else {
                        errorSnackbar("Please fill Form");
                      }
                    } else {
                      print(expDone);
                      print(skillsDone);

                      print(qualificationDOne);

                      errorSnackbar("Please Fill All Details");
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabView(2),
    );
  }
}
