import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/msg_ok.dart';
import 'package:ekinch/app/modules/feedback/view/feedback_view.dart';
import 'package:ekinch/app/networking/app_repo.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../models/get_feedback.dart';
import '../../../networking/api_result.dart';
import '../../../utils/localStorage.dart';

class FeedbackController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  double star = 5;
  TextEditingController feedback = TextEditingController();

//Post Feedback
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
                    GetFeedback();
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

  //Get Feedback
  Future<void> GetFeedback() async {
    print("**************************");

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();

          await apiRepository.GetFeedback(data)
              .then((ApiResult<GetFeedbackModel> value) {
            value.when(success: (value) {
              if (value!.ok == true) {
                print("done");
                Get.to(FeedbackView(
                    hint: value.data!.feedbackTxt.toString(),
                    initialStar: value.data!.star as double));
              }
            }, failure: (networkExceptions) {
              errorSnackbar("Please Rate us!");
              Get.to(FeedbackView(hint: "Comment", initialStar: 5));
            });
          });
        },
        loadingWidget: const LoadingIndicator());
  }
}
