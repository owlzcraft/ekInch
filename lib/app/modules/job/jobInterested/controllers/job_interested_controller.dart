// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../networking/app_repo.dart';
import '../../../../utils/localStorage.dart';

class JobInterestedController extends GetxController {
  TextEditingController profession = TextEditingController();
  TextEditingController capacity = TextEditingController();
  TextEditingController salaryStr = TextEditingController();
  TextEditingController salaryEnd = TextEditingController();
  TextEditingController exp = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController quali = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController jobTmg = TextEditingController();

  var activeCategory = 0.obs;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  
  //Get Job Status
  Future<void> CheckResumeStatusValue() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();

          // await apiRepository
          //     .checkResumeStatus(data)
          //     .then((ApiResult<CheckStatusModel> value) {
          //   value.when(
          //       success: (value) {
          //         if (value!.data) {
          //           GetFormDetails();
          //         } else {
          //           Get.to(DetailsForm());
          //         }
          //       },
          //       failure: (networkExceptions) {});
          // });
        },
        loadingWidget: const LoadingIndicator());
  }

  final count = 0.obs;
  void increment() => count.value++;
}
