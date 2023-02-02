import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:get/get.dart';

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
