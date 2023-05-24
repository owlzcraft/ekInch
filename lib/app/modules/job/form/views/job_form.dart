// ignore_for_file: camel_case_types

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/modules/dashboard/widgets/dashboard_profile.dart';
import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/click_custom.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/custom_job_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';
import '../../../../generated/assets.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class formFillView extends StatefulWidget {
  const formFillView({super.key});

  @override
  State<formFillView> createState() => _formFillViewState();
}

class _formFillViewState extends State<formFillView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GetJobController controller = Get.put(GetJobController());
  // List<int> experience = [0, 1, 2, 3, 4, 5, 6, 7, 8, 9];
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
  bool expDone = false;
  bool skillsDone = false;
  bool qualificationDOne = false;
  Future showDataAlertExp(BuildContext context, String title, String subTitle,
      List<String> list, String hint, TextEditingController controller) async {
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
                            AppLocalizations.of(context)!.years,
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
                          return AppLocalizations.of(context)!
                              .pleaseSelectExperience;
                        }
                        return null;
                      },
                      onChanged: (value) {
                        controller.text = value as String;
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
                      text: AppLocalizations.of(context)!.submit,
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
    List<String> experience = [
      AppLocalizations.of(context)!.fresher,
      AppLocalizations.of(context)!.onetofiveYears,
      AppLocalizations.of(context)!.fivetotenYears
    ];
    List<String> qualification = [
      AppLocalizations.of(context)!.tenThPass,
      AppLocalizations.of(context)!.twelvethPassAbove,
      AppLocalizations.of(context)!.graduateAbove
    ];
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
                            fontSize: F20(),
                            fontWeight: FontWeight.bold),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 1.9),
                        child: Text(
                          AppLocalizations.of(context)!.pleasetellusyourself,
                          style: GoogleFonts.kadwa(
                            color: Colors.white,
                            fontSize: F14(),
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
                notDrawerKey.currentState!.openDrawer();
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
                          title: AppLocalizations.of(context)!.jobCategeory,
                          hint: AppLocalizations.of(context)!
                              .egelectricianatEkInch,
                          image: 'assets/images/name_text_icon.png',
                          controller: controller.jobCategory)),
                ],
              ),
              const Padding(padding: EdgeInsets.all(6)),
              // Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: JobForm(
              //         "Job Categeory",
              //         "eg. electrician at Ek Inch",
              //         'assets/images/name_text_icon.png',
              //         controller.jobCategory)),
              ClickAdd(
                context,
                AppLocalizations.of(context)!.experience,
                AppLocalizations.of(context)!.howmanyyearsofexperienceinQ,
                AppLocalizations.of(context)!.clicktofillyourexperience,
                () {
                  setState(() {
                    expDone = true;
                    // expData = controller.experience;
                  });
                  showDataAlertExp(
                      context,
                      AppLocalizations.of(context)!.howmanyyearsofexperiencein,
                      AppLocalizations.of(context)!.addyourexperience,
                      experience,
                      experience[0],
                      controller.experience);
                },
              ),
              ClickAdd(
                  context,
                  AppLocalizations.of(context)!.addSkills,
                  AppLocalizations.of(context)!.doyouhaveanyskillsQ,
                  AppLocalizations.of(context)!.clicktofillyourSkills, () {
                setState(() {
                  skillsDone = true;
                });
                Get.to(
                    AddSkillView(
                      addSkillList: controller.selectedSKills,
                      resultList: controller.selectedSKills,
                    ),
                    arguments: "getJob");
              }),
              ClickAdd(
                  context,
                  AppLocalizations.of(context)!.whatisyourqualificationQ,
                  AppLocalizations.of(context)!.putyourqualificationhere,
                  AppLocalizations.of(context)!.clicktoaddyourqualification,
                  () {
                setState(() {
                  qualificationDOne = true;
                });
                showDataAlert(
                    context,
                    AppLocalizations.of(context)!.addYourDegreeorQualification,
                    AppLocalizations.of(context)!.addyourdegree,
                    qualification,
                    qualification[0],
                    controller.qualification);
              }),
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Center(
                  child: DynamicButton(
                      AppLocalizations.of(context)!.previewandPost, true, () {
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
                        errorSnackbar(
                            AppLocalizations.of(context)!.pleasefillallDetails);
                      }
                    } else {
                      errorSnackbar(
                          AppLocalizations.of(context)!.pleasefillallDetails);
                    }
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabView(2),
    );
  }
}
