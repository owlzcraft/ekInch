import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../../networking/api_result.dart';
import '../../../../networking/app_repo.dart';
import '../../../../utils/localStorage.dart';
import '../../../listpostjob/views/jobs_view.dart';
import '../views/details_form.dart';

class JobController extends GetxController {
  var activeQualification = 0.obs;
  var qualificationData = [
    {"text1": "Below 10th", "text2": "Pass"},
    {"text1": "10th Pass", "text2": ""},
    {"text1": "12th Pass and", "text2": "Above"},
    {"text1": "Graduate and", "text2": "Above"},
  ].obs;
  var activeMedium = 0.obs;
  var activeFluency = 0.obs;
  var activeExp = 0.obs;
  var schoolMediums = ["Hindi", "English", "Others"].obs;
  var englishFluency = ["No", "Good", "Fluent"].obs;
  var expData = ["Fresher", "Experience"].obs;
  var years = ["0"];
  Filyears() {
    for (var i = 1968; i <= DateTime.now().year; i++) {
      years.remove("0");
      years.add(i.toString());
    }
  }

  // ignore: non_constant_identifier_names
  late List<Data> ApplyJobList;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  String gender = "";
  String qualification = "10th Pass";
  String experience = "0";

  // String month = "";
  // String year = "";

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
  // TextEditingController experience = TextEditingController();
  TextEditingController skills = TextEditingController();
  // TextEditingController qualification = TextEditingController();

//Get Job Form
  Future<void> GetJobForm() async {
    print("**************************");

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          print(qualificationTap.text);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["qualification"] = qualification;
          data["uid"] = 171180;
          // data["uid"] = LocalStorage.shared.getUID();
          data["gender"] = gender;
          data["sc_med"] = schoolBoard.text;
          data["eng_profi"] = englishLevel.text;
          data["exp"] = experienceTap.text;
          data["exp_yr"] = experience;
          data["age_mn"] = month.text;
          data["age_yr"] = year.text;
          data["age_dt"] = date.text;
          data["interest"] = jobCategory.text;
          data["skills"] = "Electrician+Plumber";

          await apiRepository.GetJobForm(data)
              .then((ApiResult<GetJobFormModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("done");
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
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();

          await apiRepository
              .availableJobList(data)
              .then((ApiResult<AvailableJobsModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("done");
                    ApplyJobList = value.data;
                    Get.off(JobView(JobList: ApplyJobList));
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
  Future<void> CheckResumeStatusValue() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["uid"] = "11780";
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          // data["uid"] = LocalStorage.shared.getUID();

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

  void onInit() {
    Filyears();
    super.onInit();
  }
}
