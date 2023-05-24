// ignore_for_file: non_constant_identifier_names

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
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
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

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();

          await apiRepository.GetFeedback(data)
              .then((ApiResult<GetFeedbackModel> value) {
            value.when(success: (value) {
              if (value!.ok == true) {
                Get.to(FeedbackView(
                    hint: value.data!.feedbackTxt.toString(),
                    initialStar: value.data!.star as double));
              }
            }, failure: (networkExceptions) {
              Get.to(const FeedbackView(hint: "............", initialStar: 5));
            });
          });
        },
        loadingWidget: const LoadingIndicator());
  }
}
