import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/font_size.dart';
import '../../../../utils/math_utils.dart';

EditText(String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 10.0),
    child: Text(
      title,
      style: GoogleFonts.kadwa(
          color: Colors.black, fontSize: F18(), fontWeight: FontWeight.w700),
    ),
  );
}

  EditTextField(String hint, List list,String controller) {
    return  DropdownButtonFormField2(
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
                    fontSize: getFontSize(20),
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
                              fontSize: getFontSize(20),
                              color: const Color(0xFF636363)),
                        ),
                      ))
                  .toList(),
              validator: (value) {
                if (value == null) {
                  return 'Please Select Job Profile';
                }
              },
              onChanged: (value) {
                controller = value as String;
              },
            );
  }

