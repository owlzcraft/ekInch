// ignore_for_file: unnecessary_overrides

import 'package:ekinch/app/utils/localStorage.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  var activeOB = 2.obs;
  saveWalkthrough() {
    LocalStorage.shared.saveWalkthrough();
  }

  // var onBoardingData = [
  //   {
  //     "i": 0,
  //     "image": "assets/images/onboarding1.png",
  //     "text_1": "Become a Professional",
  //     "text_2": "Mechanic",
  //     "text_3": "Watch Videos related to your work",
  //     "text_4": "and become professional\n",
  //   },
  //   {
  //     "i": 1,
  //     "image": "assets/images/onboarding2.png",
  //     "text_1": "Find, Post and Grow",
  //     "text_2": "Your Career",
  //     "text_3": "Watch Videos related to your work",
  //     "text_4": "and become professional\n",
  //   },
  //   {
  //     "i": 2,
  //     "image": "assets/images/onboarding3.png",
  //     "text_1": "Get 100% Perfect",
  //     "text_2": "Mechanic for You",
  //     "text_3": "Watch Videos related to your work",
  //     "text_4": "and become professional\n",
  //     "active": false
  //   }
  // ].obs;

  final count = 0.obs;
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
