import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:ekinch/app/models/sign_in.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/login_model.dart';
import '../../../models/sign_in.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class MobileController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();

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

  Future<void> signInWithmobile() async {
    // final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(mobileNumber.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobileNumber"] = mobileNumber.text;
          await apiRepository.login(data).then((ApiResult<SignInModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("i am here");
                    LocalStorage.shared.saveNumber(value.userId as String);
                    LocalStorage.shared.saveCompanyLogo(" ");
                    // errorSnackbar("done");
                    Get.offAndToNamed(Routes.OTP,
                        arguments: [mobileNumber.text, "Login"]);
                    // dispose();
                  } else if (value.ok == false) {
                    errorSnackbar("Phone Number Already Exist");
                  } else {
                    errorSnackbar("Invalid Phone Number");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }
}
