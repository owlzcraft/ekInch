import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widget/font_size.dart';

class LangCom extends StatelessWidget {
  final String active_img;
  final String inactive_img;
  final String textT;
  final String textB;
  final int active;

  // ignore: use_key_in_widget_constructors
  const LangCom(
      {this.active_img = "",
      this.inactive_img = "",
      this.textT = "",
      this.textB = "",
      this.active = 0});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Get.height / 5.8,
      width: Get.width / 2.4,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
        ),
        color: (active == 1) ? Color(0xFFFEBA0F) : Colors.white,
        borderRadius: const BorderRadius.all(Radius.circular(7.5)),
      ),
      child: Stack(
        children: [
          Positioned(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                padding: EdgeInsets.symmetric(vertical: 10.sp, horizontal: 5.sp),
                child: Text(textT,
                    style: GoogleFonts.kadwa(
                        fontSize: F12(),
                       
                        color: (active == 1) ? Colors.white : Color(0xFF525252))),
              )
            ],
          )),
          Positioned(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Center(
                  child: Image.asset(
                    (active == 1) ? active_img : inactive_img,
                    scale: 1.7,
                  ),
                ),
                Center(
                  child: Text(textB,
                      style: GoogleFonts.kadwa(
                          fontSize: F22(), 
                          color: (active == 1)
                              ? Colors.white
                              : Color.fromARGB(255, 116, 115, 115))),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
