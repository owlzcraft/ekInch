import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BlackButton extends StatelessWidget {
  final String text;
  final bool active;
  final Function onPressed;

  BlackButton(this.text, this.active, this.onPressed);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: Get.height / 15, //height of button
        width: Get.width , //width of button
        child: ElevatedButton(
          onPressed: () {
            print("_____pressed");
            this.onPressed();
          },
          child: Text(
            text,
            style: GoogleFonts.kadwa(
              color: Colors.white,
              fontSize: 20,
              letterSpacing: 1,
              fontWeight: FontWeight.w700,
            ),
          ),
          style: ElevatedButton.styleFrom(
            foregroundColor: Colors.black, //change background color of button
            backgroundColor: (active)
                ? Colors.black
                : Colors.grey, //change text color of button
            elevation: 0,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5.0),
            ),
            // backgroundColor: const Color(0xFFFEBA0F),
          ),
        ));
  }
}
