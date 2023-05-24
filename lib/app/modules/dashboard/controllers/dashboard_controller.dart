// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/models/categories_video.dart';
import 'package:ekinch/app/models/recentlAdded.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/reel_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
// import 'package:video_thumbnail/video_thumbnail.dart';

class DashboardController extends GetxController {
// late VideoPlayerController videocontroller;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  late List<Data> ReelsListApi;
  late List<RData> RecentlyAddedListApi;
  late List<RCategory> CivilListApi;

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
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["page"] = 1;
          data["token"] = fcmToken;

          await apiRepository.getReels(data).then((ApiResult<ReelModel> value) {
            value.when(
                success: (value) {
                  // if (value!.msg == "success") {
                  ReelsListApi = value!.data!;
                  GetCivilList();
                  // GetRecentlyAdded();
                  // Get.to(DashboardView(

                  //   ReelsList: ReelsListApi,
                  //   RecentlyAddedList: [],CivilList: [],
                  // ));
                  // } else if (value.msg == "page") {
                  //   // Get.back();
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
  Future<void> GetRecentlyAdded() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data['uid'] = LocalStorage.shared.getUID();
          await apiRepository
              .recentlyAdded(data)
              .then((ApiResult<RecentlyAddedModel> value) {
            value.when(
                success: (value) {
                  RecentlyAddedListApi = value!.data;
                  Get.to(DashboardView(
                    ReelsList: ReelsListApi,
                    RecentlyAddedList: RecentlyAddedListApi,
                    CivilList: const [],
                  ));
                  // GetCivilList();
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Get Category Reels
  Future<void> GetCivilList() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
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
                    CivilListApi = value.category!;
                    Get.to(DashboardView(
                      ReelsList: ReelsListApi,
                      RecentlyAddedList: const [],
                      CivilList: CivilListApi,
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
    final fcmToken = LocalStorage.shared.getFCMToken();
    final userId = LocalStorage.shared.getnumber();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = userId;
          data["token"] = fcmToken;

          await apiRepository.getReels(data).then((ApiResult<ReelModel> value) {
            value.when(
                success: (value) {
                  if (value!.msg == "success") {
                    ReelsListApi = value.data!;
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

  final isVideoSelected = false.obs;
  final reel = ''.obs;

  ImagePicker videoPicker = ImagePicker();
// File? videoFile;

  // pick video in flutter from camera
  getVideoFromCamera() async {
    final source = await videoPicker.pickVideo(source: ImageSource.camera);
    if (source != null) {
      if (!GetUtils.isVideo(source.path)) {
        errorSnackbar('Invalid File');
        return;
      } else {
        isVideoSelected.value = true;
        //      final thumbnailPath = await VideoThumbnail.thumbnailFile(
        //   video: source,
        //   thumbnailPath: (await getTemporaryDirectory()).path,
        //   imageFormat: ImageFormat.JPEG,
        //   maxHeight: 100,
        //   quality: 25,
        // );
        reel.value = source.path;
      }
      // changeLogo();
    } else {
      isVideoSelected.value = false;
      errorSnackbar("Please select video");
    }
    // videoFile = File(source!.path as List<Object>);
    // Navigator.of(context).push(
    //     MaterialPageRoute(builder: (context) => PlayVideo(data: videoFile!)));
  }

  // pick video in flutter from gallery
  getVideoFromGallery() async {
    final source = await videoPicker.pickVideo(source: ImageSource.gallery);
    if (source != null) {
      if (!GetUtils.isVideo(source.path)) {
        errorSnackbar('Invalid File');
        return;
      } else {
        isVideoSelected.value = true;
        //     final thumbnailPath = await VideoThumbnail.thumbnailFile(
        //   video: source,
        //   thumbnailPath: (await getTemporaryDirectory()).path,
        //   imageFormat: ImageFormat.JPEG,
        //   maxHeight: 100,
        //   quality: 25,
        // );

        reel.value = source.path;
      }
      // changeLogo();
    } else {
      isVideoSelected.value = false;
      errorSnackbar("Please select video");
    }
    // videoFile = File(source!.path as List<Object>);
    //   Navigator.of(context).push(
    //       MaterialPageRoute(builder: (context) => PlayVideo(data: videoFile!)));
  }



  void increment() => count.value++;
}
