// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../custom_widget/color.dart';
import '../../profile/views/profile_view.dart';

DashboardProfile() {
  return InkWell(
      onTap: () => {Get.to(const ProfileView())},
      child: CircleAvatar(
        radius: 30,
        backgroundColor: const Color(0xFFE0E0E0),
        child: Container(
          height: 70.sp,
          width: 70.sp,
          decoration: BoxDecoration(
            color: Colors.black,
            shape: BoxShape.circle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: LocalStorage.shared.getProfile() ==
                        "https://d3nypwrzdy6f4k.cloudfront.net/"
                    ? const AssetImage('assets/images/profile_icon.png')
                    : NetworkImage(LocalStorage.shared.getProfile())
                        as ImageProvider),
            border: Border.all(color: KColors.greyLine, width: 2.0),
          ),
        ),
      ));
}
