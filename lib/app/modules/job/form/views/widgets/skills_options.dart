import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';

import '../../../../../custom_widget/color.dart';

class SkillOptions {
  static Widget textField(String title) {
    return Container(
      width: getHorizontalSize(460),
      height: getVerticalSize(62),
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: KColors.greyLine),
          borderRadius: BorderRadius.circular(6)),
      child:
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: const TextStyle(
                      color: KColors.textGrey,
                      fontSize: 18,
                      ),
                ),
                SizedBox(
                  width: getHorizontalSize(185),
                ),
                const Text(
                  "ADD  ",
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 18,
                      fontWeight: FontWeight.bold),
                )
              ],
            
      ),
          ),
    );
  }
}
