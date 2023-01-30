import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_navigation/src/snackbar/snackbar_controller.dart';

import '../app/custom_widget/color.dart';
import 'math_utils.dart';

void createSnackBar(String message, BuildContext context) {
  final snackBar =
      new SnackBar(content: new Text(message), backgroundColor: Color(0xFFFEBA0F));

  // Find the Scaffold in the Widget tree and use it to show a SnackBar!
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}

SnackbarController? errorSnackbar(String msg,
    {VoidCallback? onTap, String? btnText}) {
  if (!Get.isSnackbarOpen) {
    return Get.rawSnackbar(
      message: msg.capitalize,
      borderWidth: 2,
      borderRadius: 10,
      borderColor: KColors.orange,
      margin: EdgeInsets.only(
          top: 10, left: getHorizontalSize(20), right: getHorizontalSize(20)),
      isDismissible: true,
      dismissDirection: GetPlatform.isAndroid
          ? DismissDirection.horizontal
          : DismissDirection.vertical,
      duration: const Duration(seconds: 3),
      icon: const Icon(Icons.dangerous, color: Colors.white),
      forwardAnimationCurve: Curves.bounceIn,
      mainButton: TextButton(
          onPressed: onTap ??
              () {
                Get.back();
              },
          child: Text(btnText ?? "Dismiss",
              style: const TextStyle(color: KColors.orange))),
      snackPosition: SnackPosition.TOP,
      backgroundColor: KColors.orange,
    );
  }
  return null;
}

SnackbarController successSnackBar(String msg, {Color? color}) {
  return Get.rawSnackbar(
    message: msg,
    borderRadius: 10,
    margin: const EdgeInsets.symmetric(
        horizontal: 20, vertical: kBottomNavigationBarHeight + 10),
    isDismissible: true,
    forwardAnimationCurve: Curves.linearToEaseOut,
    dismissDirection: DismissDirection.horizontal,
    duration: const Duration(milliseconds: 1500),
    borderColor: color ?? Colors.white,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: KColors.orange,
  );
}

void showCongratsDialog() async {
  await showDialog<String>(
    context: Get.context!,
    barrierDismissible: false,
    builder: (BuildContext context) {
      return const AlertDialog(
        backgroundColor: Colors.transparent,
        contentPadding: EdgeInsets.only(left: 0, right: 0, top: 0, bottom: 0),
        content: Text(''),
      );
    },
  );
}

