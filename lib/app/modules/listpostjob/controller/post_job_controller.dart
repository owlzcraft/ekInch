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
    var activeCategory = 0.obs;

 var jobCategory = [
    {
      "inactive_icon": "assets/icons/labour_inactive.svg",
      "active_icon": "assets/icons/labour_active.svg",
      "title": "Labour",
    },
    {
      "inactive_icon": "assets/icons/plasterMistri_inactive.svg",
      "active_icon": "assets/icons/plasterMistri_active.svg",
      "title": "Plaster Mistri",
    },
    {
      "inactive_icon": "assets/icons/welding_inactive.svg",
      "active_icon": "assets/icons/welding_active.svg",
      "title": "Welding",
    },
    {
      "inactive_icon": "assets/icons/plumber_inactive.svg",
      "active_icon": "assets/icons/plumber_active.svg",
      "title": "Plumber",
    },
    {
      "inactive_icon": "assets/icons/electrician_inactive.svg",
      "active_icon": "assets/icons/electrician_active.svg",
      "title": "Electrician",
    },
    {
      "inactive_icon": "assets/icons/painter_inactive.svg",
      "active_icon": "assets/icons/painter_active.svg",
      "title": "Painter",
    },
    {
      "inactive_icon": "assets/icons/carpenter_inactive.svg",
      "active_icon": "assets/icons/carpenter_active.svg",
      "title": "Carpenter",
    },
    {
      "inactive_icon": "assets/icons/tilesMistri_inactive.svg",
      "active_icon": "assets/icons/tilesMistri_active.svg",
      "title": "TilesMistri",
    },
    {
      "inactive_icon": "assets/icons/welding_inactive.svg",
      "active_icon": "assets/icons/welding_active.svg",
      "title": "Engineer",
    },
    {
      "inactive_icon": "assets/icons/carpenter_inactive.svg",
      "active_icon": "assets/icons/carpenter_active.svg",
      "title": "Architect",
    },
    {
      "inactive_icon": "assets/icons/labour_inactive.svg",
      "active_icon": "assets/icons/labour_active.svg",
      "title": "Dukandar",
    },
    {
      "inactive_icon": "assets/icons/welding_inactive.svg",
      "active_icon": "assets/icons/welding_active.svg",
      "title": "Contractor",
    },
     {
      "inactive_icon": "assets/icons/labour_inactive.svg",
      "active_icon": "assets/icons/labour_active.svg",
      "title": "Customer",
    },
    {
      "inactive_icon": "assets/icons/labour_inactive.svg",
      "active_icon": "assets/icons/labour_active.svg",
      "title": "Other",
    }
  ].obs;
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
//Post Job
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
