// ignore_for_file: non_constant_identifier_names
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

AwardCertificateGrid(String path, String title, String subtitle) {
  return Padding(
    padding: const EdgeInsets.all(4.0),
    child: Stack(
      alignment: AlignmentDirectional.centerStart,
      children: [
        // Container(
        //    height: getVerticalSize(220),
        //   width: getHorizontalSize(220),
        //   decoration: BoxDecoration(
        //       borderRadius: BorderRadius.all(Radius.circular(20)),
        //       boxShadow: [
        //         BoxShadow(color: Colors.black, blurRadius: 10, spreadRadius: 10)
        //       ]),
        // ),
        Container(
          height: getVerticalSize(220),
          width: getHorizontalSize(220),
          decoration: BoxDecoration(
            boxShadow:const [
               BoxShadow(
                color: Colors.black,
              ),
               BoxShadow(
                color: Colors.black,
                spreadRadius: -12.0,
                blurRadius: 12.0,
              ),
            ],
            borderRadius: BorderRadius.circular(20),
            image: DecorationImage(
                fit: BoxFit.cover,
                image: path == " "
                    ? const AssetImage('assets/images/award.png')
                    : NetworkImage(path) as ImageProvider),
          ),
        ),
        Positioned(
            top: 16.0,
            right: 16.0,
            child: SvgPicture.asset(
              "assets/icons/3dot.svg",
              color: Colors.white,
            )),
        Positioned(
            bottom: 16.0,
            left: 16.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.kadwa(
                      color: Colors.white,
                      fontSize: F18(),
                      height: 1.2,
                      fontWeight: FontWeight.w700),
                ),
                Text(
                  subtitle,
                  style: GoogleFonts.kadwa(
                      color: Colors.white,
                      fontSize: F16(),
                      height: 1.2,
                      fontWeight: FontWeight.w400),
                )
              ],
            ))
      ],
    ),
  );
}
