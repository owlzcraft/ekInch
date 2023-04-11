// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';


  TabButton(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: InkWell(child: Text(text,style: GoogleFonts.kadwa(fontSize: F18(),color: Colors.black),)),
    );
  }
