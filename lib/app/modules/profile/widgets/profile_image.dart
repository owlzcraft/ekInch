import 'package:flutter/material.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';

import '../../../utils/localStorage.dart';

Widget ProfileImage(String path) {
  return SizedBox(
    height: getVerticalSize(115),
    width: getHorizontalSize(115),
    child: Stack(
      clipBehavior: Clip.none,
      fit: StackFit.expand,
      children: [
        CircleAvatar(
          radius: 50,
          backgroundColor:  Color(0xFFE0E0E0),
          child:  CircleAvatar(
            radius: 48,
            backgroundImage:  
            // LocalStorage.shared.getUserData()?.userData?.photo == null?
            AssetImage("assets/images/profile_icon.png")
            // :AssetImage(path),
          ),
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
