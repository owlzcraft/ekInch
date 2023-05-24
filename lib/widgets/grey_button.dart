import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class GreyButton extends StatelessWidget {
  final String text;
  final bool active;
  final Function onPressed;

  const GreyButton(this.text, this.active, this.onPressed, {super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height / 15, //height of button
        width: Get.width / 1.13, //width of button
        child: ElevatedButton(
          onPressed: () {
            onPressed();
          },
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, //change background color of button
            backgroundColor: (active)
                ? const Color(0xFFFEBA0F)
                : Colors.grey, //change text color of button
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(09.0),
            ),
            // backgroundColor: const Color(0xFFFEBA0F),
          ),
          child: Text(
            text,
            style: GoogleFonts.kadwa(
                color: Colors.black,
                fontSize: 27,
                letterSpacing: 1,
                fontWeight: FontWeight.w700,
                height: 1.2),
          ),
        ));
  }
}