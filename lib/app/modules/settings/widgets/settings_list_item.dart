import 'dart:ffi';

import 'package:ekinch/app/modules/Job_Application_List/controller/jobApplicationController.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/job_application_view.dart';
import 'package:ekinch/app/modules/company/contoller/company_controller.dart';
import 'package:ekinch/app/modules/company/view/company_view.dart';
import 'package:ekinch/app/modules/listpostjob/controller/post_job_controller.dart';
import 'package:ekinch/app/modules/myJobs/view/job_applied.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/MyVideos/views/my_videos_view.dart';
import 'package:ekinch/app/modules/certificate/view/certificate.dart';
import 'package:ekinch/app/modules/feedback/view/feedback_view.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/postjob/views/postjob_view.dart';
import 'package:ekinch/app/modules/profile/views/profile_view.dart';
import 'package:ekinch/app/modules/reels/views/reels_view.dart';
import 'package:ekinch/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:ekinch/widgets/math_utils.dart';
import 'package:ekinch/widgets/snack_bar.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../feedback/controller/feedback_controller.dart';
import '../../mobile/views/mobile_view.dart';
import '../../resume/controller/resume_controller.dart';
import '../../resume/view/preview_view.dart';

Widget SettingListItem(String image, String title) {
  var companyController = Get.put(CompanyController());
  var resumeController = Get.put(ResumeController());
  var feedbackController = Get.put(FeedbackController());
  var jobpostListController = Get.put(JobPostListController());

  return GestureDetector(
    onTap: () {
      switch (title) {
        case "My Profile":
          Get.to(ProfileView());
          break;
        case "Feedback":
          feedbackController.GetFeedback();
          break;
        case "My Company":
          companyController.CompanyDataStatus();
          break;
        case "My Resume":
          resumeController.CheckResumeStatusValue();
          break;
        case "My Jobs Application":
          jobpostListController.CompanyDataStatus();

          // Get.to(JobApplicationListView());
          break;
        case "My Jobs":
          Get.to(MyJobsView());
          break;
        case "My Videos (Reels)":
          Get.to(ReelsView());
          break;
        case "Notifications":
          Get.to(NotificationView());
          break;
        case "Share and Earn":
          Get.to(ReferNearnView());
          break;
        case "Log Out":
          Get.until((route) => route.isFirst);
          Get.off(MobileView());

          break;

        default:
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Image.asset(
              image,
              scale: 2.0,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15),
              child: Text(
                title,
                style: GoogleFonts.kadwa(
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF272727),
                    fontSize: getFontSize(20)),
              ),
            ),
          ],
        ),
        const Icon(Icons.chevron_right_sharp)
      ]),
    ),
  );
}
