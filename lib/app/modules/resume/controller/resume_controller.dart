// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/models/GetJobForm.dart';
import 'package:ekinch/app/models/available_job_list.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/modules/resume/view/preview_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../models/update_getJob.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';
import '../../job/form/views/details_form.dart';

class ResumeController extends GetxController {
  var activeQualification = 0.obs;
  var activeMedium = 0.obs;
  var activeFluency = 0.obs;
  var activeExp = 0.obs;
  var years = ["0"];
  Filyears() {
    for (var i = 1968; i <= DateTime.now().year; i++) {
      years.remove("0");
      years.add(i.toString());
    }
  }

  final List<String> days = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
    "13",
    "14",
    "15",
    "16",
    "17",
    "18",
    "19",
    "20",
    "21",
    "22",
    "23",
    "24",
    "25",
    "26",
    "27",
    "28",
    "29",
    "30",
    "31"
  ];
  final List<String> monthNumber = [
    "1",
    "2",
    "3",
    "4",
    "5",
    "6",
    "7",
    "8",
    "9",
    "10",
    "11",
    "12",
  ];

  late List<Data> ApplyJobList;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
  TextEditingController gender = TextEditingController();
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
  List selectedSKills = [];
  late String result;
//Get Job Form
  Future<void> UpdateGetForm() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["qualification"] = qualification.text;
          data["user"] = LocalStorage.shared.getUID();
          data["gender"] = gender.text;
          data["sc_med"] = schoolBoard.text;
          data["eng_profi"] = englishLevel.text;
          data["exp"] = experienceTap.text;
          data["exp_yr"] = experience.text;
          data["age_mn"] = month.text;
          data["age_yr"] = year.text;
          data["age_dt"] = date.text;
          data["flag"] = 0;
          data["interest"] = jobCategory.text;

          await apiRepository.GetJobForm(data)
              .then((ApiResult<UpdateGetJobFormModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    GetFormDetails();
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

//add more skills;
  Future<void> UpdateSkills() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["user"] = LocalStorage.shared.getUID();
          data["flag"] = 0;
          data["skills"] = selectedSKills.join(',');

          await apiRepository.GetJobForm(data)
              .then((ApiResult<UpdateGetJobFormModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    GetFormDetails();
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

  Future<void> GetFormDetails() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
         
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();
          data["flag"] = 1;

          await apiRepository.FetchGetJobForm(data)
              .then((ApiResult<GetJobFormModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    Get.to(GetJobPreviewView(
                      category: value.data!.interest.toString(),
                      dob:
                          "${value.data!.ageDt}/${value.data!.ageMn}/${value.data!.ageYr}",
                      gender: value.data!.gender.toString(),
                      experience: value.data!.expYr.toString(),
                      quali: value.data!.qualification.toString(),
                      board: value.data!.scMed.toString(),
                      date: value.data!.ageDt.toString(),
                      englishSpk: value.data!.engProfi.toString(),
                      expTap: value.data!.exp.toString(),
                      month: value.data!.ageMn.toString(),
                      year: value.data!.ageYr.toString(),
                      skill: value.data!.skillsLst as List<String>,
                    ));
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
                    GetFormDetails();
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
    Filyears();
    super.onInit();
  }
}
