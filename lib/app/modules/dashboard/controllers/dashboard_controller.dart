import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';

import '../../../routes/app_pages.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
late VideoPlayerController videocontroller;

  final count = 0.obs;
  late ScrollController scrollController;

  @override
  void onInit() {
    scrollController = ScrollController();
    super.onInit();
   
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  var currentIndex = 0.obs;
  final currentPage = ''.obs;
  final Pages = <String>[
    Routes.HOME,
    Routes.REELS,
    Routes.JOB,
    Routes.RECORDS,
    Routes.PROFILE,
  ];
  
  void changePage(int index) {
    if (currentIndex.value == index) return;

    currentIndex.value = index;
    Get.offAndToNamed(Pages[currentIndex.value], id: 1);
    //  }
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
