import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

class InviteScreen extends StatelessWidget {
  const InviteScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Image.asset(Assets.referNearnBG),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 10.0),
            child: Text(
              "Invite your friends",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
          ),
          Text(
            "and get 250 point each",
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
          ),
          Text(
            "Share the code below or ask them  to enter it",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
          ),
          Text(
            "during they signup. Earn wehn they",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
          ),
          Text(
            "signup groovey app",
            style: TextStyle(
                fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
          ),
          Text(
            "Your Referal Code",
            style: TextStyle(
                fontWeight: FontWeight.w700,
                fontSize: 19,
                color: Color(0xFF4E4E4E)),
          ),
          Container(
              child: Row(children: [
            Text("D2BY6M",
                style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 22,
                    color: Colors.black))
          ]))
        ],
      ),
    );
  }
}
