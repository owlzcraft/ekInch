import 'dart:ffi';

import 'package:ekinch/app/models/job_applied_list.dart';
import 'package:ekinch/app/modules/myJobs/view/job_applied.dart';
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

class AppliedJobController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
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

  Future<void> appliedJobList() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository
              .appliedJobList(data)
              .then((ApiResult<JobAppliedListModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("i am here");
                    Get.to(
                        MyJobsView(jobAppliedList: value.data as List<Data>));
                    // dispose();
                  } else if (value.ok == false) {
                    errorSnackbar("Apply for Job First");
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
