import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/postjob/views/postjob_view.dart';
import 'package:flutter_application_00/app/modules/profile/views/profile_view.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

Widget SettingListItem(String image, String title) {
  return GestureDetector(
    onTap: () {
      switch (title) {
        case "My Profile":
          Get.to(ProfileView());
          break;
        case "Feedback":
          Get.to(PostjobView());
          break;
        default:
      }
    },
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Image.asset(image),
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
