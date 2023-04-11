import 'package:another_stepper/dto/stepper_data.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/font_size.dart';

StepperDataCard(String title,String subtitle) {
    return  StepperData(
        title: StepperText(
          title,
          textStyle: GoogleFonts.kadwa(color: Colors.black, fontSize: F18()),
        ),
        subtitle: StepperText(subtitle,
            textStyle: GoogleFonts.kadwa(
              height: 1.2,
                fontSize: F24(),
                fontWeight: FontWeight.w500,
                color: Colors.black)),
        iconWidget: CircleAvatar(
          radius: 2.sp,
          backgroundColor: const Color(0xFFF00FF85),
        ));
  }
