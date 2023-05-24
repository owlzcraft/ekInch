// ignore_for_file: non_constant_identifier_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';


CustomDropDown(List<String> list, String title, String select, int flex,
    double h, TextEditingController controller) {
  return Expanded(
    flex: flex,
    child: Container(
      padding: EdgeInsets.symmetric(horizontal: h.sp),
      child: DropdownButtonFormField2(
      
        alignment: Alignment.centerLeft,
        decoration: InputDecoration(
          isCollapsed: true,
          isDense: true,
          contentPadding: EdgeInsets.zero,
          border: OutlineInputBorder(
            borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
            borderRadius: BorderRadius.circular(5),
          ),
        ),
        isExpanded: false,
        hint: Text(
          title,
          style: GoogleFonts.kadwa(
              fontSize: F16(), color: const Color(0xFF636363)),
        ),
        icon: const Icon(
          Icons.keyboard_arrow_down,
          color: Colors.black45,
        ),
        iconSize: 25.sp,
        buttonHeight: 50.sp,
        dropdownDecoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
        ),
        items: list
            .map((item) => DropdownMenuItem<String>(
              
                  value: item,
                  child: Text(
                    item,
                    style: GoogleFonts.kadwa(
                        fontSize: F18(), color: const Color(0xFF636363)),
                  ),
                ))
            .toList(),
        validator: (value) {
          if (value == null) {
            return select;
          }
          return null;
        },
        onSaved: (value){
                    controller.text = value as String;

        },
        onChanged: (value) {
          controller.text = value as String;
        },
      ),
    ),
  );
}
