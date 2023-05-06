import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/msg_ok.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';
import '../views/jobDescription.dart';
import '../views/jobs_view.dart';

class ApplyJobController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  var activeCategory = 0.obs;
  int professionId = 0;
  TextEditingController filter = TextEditingController();
 
//Apply Job
  Future<void> ApplyJob(
      String jobId,
      address,
      jobTime,
      require,
      location,
      qualification,
      language,
      salary,
      jobInfo,
      jobTitle,
      experience,
      company,
      subtitle) async {
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
              .then((ApiResult<FeedbackModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print(value.msg.toString());
                    // GetJobList();
                    // print("777777777777777777777777777");
                    Get.off(JobDescription(
                      address: address,
                      jobTime: jobTime,
                      require: require,
                      location: location,
                      qualification: qualification,
                      status: false,
                      language: language,
                      salary: salary,
                      jobInfo: jobInfo,
                      jobId: jobId,
                      jobTitle: jobTitle,
                      experience: experience,
                      company: company,
                      subtitle: subtitle,
                    ));
                  } else if (value.ok == false) {
                    // Get.back();
                    errorSnackbar(value.msg.toString());
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Filter Job
  Future<void> FilterJob() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    switch (filter.text) {
      case "Labour":
        professionId = 0;
        break;
      case "Plaster Mistri":
        professionId = 1;
        break;
      case "Weilding":
        professionId = 2;
        break;
      case "Plumber":
        professionId = 3;
        break;
      case "Electrcian":
        professionId = 4;
        break;
      case "Painter":
        professionId = 5;
        break;
      case "Carpenter":
        professionId = 6;
        break;
      case "TilesMistri":
        professionId = 7;
        break;
      case "Engineer":
        professionId = 8;
        break;
      case "Architect":
        professionId = 9;
        break;
      case "Dukandar":
        professionId = 10;
        break;
      case "Contractor":
        professionId = 11;
        break;
      case "Customer":
        professionId = 12;
        break;
      case "Other":
        professionId = 13;
        break;

      default:
    }
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["prof_id"] = professionId;

          await apiRepository.FilterJob(data)
              .then((ApiResult<AvailableJobsModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print(value.msg.toString());
                    Get.offAll(JobView(
                      JobList: value.data,
                      filterValue: filter.text.toString(),
                    ));
                  } else if (value.ok == false) {
                    // Get.back();
                    errorSnackbar(value.msg.toString());
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
