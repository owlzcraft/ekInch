import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';

Widget TextFieldPayment(String label, String title) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 6.0),
    child: Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(color: KColors.lightGrey, width: 1.8)
          // border:BoxBorder()
          ),
      child: Padding(
        padding: const EdgeInsets.only(top: 8.0),
        child: TextFormField(
          autofocus: true,
          // controller: contoller,
          onChanged: (value) {},
          decoration: InputDecoration(
            focusColor: KColors.orange,
            labelStyle: GoogleFonts.lato(
                height: 1.5,
                fontWeight: FontWeight.w500,
                fontSize: F20(),
                color: KColors.lightGrey),
            labelText: label,
            fillColor: Colors.white,
            filled: true,
            contentPadding: EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0.0),
            enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.0),
                borderSide: BorderSide(color: Colors.white, width: 0)),
          ),
          style: GoogleFonts.lato(fontSize: F18(), color: Colors.black),
        ),
      ),
    ),
  );
}
