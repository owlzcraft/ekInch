import 'dart:async';

import 'package:flutter_application_00/app/modules/language/bindings/language_binding.dart';
import 'package:flutter_application_00/app/modules/language/views/language_view.dart';
import 'package:get/get.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    print('get');
    Timer(const Duration(seconds: 5), () {
      print('insplash');
      Get.to(LanguageView());
    });
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
