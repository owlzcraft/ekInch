import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../custom_widget/color.dart';
import '../../../../../custom_widget/font_size.dart';
import '../../../../../utils/math_utils.dart';

Future showDataAlert(BuildContext context, String title, String subTitle,
    List<String> list, String hint) async {
 return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: EdgeInsets.all(16),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.all(
              Radius.circular(
                4.0,
              ),
            ),
          ),
          title: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
                         mainAxisSize: MainAxisSize.min,

            children: [
              Text(
                title,
                style: GoogleFonts.kadwa(
                    fontSize: F18(), fontWeight: FontWeight.w700),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  subTitle,
                  style: GoogleFonts.kadwa(
                      fontSize: F16(), height: 1.2, color: KColors.textGrey),
                ),
              ),
            ],
          ),
          content: StatefulBuilder(
              builder: (BuildContext context, StateSetter setState) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  width: Get.width,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Color(0xFFCDCDCD))),
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<String>(
                      hint: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10),
                        child: Text(
                          hint,
                          style: GoogleFonts.kadwa(
                              fontSize: F22(), color: Color(0xFF636363)),
                        ),
                      ),
                      icon: Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF999999),
                        ),
                      ),
                      isExpanded: true,
                      focusColor: Color(0xFFFEBA0F),
                      items: list.map((value) {
                        return DropdownMenuItem<String>(
                            value: value,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                value,
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: Color(0xFF636363)),
                              ),
                            ));
                      }).toList(),
                      onChanged: (_) {},
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 25.0),
                  child: GFButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: KColors.orange,
                    fullWidthButton: true,
                    size: 50.2,
                    text: "Submit",
                    textStyle: GoogleFonts.kadwa(
                      color: Colors.black,
                      fontWeight: FontWeight.w700,
                      fontSize: F24(),
                    ),
                  ),
                ),
              ],
            );
          }),
        );
      });
}
