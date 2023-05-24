// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../../models/update_getJob.dart';
import '../../../../networking/api_result.dart';
import '../../../../networking/app_repo.dart';
import '../../../../utils/localStorage.dart';
import '../../../listpostjob/views/jobs_view.dart';
import '../views/details_form.dart';

class GetJobController extends GetxController {
  var activeQualification = 0.obs;
  var activeMedium = 0.obs;
  var activeFluency = 0.obs;
  var activeExp = 0.obs;
  var years = ["0"];
  filyears() {
    for (var i = 1968; i <= DateTime.now().year; i++) {
      years.remove("0");
      years.add(i.toString());
    }
  }

  List<Data> ApplyJobList = [];
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  List selectedSKills = [];
  late String result;
  String gender = "";
  // String qualification = "";
  // String experience = "";
  TextEditingController qualification = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController qualificationTap = TextEditingController();
  TextEditingController board = TextEditingController();
  TextEditingController englishLevel = TextEditingController();
  TextEditingController experienceTap = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController schoolBoard = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobCategory = TextEditingController();
//Get Job Form
  Future<void> GetJobForm() async {
    // for (int i = 0; i < selectedSKills.length-1; i++) {
    //   result=selectedSKills.join(" , ");
    //   // var data=;
    //   // data = data + "," + selectedSKills[i];
    //   result = data;

    // }
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["qualification"] = qualification.text;
          // data["uid"] = 171180;
          data["user"] = LocalStorage.shared.getUID();
          data["gender"] = gender;
          data["sc_med"] = schoolBoard.text;
          data["eng_profi"] = englishLevel.text;
          data["exp"] = experienceTap.text;
          data["exp_yr"] = experience.text;
          data["age_mn"] = month.text;
          data["age_yr"] = year.text;
          data["age_dt"] = date.text;
          data["flag"] = 0;
          data["interest"] = jobCategory.text;
          data["skills"] = selectedSKills.join(" , ");

          await apiRepository.GetJobForm(data)
              .then((ApiResult<UpdateGetJobFormModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    GetJobList();
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

//GetJob Dashboard
  Future<void> GetJobList() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository
              .availableJobList(data)
              .then((ApiResult<AvailableJobsModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    ApplyJobList = value.data;
                    Get.to(JobView(jobList: ApplyJobList,filterValue: "Select Category",));
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

//Get Job Status
  Future<void> CheckResumeStatusValue() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository
              .checkResumeStatus(data)
              .then((ApiResult<CheckStatusModel> value) {
            value.when(
                success: (value) {
                  if (value!.data) {
                    GetJobList();
                  } else {
                    Get.to(DetailsForm());
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  @override
  void onInit() {
    filyears();
    super.onInit();
  }
}
