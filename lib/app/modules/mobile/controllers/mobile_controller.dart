import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/models/otp_model.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/login_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class MobileController extends GetxController {
  late TextEditingController loginEmail;
  late TextEditingController loginPass;
  late TextEditingController loginmobile;

final APIRepository apiRepository = APIRepository(isTokenRequired: false);
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

    Future<void> loginWithmobile() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobile"] = loginmobile.text.trim().toLowerCase();
         // data["password"] = loginPass.text;
         // data["FcmToken"] = fcmToken;
          await apiRepository.otp(data).then((ApiResult<OTPModel> value) {
            value.when(
                success: (value) {
                
                  loginmobile.clear();
                  //todo
                  //debugPrint(value?.token);
                  if (value!.status == 200) {
                    LocalStorage.shared.savedata(value);
                    
                    Get.offAndToNamed(Routes.OTP); 
                  } else if (value.status! == 400 &&
                      value.errorMessage! == false) {
                  } else {
                    errorSnackbar("Error"!);
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

    Future<void> loginWithEmail() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobile"] = loginEmail.text.trim().toLowerCase();
          data["password"] = loginPass.text;
          data["FcmToken"] = fcmToken;
          await apiRepository.login(data).then((ApiResult<LoginModel> value) {
            value.when(
                success: (value) {
                  loginEmail.clear();
                  loginPass.clear();
                  //todo
                  debugPrint(value?.token);
                  if (value!.success! == true && value.isVerified! == true) {
                    LocalStorage.shared.saveUserData(value);
                    LocalStorage.shared.saveLoggedIn();
                    Get.offAndToNamed(Routes.HOME); 
                  } else if (value.success! == true &&
                      value.isVerified! == false) {
                  } else {
                    errorSnackbar(value.message!);
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }
}
