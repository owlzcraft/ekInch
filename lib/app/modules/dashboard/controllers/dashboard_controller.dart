// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:io';
import 'dart:typed_data';

import 'package:ekinch/app/models/categories_video.dart';
import 'package:ekinch/app/models/recentlAdded.dart';
import 'package:ekinch/app/networking/service_routes.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:get/get.dart';
// import 'package:video_player/video_player.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_thumbnail/video_thumbnail.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/reel_model.dart';
import '../../../models/upload_reel_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
import 'package:path/path.dart' as path;
import 'package:http/http.dart' as http;

// import 'package:video_thumbnail/video_thumbnail.dart';

class DashboardController extends GetxController {
// late VideoPlayerController videocontroller;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  late List<Data> ReelsListApi;
  late List<RData> RecentlyAddedListApi;
  late List<RCategory> CivilListApi;
  final isVideoSelected = false.obs;
  final reel = ''.obs;
  TextEditingController title = TextEditingController();
  final count = 0.obs;
  late ScrollController scrollController;
  TextEditingController reelCategory = TextEditingController();
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

  //Get Dashboard reels
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

  Future<void> uploadReel(context, thumbnail) async {
    var category = reelCategory.text;
    int categoryId = 100;
    switch (category) {
      case "Civil":
        categoryId = 100;
        break;
      case "Electrical":
        categoryId = 300;
        break;
      case "Hospital":
        categoryId = 200;
        break;
      case "Iron":
        categoryId = 400;
        break;
      case "Plumbing":
        categoryId = 500;
        break;
      case "Building painting":
        categoryId = 600;
        break;
      case "wood":
        categoryId = 700;
        break;
    }
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, String> data = <String, String>{};
          String encodedImage = thumbnail.split(',').last;
          List<int> imageBytes = base64.decode(encodedImage);
          // Specify the directory path where the file should be saved
          Directory directory = await getTemporaryDirectory();
          String filePath = path.join(directory.path, 'thumbnail.jpeg');
          // File file = File(fileName);
          // file.writeAsBytes(imageBytes).then((value) async {
          //   print('Image file saved successfully!');
          //   print(value);
          //   data["userId"] = LocalStorage.shared.getUserData()!.userId;
          //   data['uid'] = LocalStorage.shared.getUID();
          //   data["token"] = fcmToken;
          //   data['file'] = reel.value;
          //   data['category'] = categoryId;
          //   data['title'] = title.text;
          //   data['thumbnail'] = thumbnail;
          //   print("request data-------------------");
          //   print(data);
          //   return;
          //   await apiRepository
          //       .uploadReel(data)
          //       .then((ApiResult<UploadReelModel> value) {
          //     value.when(
          //         success: (value) {
          //           if (value!.msg == "success") {
          //             Navigator.of(context).pop();
          //             successSnackBar('Reel uploaded sucessfully.');
          //           } else if (value.msg == "page") {
          //             Get.back();
          //             errorSnackbar("Please Refresh");
          //           } else {
          //             errorSnackbar("Check Internet Connection");
          //           }
          //         },
          //         failure: (networkExceptions) {});
          //   });
          // }).catchError((error) {
          //   print('Error saving image file: $error');
          // });
          File file = File(filePath);
          await file.writeAsBytes(imageBytes);

          data["userId"] = LocalStorage.shared.getUserData()!.userId.toString();
          data['uid'] = LocalStorage.shared.getUID().toString();
          data["token"] = fcmToken;
          data['file'] = reel.value;
          data['category'] = categoryId.toString();
          data['title'] = title.text;

          // Create a multipart request
          var request = http.MultipartRequest(
            'POST',
            Uri.parse(ServiceConstants.BASE_URL + ServiceConstants.UPLOAD_REEL),
          );

          // Attach the file to the request
          request.files
              .add(await http.MultipartFile.fromPath('thumbnail', filePath));

          // Attach other data fields
          request.fields.addAll(data);
          print("reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
          print(request.files);
          print(request.fields);
          print("reqqqqqqqqqqqqqqqqqqqqqqqqqqqqqq");
          // Send the request
          var response = await request.send();

          // Handle the response
          if (response.statusCode == 200) {
            // Success
            Navigator.of(context).pop();
            successSnackBar('Reel uploaded successfully.');
          } else {
            // Error
            print(response.statusCode);
            Navigator.of(context).pop();
            errorSnackbar('Failed to upload reel.');
          }
        },
        loadingWidget: const LoadingIndicator());
  }

  ImagePicker videoPicker = ImagePicker();
// File? videoFile;

  // pick video in flutter from camera
  Future getVideoFromCamera() async {
    final source = await videoPicker.pickVideo(source: ImageSource.camera);
    if (source != null) {
      if (!GetUtils.isVideo(source.path)) {
        errorSnackbar('Invalid File');
        return "";
      } else {
        isVideoSelected.value = true;
        final uint8list = await VideoThumbnail.thumbnailData(
          video: source.path,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 128,
          quality: 25,
        );
        Uint8List finalUint8List = uint8list as Uint8List;
        String base64String = base64Encode(finalUint8List);
        reel.value = source.path;
        return base64String;
      }
    } else {
      isVideoSelected.value = false;
      errorSnackbar("Please select video");
    }
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
        final uint8list = await VideoThumbnail.thumbnailData(
          video: source.path,
          imageFormat: ImageFormat.JPEG,
          maxWidth: 128,
          quality: 25,
        );
        Uint8List finalUint8List = uint8list as Uint8List;
        String base64String = base64Encode(finalUint8List);
        reel.value = source.path;
        return base64String;
      }
    } else {
      isVideoSelected.value = false;
      errorSnackbar("Please select video");
    }
  }

  void increment() => count.value++;
}
