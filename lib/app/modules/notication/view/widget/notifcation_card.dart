// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';

NotificationCard(String image, String title, String subtitle, String time) {
  return Column(
    children: [
      Stack(
        children: [
          Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Image.asset(
                      image,
                      scale: 4,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        // ignore: prefer_const_literals_to_create_immutables
                        children: [
                          Text(
                            title,
                            style: GoogleFonts.kadwa(
                                color: Colors.black,
                                fontSize: F16(),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            subtitle,
                            style: GoogleFonts.kadwa(
                                color: Colors.grey,height: 1.2,
                                fontSize: F14(),
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                    )
                  ])),
          Positioned(
            right: 16.0,
            top: 10,
            child: Text(
              time,
              style: GoogleFonts.kadwa(
                  color: Colors.grey,
                  fontSize: F12(),
                  fontWeight: FontWeight.w400),
            ),
          )
        ],
      ),
      const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0),
        child: Divider(
          color: KColors.greyLine,
        ),
      )
    ],
  );
}
