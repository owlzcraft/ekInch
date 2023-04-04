import 'package:ekinch/app/modules/company/view/company_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mime_type/mime_type.dart';
import 'package:ekinch/app/modules/otp/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/company_profile.dart';
import '../../../models/otp_model.dart';
import '../../../models/profile_model.dart';
import '../../../models/profile_pic.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class CompanyController extends GetxController {
  //TODO: Implement ReelsController
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  TextEditingController companyName = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  TextEditingController companyType = TextEditingController();
  TextEditingController mobileNumber = TextEditingController();
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
      changeLogo();
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
      changeLogo();
    } else {
      isProfileSelected.value = false;
      errorSnackbar("No Photo Taken");
    }
  }

  changeLogo() {
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
              .changeComapnyImage(formData)
              .then((ApiResult<ProfilePic> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    successSnackBar("Profile Pic Uploaded");
                    LocalStorage.shared
                        .saveCompanyLogo(value.userPhoto as String);
                    Get.offAll(CompanyView());
                  } else {
                    errorSnackbar("Image not Found");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  Future<void> updateCompanyProfile() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["name"] = companyName.text;
          data["email"] = companyEmail.text;
          data["user"] = LocalStorage.shared.getUID();
          data["address"] = companyAddress.text;

          await apiRepository
              .updateCompanyProfile(data)
              .then((ApiResult<CompanyProfileModel> value) {
            value.when(
                success: (value) {
                  // if (value!.status == 200) {
                  //   Get.offAndToNamed(Routes.PROFILE);
                  // } else if (value.status == 400) {
                  //   errorSnackbar("Something Went Wrong");
                  // } else {
                  //   errorSnackbar("Please Try After Sometime");
                  // }
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
