import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/message/view/onetooneChat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/color.dart';

MessageCard(
  String image,
  String title,
  String subtitle,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: InkWell(
      onTap: () {
        Get.to(OneToOneChat(photo: image, name: "Sanjay Singh", profession: "Civil",));
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          CircleAvatar(
              radius: 20.sp,
              backgroundImage: AssetImage("assets/images/profile_icon.png")),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.kadwa(
                      height: 1.2, fontSize: F16(), color: Colors.black),
                ),
                Text(
                  "$subtitle",
                  style: GoogleFonts.kadwa(
                      fontSize: F12(), color: KColors.textGrey),
                )
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
