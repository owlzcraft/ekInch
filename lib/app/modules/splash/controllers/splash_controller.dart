import 'dart:async';

import 'package:flutter_application_00/app/modules/language/bindings/language_binding.dart';
import 'package:flutter_application_00/app/modules/language/views/language_view.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    print('get');
    Future.delayed(const Duration(seconds: 3), () {
      if (LocalStorage.shared.isLoggedIn()) 
      {
        Get.offAllNamed(Routes.HOME);
      } else {
        if (LocalStorage.shared.isWalkthroughComplete()) 
        {
          Get.offAllNamed(Routes.MOBILE);
        } else {
       
            Get.offAllNamed(Routes.LANGUAGE);
          
        }
      }
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
