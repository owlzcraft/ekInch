import 'dart:async';

import 'package:ekinch/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/otp_model.dart';
import '../../../models/profile_model.dart';
import '../../../models/sign_in.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../networking/get_current_location.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
import '../../mobile/controllers/mobile_controller.dart';
import '../../register/controllers/register.controller.dart';

class OtpController extends GetxController {
  MobileController signInController = Get.put(MobileController());
  DashboardController dashboardController = Get.put(DashboardController());
  RegisterController registerController = Get.put(RegisterController());

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
    startTimer(60);
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
                  // LocalStorage.shared.saveFCMTOKEN(value?.token as String);
                  // LocalStorage.shared.saveUID(value?.uid as int);
                  // print(LocalStorage.shared.getFCMToken());
                  // Get.offAndToNamed(Routes.REGISTER);

                  if (value!.ok == true) {
                    LocalStorage.shared.saveFCMTOKEN(value.token as String);
                    LocalStorage.shared.saveUID(value.uid as int);
                    print(LocalStorage.shared.getFCMToken());
                    if (value.new_pro_check == true) {
                      Get.offAndToNamed(Routes.REGISTER);
                    } else {
                      register(" ", " ");
                    }
                  } else if (value.ok == false) {
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

//profile
  Future<void> register(String latitude, String longitude) async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["latitude"] = latitude;
          data["longitude"] = longitude;
          await apiRepository
              .register(data)
              .then((ApiResult<ProfileModel> value) {
            value.when(
                success: (value) {
                  if (value!.status == 200) {
                    LocalStorage.shared.saveUserData(value);
                    LocalStorage.shared
                        .savephoto(value.userData!.photo as String);
                    dashboardController.GetDashboard();
                    // Get.to(DashboardView(ReelsList: [], RecentlyAddedList: [],));
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

  //Resend Otp

  Future<void> resendOtp(number, String path) async {
    // final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(signInController.mobileNumber.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["mobileNumber"] = number;
          await apiRepository.login(data).then((ApiResult<SignInModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    Get.offAndToNamed(Routes.OTP, arguments: [number, path]);
                    successSnackBar("Otp Sent");
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

  @override
  void onClose() {
    if (_timer != null) {
      _timer!.cancel();
    }
    super.onClose();
  }

  startTimer(int seconds) {
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
