// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/modules/Job_Application_List/controller/jobApplicationController.dart';
import 'package:ekinch/app/modules/company/contoller/company_controller.dart';
import 'package:ekinch/app/modules/myJobs/controller/myjobcontroller.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/MyVideos/views/my_videos_view.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/profile/views/profile_view.dart';
import 'package:ekinch/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:ekinch/widgets/math_utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../feedback/controller/feedback_controller.dart';
import '../../mobile/views/mobile_view.dart';
import '../../resume/controller/resume_controller.dart';

Widget SettingListItem(String image, String title) {
  var companyController = Get.put(CompanyController());
  var resumeController = Get.put(ResumeController());
  var feedbackController = Get.put(FeedbackController());
  var jobpostListController = Get.put(JobPostListController());
  var appliedJobController = Get.put(AppliedJobController());

  return GestureDetector(
    onTap: () {
      switch (title) {
        case "My Profile":
          Get.to(const ProfileView());
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
          appliedJobController.appliedJobList();
          break;
        case "My Videos (Reels)":
          Get.to(const MyVideosView());
          break;
        case "Notifications":
          Get.to(NotificationView());
          break;
        case "Share":
          Get.to(ReferNearnView());
          break;
        case "Log Out":
          Get.until((route) => route.isFirst);
          LocalStorage.shared.saveLoggedIn(false);
          Get.off(const MobileView());

          break;
           case "मेरी प्रोफ़ाइल":
          Get.to(const ProfileView());
          break;
        case "प्रतिक्रिया":
          feedbackController.GetFeedback();
          break;
        case "मेरी कंपनी":
          companyController.CompanyDataStatus();
          break;
        case "बायोडाटा":
          resumeController.CheckResumeStatusValue();
          break;
        case "मेरे नौकरी आवेदन":
          jobpostListController.CompanyDataStatus();
          // Get.to(JobApplicationListView());
          break;
        case "मेरी नौकरियां":
          appliedJobController.appliedJobList();
          break;
        case "मेरे वीडियो (रील)":
          Get.to(const MyVideosView());
          break;
        case "सूचनाएँ":
          Get.to(NotificationView());
          break;
        case "शेयर करें":
          Get.to(ReferNearnView());
          break;
        case "लॉग आउट":
          Get.until((route) => route.isFirst);
          LocalStorage.shared.saveLoggedIn(false);
          Get.off(const MobileView());

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
