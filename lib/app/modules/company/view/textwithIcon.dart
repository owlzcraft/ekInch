import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../utils/localStorage.dart';


  TextFieldWithIcon(String initialValue,String image,TextEditingController controller) {
    return  TextFormField(
                  onChanged: (value) {
                    controller.text = value as String;
                  },
                  initialValue:
                     initialValue,
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
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
