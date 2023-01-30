import 'package:flutter/material.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';

Widget ProfileImage() {
  return SizedBox(
    height: getVerticalSize(115),
    width: getHorizontalSize(115),
    child: Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        const CircleAvatar(
          backgroundImage: AssetImage("assets/images/profile.jpg"),
        ),
        Positioned(
            bottom: 0,
            right: -10,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Color(0xFFE0E0E0)),
                shape: BoxShape.circle,
                color: Color(0xFFFEBA0F),
              ),
              child: Image.asset(
                "assets/images/camera_icon.png",
                scale: 0.9,
              ),
            )),
      ],
    ),
  );
}
