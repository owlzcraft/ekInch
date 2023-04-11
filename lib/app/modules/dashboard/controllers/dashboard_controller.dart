import 'package:ekinch/app/models/categories_video.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/profile_model.dart';
import '../../../models/reel_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class DashboardController extends GetxController {
  //TODO: Implement DashboardController
// late VideoPlayerController videocontroller;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  late List<Data> ReelsListApi;
  late List<Data> RecentlyAddedListApi;
  late List CivilListApi;

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
  }

  //Get Reels
  Future<void> GetDashboard() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["page"] = 1;
          data["token"] = fcmToken;

          await apiRepository.getReels(data).then((ApiResult<ReelModel> value) {
            value.when(
                success: (value) {
                  if (value!.msg == "success") {
                    ReelsListApi = value.data;
                    GetCivilList();
                    // Get.to(DashboardView(

                    //   ReelsList: ReelsListApi,
                    //   RecentlyAddedList: [],CivilList: [],
                    // ));
                  } else if (value.msg == "page") {
                    Get.back();
                    errorSnackbar("Please Refresh");
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Get Reels
  Future<void> GetRecentlyAdded() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;

          await apiRepository.getReels(data).then((ApiResult<ReelModel> value) {
            value.when(
                success: (value) {
                  // if (value!.st == "success") {
                  // ReelsListApi = value.data;
                  // Get.to(DashboardView(
                  //   ReelsList: ReelsListApi,
                  //   RecentlyAddedList: [],
                  // ));
                  // } else if (value.msg == "page") {
                  //   Get.back();
                  //   errorSnackbar("Please Refresh");
                  // } else {
                  //   errorSnackbar("Check Internet Connection");
                  // }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Get Reels
  Future<void> GetCivilList() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();

    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["categoryId"] = "100";

          await apiRepository
              .categoryVidoesData(data)
              .then((ApiResult<CategoriesVideoModel> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    CivilListApi = value.category;
                    print("*****************");
                    print(CivilListApi[0]);
                    Get.to(DashboardView(
                      ReelsList: ReelsListApi,
                      RecentlyAddedList: [],
                      CivilList: ReelsListApi,
                    ));
                  } else if (value.status == 400) {
                    errorSnackbar("Please Refresh");
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Get Categories
  Future<void> GetCategories() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    final userId = LocalStorage.shared.getnumber();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = userId;
          data["token"] = fcmToken;

          await apiRepository.getReels(data).then((ApiResult<ReelModel> value) {
            value.when(
                success: (value) {
                  if (value!.msg == "success") {
                    ReelsListApi = value.data;
                    // Get.to(DashboardView(
                    //   ReelsList: ReelsListApi,
                    //   RecentlyAddedList: [],
                    // ));
                  } else if (value.msg == "page") {
                    Get.back();
                    errorSnackbar("Please Refresh");
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
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
