import 'dart:async';

import 'package:ekinch/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:ekinch/app/modules/mobile/controllers/mobile_controller.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/otp_model.dart';
import '../../../models/profile_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
import '../../dashboard/views/dashboard_view.dart';

class RegisterController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  TextEditingController name = TextEditingController();
  TextEditingController profession = TextEditingController();
  DashboardController dashboardController = Get.put(DashboardController());
  Future<void> register() async {
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
                                            // Get.to(DashboardView(ReelsList: [],));

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
}
