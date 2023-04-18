import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';

class RecordsController extends GetxController {
  //TODO: Implement RecordsController
 final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  //Records

  Future<void> Records() async {
  

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["catId"] = "100";
          
          // await apiRepository
          //     .register(data)
          //     .then((ApiResult<ProfileModel> value) {
          //   value.when(
          //       success: (value) {
          //         if (value!.status == 200) {
                  
          //         } else if (value.status == 400) {
          //           errorSnackbar("Something Went Wrong");
          //         } else {
          //           errorSnackbar("Please Try After Sometime");
          //         }
          //       },
          //       failure: (networkExceptions) {});
          // });
        },
        loadingWidget: const LoadingIndicator());
  }



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
}
