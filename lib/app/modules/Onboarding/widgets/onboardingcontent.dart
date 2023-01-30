import 'package:flutter/material.dart';
import 'package:get/get.dart';

Widget onBoradingContent(
    String text_1, String text_2, String text_3, String text_4, String image) {
  return Container(
      height: Get.height / 1.4,
      padding: EdgeInsets.only(top: (Get.height / 30)),
      decoration: BoxDecoration(
          // color: Colors.green,
          borderRadius: BorderRadius.all(Radius.circular(20))),
      child: Column(
        children: [
          Container(
            width: Get.width / 1.06203473945,
            height: Get.height / 10.0652173913,
            child: Column(
              // ignore: prefer_const_literals_to_create_immutables
              children: [
                Text(text_1,
                    style: const TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w700,
                        color: Color(0xFF525252))),
                Text(
                  text_2,
                  style: const TextStyle(
                      fontSize: 30,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF525252)),
                ),
              ],
            ),
          ),
          Column(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              Text(text_3,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20)),
              Text(text_4,
                  style: const TextStyle(
                      fontWeight: FontWeight.w400, fontSize: 20))
            ],
          ),
          Center(
              child: Image.asset(
            image,
            scale: 1.2,
          ))
        ],
      ));
}
