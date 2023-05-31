import 'package:flutter/material.dart';
import 'package:ekinch/app/models/sign_in.dart';
import 'package:get/get.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class MobileController extends GetxController {
  TextEditingController mobileNumber = TextEditingController();

  final APIRepository apiRepository = APIRepository(isTokenRequired: false);
  final count = 0.obs;

  void increment() => count.value++;

  Future<void> signInWithmobile() async {
    // final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobileNumber"] = mobileNumber.text;
          await apiRepository.login(data).then((ApiResult<SignInModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    LocalStorage.shared.saveNumber(value.userId as String);
                    LocalStorage.shared.saveCompanyLogo(" ");
                    Get.offAndToNamed(Routes.OTP,
                        arguments: [mobileNumber.text, "Login"]);
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
