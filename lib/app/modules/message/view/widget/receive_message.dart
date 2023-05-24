import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ReceiveMessage extends StatelessWidget {
 final String msg;
 const ReceiveMessage({super.key, required this.msg});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Container(
          decoration: const BoxDecoration(
              color: Color.fromARGB(255, 130, 128, 128),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20),
                  bottomRight: Radius.circular(20))),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
            child: Expanded(
                child: Text(
              msg,
              style: GoogleFonts.kadwa(fontSize: F16(), color: Colors.black),
            )),
          ),
        ),
      ],
    );
  }
}
