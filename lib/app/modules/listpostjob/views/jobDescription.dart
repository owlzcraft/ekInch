// ignore_for_file: file_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/listpostjob/controller/post_job_controller.dart';
import 'package:ekinch/app/modules/listpostjob/views/widget/key_value.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../settings/views/settings_view.dart';

class JobDescription extends StatefulWidget {
  final String company;
  final String jobId;
  final String jobTitle;
  final String subtitle;
  final String location;
  final String salary;
  final String qualification;
  final String language;
  final String require;
  final String jobInfo;
  final String experience;
  final String jobTime;
  // final String interviewTime;
  final String address;
  final bool status;

  const JobDescription(
      {super.key,
      required this.company,
      required this.jobId,
      required this.jobTitle,
      required this.subtitle,
      required this.location,
      required this.salary,
      required this.qualification,
      required this.language,
      required this.require,
      required this.jobInfo,
      required this.experience,
      required this.jobTime,
      required this.status,
      // required this.interviewTime,
      required this.address});
  @override
  JobDescriptionState createState() => JobDescriptionState();
}

class JobDescriptionState extends State<JobDescription>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  ApplyJobController controller = Get.put(ApplyJobController());
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: const BottomTabView(2),
      drawer: const SettingsView(),
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.drawerIcon_white),
          onPressed: () {
            if (!scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        backgroundColor: Colors.black,
        title: Text(
          widget.company,
          style:
              GoogleFonts.kadwa(fontSize: F24(), fontWeight: FontWeight.w700),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: SvgPicture.asset(Assets.share_white),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(widget.jobTitle,
                          style: GoogleFonts.kadwa(
                              height: 1.2,
                              fontSize: F18(),
                              fontWeight: FontWeight.w400)),
                      Text(widget.subtitle,
                          style: GoogleFonts.kadwa(
                              fontSize: F14(),
                              fontWeight: FontWeight.w400,
                              color: greylight))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.location),
                      Text(widget.location,
                          style: GoogleFonts.kadwa(
                              fontSize: F14(),
                              fontWeight: FontWeight.w400,
                              color: greylight))
                    ],
                  )
                ],
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    children: [
                      CustomRow(context, AppLocalizations.of(context)!.jobTitle,
                          widget.jobTitle),
                      CustomRow(
                          context,
                          AppLocalizations.of(context)!.inHandSalary,
                          widget.salary),
                      CustomRow(
                          context,
                          AppLocalizations.of(context)!.qualification,
                          widget.qualification),
                      CustomRow(context, AppLocalizations.of(context)!.language,
                          widget.language),
                      CustomRow(context, AppLocalizations.of(context)!.required,
                          widget.require),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(
                              width: MediaQuery.of(context).size.width * 0.3,
                              child: Text(
                                AppLocalizations.of(context)!.jobInfo,
                                style: GoogleFonts.kadwa(
                                    fontSize: F16(),
                                    fontWeight: FontWeight.w400),
                              )),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.03,
                            child: const Text(
                              ":",
                              style: TextStyle(color: KColors.textGrey),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              widget.jobInfo,
                              style: GoogleFonts.kadwa(
                                  color: KColors.textGrey,
                                  height: 1.3,
                                  fontSize: F16(),
                                  fontWeight: FontWeight.w400),
                            ),
                          )
                        ],
                      ),
                      // CustomRow(context, "Job Info", widget.jobInfo),
                      CustomRow(
                          context,
                          AppLocalizations.of(context)!.experience,
                          widget.experience),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                AppLocalizations.of(context)!.otherDetails,
                style: GoogleFonts.kadwa(
                    fontWeight: FontWeight.w700, color: black, fontSize: F18()),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Card(
                elevation: 2,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5)),
                child: Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15, top: 15, bottom: 15),
                  child: Column(
                    children: [
                      CustomRow(
                          context,
                          AppLocalizations.of(context)!.jobTiming,
                          widget.jobTime),
                      // CustomRow(
                      //     context, "Interview Timing", widget.interviewTime),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                AppLocalizations.of(context)!.companyAddress,
                style: GoogleFonts.kadwa(
                    fontWeight: FontWeight.w700, color: black, fontSize: F18()),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.all(12.sp),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        CustomRow(
                            context,
                            AppLocalizations.of(context)!.address,
                            widget.address)
                      ],
                    ),
                  )),
              (widget.status)
                  ? Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: DynamicButton(
                          AppLocalizations.of(context)!.applyNow, true, () {
                        controller.ApplyJob(
                            widget.jobId,
                            widget.address,
                            widget.jobTime,
                            widget.require,
                            widget.location,
                            widget.qualification,
                            widget.language,
                            widget.salary,
                            widget.jobInfo,
                            widget.jobTitle,
                            widget.experience,
                            widget.company,
                            widget.subtitle);
                      }))
                  : Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20.0),
                      child: DynamicButton(
                          AppLocalizations.of(context)!.applied, false, () {})),
            ],
          ),
        ),
      ),
    );
  }
}
