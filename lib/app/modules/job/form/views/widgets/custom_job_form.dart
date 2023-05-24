// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../custom_widget/color.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobForm extends StatelessWidget {
  final String title;
  final String hint;
  final String image;
  final TextEditingController controller;
  const JobForm(
      {super.key,
      required this.title,
      required this.hint,
      required this.image,
      required this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
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
              padding: EdgeInsets.symmetric(vertical: 8.sp),
              child: TextFormField(
                  autofocus: false,
                  controller: controller,
                  validator: ((value) {
                    if (value!.isEmpty) {
                      return AppLocalizations.of(context)!.pleasefillallDetails;
                    }
                    return null;
                  }),
                  style: GoogleFonts.kadwa(fontSize: F18(), height: 1.2),
                  decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 6.sp),
                        child: Image.asset(
                          image,
                          scale: 1.0,
                        ),
                      ),
                      hintStyle: GoogleFonts.kadwa(
                          fontSize: F18(), color: const Color(0xFF999898)),
                      hintText: hint,
                      focusedBorder: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: KColors.greyLine)),
                      border: const OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(4)),
                          borderSide: BorderSide(color: KColors.greyLine)))),
            ),
          ],
        ),
      ),
    );
  }
}
