import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';

class PostJobController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

//Apply Job
  Future<void> ApplyJob(String jobId) async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["job_id"] = jobId;
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository.ApplyJob(data)
              .then((ApiResult<GetJobFormModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("done");
                    // GetJobList();
                  } else if (value.ok == false) {
                    print("Incomplete Process");

                    // Get.back();
                    errorSnackbar("Please Refresh");
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }
}
