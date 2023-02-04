import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:google_fonts/google_fonts.dart';

Widget StatusWidget(String image, String name, String sentOn, String code,
    bool accepted, int points) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
    child: Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.all(Radius.circular(10))),
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: CircleAvatar(
                  radius: 27,
                  child: Image.asset(image),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(name,
                        style: TextStyle(
                            fontWeight: FontWeight.w700, fontSize: 18)),
                    Text(
                      "Sent on $sentOn",
                      style: TextStyle(
                          color: Color(0xFF6A6A6A),
                          fontSize: 13,
                          fontWeight: FontWeight.w400),
                    ),
                    Text(
                      "Code : $code",
                      style: TextStyle(
                        fontWeight: FontWeight.w400,
                        fontSize: 13,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
          Column(
            children: [
              accepted
                  ? Container(
                      padding:
                          EdgeInsets.symmetric(vertical: 2, horizontal: 10),
                      decoration: BoxDecoration(
                          color: Color(0xFF000B46),
                          borderRadius: BorderRadius.circular(5)),
                      child: Row(
                        children: [
                          Text(
                            "$points  ",
                            style: GoogleFonts.kadwa(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                          Image.asset(
                            Assets.reward_icon,
                            scale: 1.5,
                          ),
                        ],
                      ))
                  : Container(),
              SizedBox(
                height: getVerticalSize(20),
              ),
              accepted
                  ? Text(
                      "Accepted",
                      style: TextStyle(color: Colors.green),
                    )
                  : Text(
                      "Waiting",
                      style: TextStyle(color: Color(0xFFDD4D4D)),
                    )
            ],
          )
        ],
      ),
    ),
  );
}
