import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../widgets/math_utils.dart';
import '../../../../../custom_widget/color.dart';

ClickAdd(
    BuildContext context, String title, String subTitle,String skill, Function() onTap) {
  return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10, bottom: 10),
      child: Container(
        width: Get.width,
        decoration: BoxDecoration(
            border: Border.all(color: KColors.greyLine),
            color: Colors.white,
            borderRadius: BorderRadius.circular(4)),
        child: Padding(
          padding: const EdgeInsets.only(
              right: 10.0, left: 16.0, top: 16.0, bottom: 16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: GoogleFonts.kadwa(
                    height: 1.2,
                    color: Colors.black,
                    fontSize: F20(),
                    fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 2.9),
                child: Text(
                  subTitle,
                  style: GoogleFonts.kadwa(
                    height: 1.2,
                    color: Color.fromARGB(255, 132, 131, 131),
                    fontSize: F16(),
                  ),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top:8.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      flex: 3,
                      child: InkWell(
                        onTap: onTap,
                        child: Container(
                          alignment: AlignmentDirectional.center,
                          decoration: BoxDecoration(
                              border: Border.all(color: Colors.black),
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(100)),
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical:12.0),
                            child: Text(
                              skill,
                              style: GoogleFonts.kadwa(
                                  height: 1.2,
                                  color: Colors.black,
                                  fontSize: F16(),
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Padding(
                        padding: EdgeInsets.only(left: 12.sp),
                        child: Container(
                          height: getVerticalSize(46),
                          width: getVerticalSize(99),
                          decoration: BoxDecoration(
                              border: Border.all(color: KColors.orange),
                              color: KColors.orange,
                              borderRadius: BorderRadius.circular(100)),
                          child: Center(
                            child: Text(
                              "Add",
                              style: GoogleFonts.kadwa(
                                  color: Colors.black,
                                  fontSize: F18(),
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ));
}
