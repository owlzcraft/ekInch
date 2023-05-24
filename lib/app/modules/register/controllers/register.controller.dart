import 'dart:async';
import 'package:ekinch/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/profile_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';

class RegisterController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  TextEditingController name = TextEditingController();
  TextEditingController profession = TextEditingController();
  DashboardController dashboardController = Get.put(DashboardController());

  //longitude and latitude

  Future<void> register(String latitude, String longitude) async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["latitude"] = latitude;
          data["longitude"] = longitude;
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



}
