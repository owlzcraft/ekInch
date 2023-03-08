import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:http_parser/http_parser.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/profile_model.dart';
import '../../../models/profile_pic.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
import 'package:mime_type/mime_type.dart';

import '../views/profile_view.dart';

class ProfileController extends GetxController {
  //TODO: Implement ProfileController
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  TextEditingController numberController = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
  TextEditingController profession = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController experience = TextEditingController();
  var professionList = ["Electrician", "Painter", "Labour", "Mechanic"];
  final count = 0.obs;
  final picker = ImagePicker();
  final isProfileSelected = false.obs;
  final profile = ''.obs;
  pickProfileCamera() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 1);
    if (pickedImage != null) {
      if (!GetUtils.isImage(pickedImage.path)) {
        errorSnackbar('Invalid Image type');
        return;
      }
      isProfileSelected.value = true;
      profile.value = pickedImage.path;
      changeDp();
    } else {
      isProfileSelected.value = false;
      errorSnackbar("No Photo Taken");
    }
  }

  pickProfileGallery() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 1);
    if (pickedImage != null) {
      if (!GetUtils.isImage(pickedImage.path)) {
        errorSnackbar('Invalid Image type');
        return;
      }
      isProfileSelected.value = true;
      profile.value = pickedImage.path;
      changeDp();
    } else {
      isProfileSelected.value = false;
      errorSnackbar("No Photo Taken");
    }
  }

  changeDp() {
    Get.showOverlay(
        asyncFunction: () async {
          final formData = dio.FormData.fromMap({
            "photo": dio.MultipartFile.fromFileSync(profile.value,
                filename: profile.value.split('/').join(''),
                contentType:
                    MediaType('image', mime(profile.value)!.split('/')[1])),
            "userId": LocalStorage.shared.getUserData()!.userId,
            "token": LocalStorage.shared.getFCMToken(),
          });
          await apiRepository
              .changeProfileIMage(formData)
              .then((ApiResult<ProfilePic> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    successSnackBar("Profile Pic Uploaded");
                    Get.offAndToNamed(Routes.PROFILE);
                    LocalStorage.shared.savephoto(value.userPhoto as String);
                    print("${LocalStorage.shared.getProfile()}");
                  } else {
                    errorSnackbar("Image not Found");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  Future<void> updateProfile() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          print(profession.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;

          data["name"] = name.text;
          data["profession"] = profession.text;
          data["years"] = experience.text;
          data["location_name"] = address.text;

          await apiRepository
              .register(data)
              .then((ApiResult<ProfileModel> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    LocalStorage.shared.saveUserData(value);

                    Get.offAndToNamed(Routes.PROFILE);
                  } else if (value.status == 400) {
                    errorSnackbar("Something Went Wrong");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }


 Future<void> updatePhoneNumber() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          print(profession.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;

          data["name"] = name.text;
          data["profession"] = profession.text;
          data["years"] = experience.text;
          data["location_name"] = address.text;

          await apiRepository
              .register(data)
              .then((ApiResult<ProfileModel> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    LocalStorage.shared.saveUserData(value);

                    Get.offAndToNamed(Routes.PROFILE);
                  } else if (value.status == 400) {
                    errorSnackbar("Something Went Wrong");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

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
