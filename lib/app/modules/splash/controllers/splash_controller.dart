// ignore_for_file: unused_local_variable, unnecessary_null_comparison

import 'dart:async';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  DashboardController dashboardController = Get.put(DashboardController());
  bool isFirstTime = false;
  final count = 0.obs;
  @override
  void onInit() {
    checkFirstTime();
    requestPermissions();
    Future.delayed(const Duration(seconds: 3), () {
      appRoute();
    });
    super.onInit();
  }

//permission
  Future<void> requestPermissions() async {
    Map<Permission, PermissionStatus> statuses = await [
      // Permission.camera,
      // Permission.microphone,
      Permission.location,
      // Permission.storage,
    ].request();
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
    if (isFirstTime) {

      if (LocalStorage.shared.isLoggedIn()) {
        dashboardController.GetDashboard();
      } else {
        if (LocalStorage.shared.isWalkthroughComplete()) {
          Get.offAllNamed(Routes.MOBILE);
        } else {
          Get.offAllNamed(Routes.LANGUAGE);
        }
      }
    } else {
      if (LocalStorage.shared.isWalkthroughComplete()==true) {
        // Get.to(DashboardView(ReelsList: [], RecentlyAddedList: [], CivilList: [],));
        dashboardController.GetDashboard();
        // Get.offAllNamed(Routes.HOME);
      } else {
        if (LocalStorage.shared.isWalkthroughComplete()==true) {
          Get.offAllNamed(Routes.MOBILE);
        } else {
          Get.offAllNamed(Routes.LANGUAGE);
        }
      }
    }
  }



  void increment() => count.value++;
}
