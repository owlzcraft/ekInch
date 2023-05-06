import 'package:ekinch/app/generated/assets.dart';
import 'package:get/get.dart';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:share/share.dart';

class ReferNearnController extends GetxController {
  //TODO: Implement ReferNearnController

  final count = 0.obs;
  var copied = false.obs;
  final referalCode = "D2BY6M";
  final referalIcons = [
    {
      "asset": Assets.facebook_icon,
      "title": "Facebook",
    },
    {
      "asset": Assets.instagram_icon,
      "title": "Instagram",
    },
    {
      "asset": Assets.whatsapp_icon,
      "title": "Whatsapp",
    },
    {
      "asset": Assets.google_plus_icon,
      "title": "Gmail",
    },
    {
      "asset": Assets.twitter_icon,
      "title": "Twitter",
    },
    {
      "asset": Assets.facebook_icon,
      "title": "Facebook",
    },
  ];
  var statusData = [
    {
      "image": "assets/images/nidhi_verma.png",
      "name": "Nidhi Verma",
      "sentOn": "22 July 2022",
      "code": "YDH351",
      "accepted": "false",
      "points": 0
    },
    {
      "image": "assets/images/alka_kumari.png",
      "name": "Alka Srivastva",
      "sentOn": "22 July 2022",
      "code": "YDH351",
      "accepted": "true",
      "points": 500
    },
    {
      "image": "assets/images/vikas_rawat.png",
      "name": "Vikas Rawat",
      "sentOn": "22 July 2022",
      "code": "YDH351",
      "accepted": "true",
      "points": 500
    },
    {
      "image": "assets/images/rohit_malhotra.png",
      "name": "Rohit Malhotra",
      "sentOn": "22 July 2022",
      "code": "YDH351",
      "accepted": "false",
      "points": 0
    },
    {
      "image": "assets/images/rohit_malhotra.png",
      "name": "Rahul Sharma",
      "sentOn": "22 July 2022",
      "code": "YDH351",
      "accepted": "true",
      "points": 200
    },
    {
      "image": "assets/images/rohit_malhotra.png",
      "name": "Saurabh Singh",
      "sentOn": "22 July 2022",
      "code": "YDH351",
      "accepted": "false",
      "points": 0
    },
  ];

  //share

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
