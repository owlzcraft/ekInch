import 'dart:async';

import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ekinch/app/modules/language/bindings/language_binding.dart';
import 'package:ekinch/app/modules/language/views/language_view.dart';
import 'package:ekinch/app/modules/mobile/views/mobile_view.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../../../routes/app_pages.dart';
import '../../../../../utils/localStorage.dart';
import '../../../../dashboard/controllers/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  //TODO: Implement SplashController
  DashboardController dashboardController = Get.put(DashboardController());
  bool isFirstTime = false;
  final count = 0.obs;
  @override
  void onInit() {
    print('get');
    super.onInit();
    checkFirstTime();
    requestPermissions();
    Future.delayed(const Duration(seconds: 3), () {
      print("here");
      appRoute();
    });
  }

//permission
  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      // Permission.camera,
      // Permission.microphone,
      Permission.location,
      // Permission.storage,
    ].request();
    print(statuses);
  }

//set local
  Future<void> checkFirstTime() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    isFirstTime = prefs.getBool('isFirstTime') as bool;
    if (isFirstTime == null) {
      isFirstTime = true;
      prefs.setBool('isFirstTime', isFirstTime);
    } else {
      isFirstTime = false;
    }
  }

//path
  Future<void> appRoute() async {
    // Get.offAllNamed(Routes.REGISTER);
    
    if (isFirstTime) {
      bool loggedIn = LocalStorage.shared.isLoggedIn();
      if (loggedIn) {
        // Get.to(DashboardView(ReelsList: [], RecentlyAddedList: [], CivilList: [],));
        dashboardController.GetDashboard();
        // Get.offAllNamed(Routes.HOME);
      } else {
        if (LocalStorage.shared.isWalkthroughComplete()) {
          Get.offAllNamed(Routes.MOBILE);
        } else {
          print(LocalStorage.shared.isWalkthroughComplete());
          Get.offAllNamed(Routes.LANGUAGE);
        }
      }
    } else {
      bool loggedIn = LocalStorage.shared.isLoggedIn();
      if (loggedIn) {
        // Get.to(DashboardView(ReelsList: [], RecentlyAddedList: [], CivilList: [],));
        dashboardController.GetDashboard();
        // Get.offAllNamed(Routes.HOME);
      } else {
        if (LocalStorage.shared.isWalkthroughComplete()) {
          Get.offAllNamed(Routes.MOBILE);
        } else {
          print(LocalStorage.shared.isWalkthroughComplete());
          Get.offAllNamed(Routes.LANGUAGE);
        }
      }
    }
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
