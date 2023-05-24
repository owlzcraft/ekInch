import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import '../../../../../custom_widget/color.dart';
import '../../../../../custom_widget/font_size.dart';
import '../../../../../utils/math_utils.dart';

Future showDataAlert(BuildContext context, String title, String subTitle,
    List<String> list, String hint, TextEditingController controller) async {
  return await showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          insetPadding: const EdgeInsets.all(16),
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
                padding: const EdgeInsets.symmetric(vertical: 8.0),
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
                      border: Border.all(color: const Color(0xFFCDCDCD))),
                  child: DropdownButtonFormField2(
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    isExpanded: false,
                    hint: Text(
                      hint,
                      style: GoogleFonts.kadwa(
                          fontSize: getFontSize(22),
                          color: const Color(0xFF636363)),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black45,
                      ),
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    items: list
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: const Color(0xFF636363)),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return AppLocalizations.of(context)!.selectOption;
                      }
                      return null;
                    },
                    onSaved: (value) {
                      controller.text = value as String;
                    },
                    onChanged: (value) {
                      controller.text = value as String;
                    },
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
                    text: AppLocalizations.of(context)!.submit,
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
