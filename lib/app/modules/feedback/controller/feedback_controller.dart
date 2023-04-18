import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/msg_ok.dart';
import 'package:ekinch/app/networking/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../utils/localStorage.dart';

class FeedbackController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  double star =5 ;
  TextEditingController feedback = TextEditingController();

//Get Job Form
  Future<void> PostFeedback() async {
    print("**************************");

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["feedback"] = feedback.text;
          data["audio_flag"] = 0;
          data["star"] = star;

          await apiRepository.PostFeedback(data)
              .then((ApiResult<FeedbackModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("done");
                    errorSnackbar("Saved!");
                    // GetJobList();
                  } else if (value.ok == false) {
                    Get.back();
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
