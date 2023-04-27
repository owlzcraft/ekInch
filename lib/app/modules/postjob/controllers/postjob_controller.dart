import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/msg_ok.dart';
import 'package:ekinch/app/models/myJobModel.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:get/get.dart';

import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';
import '../../job/jobInterested/views/job_interested_view.dart';
import '../../job/job_list/view/jobs_list.dart';

class PostjobController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

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
  List selectedSKills = [];
  var activeCategory = 0.obs;
  DateTime now = new DateTime.now();
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

  //POST JOB STATUS
  Future<void> checkPostJobStatus() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();
          await apiRepository
              .checkPostJobStatus(data)
              .then((ApiResult<CheckStatusModel> value) {
            value.when(
                success: (value) {
                  if (value!.data == true) {
                    // errorSnackbar("Api pending");
                    AvailableUser();
                  } else if (value.data == false) {
                    Get.to(JobInterestedView());
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

//Available list user
  Future<void> AvailableUser() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["profession"] = [50];
          await apiRepository
              .availableUserList(data)
              .then((ApiResult<AvailableUserModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print(value);
                    Get.to(JobsList(userList:value.data as List<Data>,));
                  } else if (value.ok == false) {
                    errorSnackbar("Something went wrong");
                  } else {
                    errorSnackbar("Check Internet Connection");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

//POST JOB
  Future<void> PostJob() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          // data["uid"] = 171180;
          data["posted_by"] = LocalStorage.shared.getUID();
          data["title"] = profession.text;
          data["description"] = description.text;
          data["active"] = true;
          data["job_tmg"] = jobTmg.text;
          // data["date"] = DateTime(now.year, now.month, now.day).toString();
          // data["details"] = [
          //   {
          //     data["profession"] = profession.text,
          //     data["capacity"] = capacity.text,
          //     data["slr_str"] = salaryStr.text,
          //     data["slr_end"] = salaryEnd.text,
          //     data["exp"] = exp.text,
          //     data["lng_spk"] = language.text,
          //     data["qual"] = quali.text,
          //     data["must_skill"] = selectedSKills,
          //   },
          //   {
          //     data["profession"] = profession.text,
          //     data["capacity"] = capacity.text,
          //     data["slr_str"] = salaryStr.text,
          //     data["slr_end"] = salaryEnd.text,
          //     data["exp"] = exp.text,
          //     data["lng_spk"] = language.text,
          //     data["qual"] = quali.text,
          //     data["must_skill"] = selectedSKills,
          //   }
          // ];
          // data["gender"] = gender.text;
          // data["gender"] = gender.text;
          // data["gender"] = gender.text;
          // data["gender"] = gender.text;
          // data["gender"] = gender.text;
          // data["gender"] = gender.text;

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
