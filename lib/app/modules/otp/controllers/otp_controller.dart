import 'dart:async';

import 'package:flutter_application_00/app/modules/mobile/controllers/mobile_controller.dart';
import 'package:flutter_application_00/app/modules/register/views/register.view.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/otp_model.dart';
import '../../../models/sign_in.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';

class OtpController extends GetxController {
  MobileController signInController = Get.put(MobileController());
  final APIRepository apiRepository = APIRepository(isTokenRequired: false);
  final otp = "".obs;
  //TODO: Implement OtpController
  Timer? _timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    _startTimer(60);
    super.onReady();
  }

  Future<void> verifyOtp() async {
    print("**************************");
    // final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          // print(mobileNumber.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobileNumber"] = signInController.mobileNumber.text;
          data["otp"] = otp.value;
          await apiRepository.verifyOtp(data).then((ApiResult<OtpModel> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    LocalStorage.shared.saveFCMTOKEN(value.token as String);
                    
                    print(LocalStorage.shared.getFCMToken());
                    Get.offAndToNamed(Routes.REGISTER);
                    
                  } else if (value.status == 400) {
                    errorSnackbar("InCorrent Otp");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Resend Otp

  
  Future<void> resendOtp() async {
    // final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(signInController.mobileNumber.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobileNumber"] = signInController.mobileNumber.text;
          await apiRepository.login(data).then((ApiResult<SignInModel> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    LocalStorage.shared.saveNumber(value.userId as String);
                   
                    Get.offAndToNamed(Routes.OTP);
                  } else if (value.status == 400) {
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

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  _startTimer(int seconds) {
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if (remainingSeconds == 0) {
        timer.cancel();
      } else {
        int minutes = remainingSeconds ~/ 60;
        int seconds = (remainingSeconds % 60);
        time.value = minutes.toString().padLeft(2, "0") +
            ":" +
            seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }

  void increment() => count.value++;
}
