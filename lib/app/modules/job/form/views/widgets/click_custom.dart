import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../../widgets/math_utils.dart';
import '../../../../../custom_widget/color.dart';


  ClickAdd(BuildContext context,String title,String subTitle,Function()onTap) {
    return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontSize: F18(),
                            fontWeight: FontWeight.w700),
                      ),
                       Padding(
                        padding: EdgeInsets.symmetric(vertical: 2.9),
                        child: Text(
                          subTitle,
                          style: GoogleFonts.kadwa(
                            color: Color.fromARGB(255, 132, 131, 131),
                            fontSize: F14(),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: onTap,
                            child: Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: Container(
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 50),
                                decoration: BoxDecoration(
                                    border: Border.all(color: Colors.black),
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(100)),
                                child:  Center(
                                  child: Text(
                                    "Click to fill your Skills",
                                    style: GoogleFonts.kadwa(
                                        color: Colors.black,
                                        fontSize: F14(),
                                        fontWeight: FontWeight.bold),
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Container(
                              height: getVerticalSize(46),
                              width: getVerticalSize(99),
                              decoration: BoxDecoration(
                                  border: Border.all(color: KColors.orange),
                                  color: KColors.orange,
                                  borderRadius: BorderRadius.circular(100)),
                              child:  Center(
                                child: Text(
                                  "Add",
                                  style: GoogleFonts.kadwa(
                                      color: Colors.black,
                                      fontSize: F16(),
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              ));
            
  }
