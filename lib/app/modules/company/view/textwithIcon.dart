import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../utils/localStorage.dart';


  TextFieldWithIcon(String hint,String image,TextEditingController controller) {
    return  TextField(
                  onChanged: (value) {
                    controller.text = value as String;
                  },
                  decoration: InputDecoration(
                    hintText: hint,
                    contentPadding: EdgeInsets.symmetric(vertical: 8.sp),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFFEBA0F))),
                    border: OutlineInputBorder(
                      borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                      borderRadius: BorderRadius.circular(5),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(right: 18.0, left: 8.0),
                      child: Image.asset(
                        image,
                      ),
                    ),
                  ),
                  style: GoogleFonts.kadwa(
                      fontSize: getFontSize(22),
                      color: const Color(0xFF636363)),
                );
  }
