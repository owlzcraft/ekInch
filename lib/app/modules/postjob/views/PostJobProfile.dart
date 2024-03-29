// ignore_for_file: file_names

import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/postjob/controllers/postjob_controller.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_widget/font_size.dart';
import '../../listpostjob/views/widget/key_value.dart';
import '../../mobile/widget/yellow_button.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostJobProfile extends StatefulWidget {
  final String company;
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
  // final String address;
  const PostJobProfile({
    super.key,
    required this.company,
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
    // required this.interviewTime,
    // required this.address
  });

  @override
  PostJobProfileState createState() => PostJobProfileState();
}

class PostJobProfileState extends State<PostJobProfile> {
  PostjobController controller = Get.put(PostjobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: const BottomTabView(2),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            onPressed: () {
              Get.back();
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
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
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
                              fontSize: F20(),
                              fontWeight: FontWeight.w400)),
                      Text(widget.subtitle,
                          style: GoogleFonts.kadwa(
                              fontSize: F16(),
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
                              fontSize: F16(),
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
                  padding: const EdgeInsets.all(16),
                  child: Column(
                    children: [
                      CustomRow(context, AppLocalizations.of(context)!.jobTitle, widget.jobTitle),
                      CustomRow(context, AppLocalizations.of(context)!.inHandSalary, widget.salary),
                      CustomRow(
                          context, AppLocalizations.of(context)!.qualification, widget.qualification),
                      CustomRow(context, AppLocalizations.of(context)!.language, widget.language),
                      CustomRow(context, AppLocalizations.of(context)!.required, widget.require),
                      CustomRow(context, AppLocalizations.of(context)!.jobInfo, widget.jobInfo),
                      CustomRow(context, AppLocalizations.of(context)!.experience, widget.experience),
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
                      CustomRow(context, AppLocalizations.of(context)!.jobTiming, widget.jobTime),
                      // CustomRow(
                      //     context, "Interview Timing", widget.interviewTime),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              // Text(
              //   'Company Address',
              //   style: GoogleFonts.kadwa(
              //       fontWeight: FontWeight.w700, color: black, fontSize: F18()),
              // ),
              // SizedBox(
              //   height: MediaQuery.of(context).size.height * 0.01,
              // ),
              // Container(
              //     child: Card(
              //         elevation: 2,
              //         shape: RoundedRectangleBorder(
              //             borderRadius: BorderRadius.circular(5)),
              //         child: Padding(
              //           padding: EdgeInsets.all(12.sp),
              //           child: Row(
              //             mainAxisAlignment: MainAxisAlignment.start,
              //             children: [
              //               CustomRow(context, "Address", widget.location)
              //             ],
              //           ),
              //         ))),
              Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20.0),
                  child: DynamicButton(AppLocalizations.of(context)!.postJob, true, () {
                    controller.PostJob();
                    // Get.to(Confirmationjob(title:"Title of Job"));
                  })),
            ],
          ),
        ),
      ),
    );
  }
}
