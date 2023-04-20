import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/networking/api_result.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';


class JobApplicationController extends GetxController {
  
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

 
  // TextEditingController jobCategory = TextEditingController();
  

//Get Job Form
  // Future<void> GetJobForm() async {
  //   print("**************************");

  //   final fcmToken = LocalStorage.shared.getFCMToken();
  //   Get.showOverlay(
  //       asyncFunction: () async {
  //         print(fcmToken);
  //         final Map<String, dynamic> data = <String, dynamic>{};
  //         data["token"] = fcmToken;
  //         data["userId"] = LocalStorage.shared.getnumber();
         

  //         await apiRepository.GetJobForm(data)
  //             .then((ApiResult<GetJobFormModel> value) {
  //           value.when(
  //               success: (value) {
  //                 if (value!.ok == true) {
  //                   print("done");
  //                 } else if (value.ok == false) {
  //                   Get.back();
  //                   errorSnackbar("Please Refresh");
  //                 } else {
  //                   errorSnackbar("Check Internet Connection");
  //                 }
  //               },
  //               failure: (networkExceptions) {});
  //         });
  //       },
  //       loadingWidget: const LoadingIndicator());
  // }


  void onInit() {
    super.onInit();
  }
}
