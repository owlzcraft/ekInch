import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../widgets/loader.dart';
import '../../../../networking/app_repo.dart';
import '../../../../utils/localStorage.dart';

class JobInterestedController extends GetxController {
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

  var activeCategory = 0.obs;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

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
  //Get Job Status
  Future<void> CheckResumeStatusValue() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();

          // await apiRepository
          //     .checkResumeStatus(data)
          //     .then((ApiResult<CheckStatusModel> value) {
          //   value.when(
          //       success: (value) {
          //         if (value!.data) {
          //           GetFormDetails();
          //         } else {
          //           Get.to(DetailsForm());
          //         }
          //       },
          //       failure: (networkExceptions) {});
          // });
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
