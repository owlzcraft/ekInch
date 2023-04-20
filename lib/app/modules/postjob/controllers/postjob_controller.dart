import 'package:ekinch/app/models/msg_ok.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';

class PostjobController extends GetxController {
    final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  TextEditingController profession = TextEditingController();
  TextEditingController numberOfPerson = TextEditingController();
  TextEditingController salarySt = TextEditingController();
  TextEditingController salaryEnd = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController describe = TextEditingController();
  TextEditingController jobTime = TextEditingController();
  // TextEditingController interviewTime = TextEditingController();
  // TextEditingController companyName = TextEditingController();
  // TextEditingController recruiter = TextEditingController();
  // TextEditingController email = TextEditingController();
  // TextEditingController phone = TextEditingController();
  // TextEditingController address = TextEditingController();

//Get Job Form
  Future<void> PostJob() async {
    print("**************************");

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["qualification"] = qualification.text;
          // data["uid"] = 171180;
          data["uid"] = LocalStorage.shared.getUID();
          data["gender"] = gender.text;
          

          await apiRepository.PostJob(data)
              .then((ApiResult<FeedbackModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("done");
                  } else if (value.ok == false) {
                    Get.back();
                    errorSnackbar("Please Fill All Details");
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
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
