import 'package:ekinch/app/custom_widget/color.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/math_utils.dart';
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
          backgroundColor: Color(0xFFE0E0E0),
          child: Container(
            height: 120,
            width: 120,
            decoration: BoxDecoration(
              color: Colors.black,
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: (path == "https://d3nypwrzdy6f4k.cloudfront.net/")
                    ? AssetImage('assets/images/profile_icon.png')
                    : (path == "assets/images/profile_icon.png")
                        ? AssetImage('assets/images/profile_icon.png')
                        : NetworkImage(path) as ImageProvider),
              
              border: Border.all(color: KColors.greyLine, width: 2.0),
            ),
          ),

          //  CircleAvatar(
          //   radius: 48,
          //   backgroundImage:
          //   LocalStorage.shared.getUserData()?.userData?.photo == null?
          //   AssetImage("assets/images/profile_icon.png")
          //   :Image.network(path) as ImageProvider,
          // ),
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
