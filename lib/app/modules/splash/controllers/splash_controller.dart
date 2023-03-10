import 'dart:async';

import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ekinch/app/modules/language/bindings/language_binding.dart';
import 'package:ekinch/app/modules/language/views/language_view.dart';
import 'package:ekinch/app/modules/mobile/views/mobile_view.dart';
import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController

  final count = 0.obs;
  @override
  void onInit() {
    print('get');

    super.onInit();

     Future.delayed(const Duration(seconds: 3), () {
    if (LocalStorage.shared.isLoggedIn()) {
        Get.offAllNamed(Routes.HOME);
      } else {
        if (LocalStorage.shared.isWalkthroughComplete()) {
          Get.offAllNamed(Routes.MOBILE);
        } else {
          print(
              LocalStorage.shared.isWalkthroughComplete());
          Get.offAllNamed(Routes.LANGUAGE);
        }
      }
    });
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
