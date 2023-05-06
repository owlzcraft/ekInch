// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/msg_ok.dart';
import 'package:ekinch/app/models/myJobModel.dart';
import 'package:ekinch/app/modules/postjob/views/Confirmationjob.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:get/get.dart';
import 'dart:convert';

import "package:http/http.dart" as http;
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';
import '../../job/jobInterested/views/job_interested_view.dart';
import '../../job/job_list/view/jobs_list.dart';
import '../views/post_job_view/PostDetails.dart';

class PostjobController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  TextEditingController profession1 = TextEditingController();
  TextEditingController capacity1 = TextEditingController();
  TextEditingController salaryStr1 = TextEditingController();
  TextEditingController salaryEnd1 = TextEditingController();
  TextEditingController exp1 = TextEditingController();
  TextEditingController address = TextEditingController();
  TextEditingController language1 = TextEditingController();
  TextEditingController quali1 = TextEditingController();
  TextEditingController gender1 = TextEditingController();
  TextEditingController profession2 = TextEditingController();
  TextEditingController capacity2 = TextEditingController();
  TextEditingController salaryStr2 = TextEditingController();
  TextEditingController salaryEnd2 = TextEditingController();
  TextEditingController exp2 = TextEditingController();
  TextEditingController language2 = TextEditingController();
  TextEditingController quali2 = TextEditingController();
  TextEditingController gender2 = TextEditingController();
  TextEditingController profession3 = TextEditingController();
  TextEditingController capacity3 = TextEditingController();
  TextEditingController salaryStr3 = TextEditingController();
  TextEditingController salaryEnd3 = TextEditingController();
  TextEditingController exp3 = TextEditingController();
  TextEditingController language3 = TextEditingController();
  TextEditingController quali3 = TextEditingController();
  TextEditingController gender3 = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController description = TextEditingController();
  TextEditingController jobTmg = TextEditingController();
  TextEditingController jobCount = TextEditingController();
  List selectedSKills = [];
  int professionId1 = 0;
  int professionId2 = 0;
  int professionId3 = 0;
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
          data["profession"] = [50]; //need change
          await apiRepository
              .availableUserList(data)
              .then((ApiResult<AvailableUserModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print(value);
                    Get.to(JobsList(
                      userList: value.data as List<Data>,
                    ));
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

  //Get Lat and log
  Future<Map<String, double>> getLatLong(String cityName) async {
    final apiKey = 'YOUR_API_KEY'; // Replace with your Google Maps API key
    final query = Uri.encodeFull(cityName);
    final url = Uri.parse(
        'https://maps.googleapis.com/maps/api/geocode/json?address=$query&key=$apiKey');

    final response = await http.get(url);
    final data = json.decode(response.body);

    if (data['status'] == 'OK') {
      final location = data['results'][0]['geometry']['location'];
      final lat = location['lat'];
      final lng = location['lng'];
      return {'lat': lat, 'lng': lng};
    } else {
      throw Exception('Failed to get location data');
    }
  }

//

//POST JOB
  Future<void> PostJob() async {
    final fcmToken = LocalStorage.shared.getFCMToken();

    Get.showOverlay(
        asyncFunction: () async {
          // List<dynamic> ListData = [
          //   {
          //     "gender": gender1.text.toString(),
          //     "profession": professionId1,
          //     "capacity": capacity1.text,
          //     "slr_str": salaryStr1.text,
          //     "slr_end": salaryEnd1.text,
          //     "exp": exp1.text,
          //     "lng_spk": language1.text,
          //     "qual": quali1.text,
          //     "must_skill": selectedSKills
          //   },
          //   {
          //     "gender": gender2.text.toString(),
          //     "profession": professionId2,
          //     "capacity": capacity2.text,
          //     "slr_str": salaryStr2.text,
          //     "slr_end": salaryEnd2.text,
          //     "exp": exp2.text,
          //     "lng_spk": language2.text,
          //     "qual": quali2.text,
          //     "must_skill": selectedSKills
          //   },
          //   {
          //     "gender": gender3.text.toString(),
          //     "profession": professionId3,
          //     "capacity": capacity3.text,
          //     "slr_str": salaryStr3.text,
          //     "slr_end": salaryEnd3.text,
          //     "exp": exp3.text,
          //     "lng_spk": language3.text,
          //     "qual": quali3.text,
          //     "must_skill": selectedSKills
          //   },
          // ];
          List<dynamic> JobData = [];
          if (jobCount.text == '0') {
            switch (profession1.text) {
              case "Labour":
                professionId1 = 0;
                break;
              case "Plaster Mistri":
                professionId1 = 1;
                break;
              case "Weilding":
                professionId1 = 2;
                break;
              case "Plumber":
                professionId1 = 3;
                break;
              case "Electrcian":
                professionId1 = 4;
                break;
              case "Painter":
                professionId1 = 5;
                break;
              case "Carpenter":
                professionId1 = 6;
                break;
              case "TilesMistri":
                professionId1 = 7;
                break;
              case "Engineer":
                professionId1 = 8;
                break;
              case "Architect":
                professionId1 = 9;
                break;
              case "Dukandar":
                professionId1 = 10;
                break;
              case "Contractor":
                professionId1 = 11;
                break;
              case "Customer":
                professionId1 = 12;
                break;
              case "Other":
                professionId1 = 13;
                break;
            }
            JobData = [
              {
                "gender": gender1.text.toString(),
                "profession": professionId1,
                "capacity": capacity1.text,
                "slr_str": salaryStr1.text,
                "slr_end": salaryEnd1.text,
                "exp": exp1.text,
                "lng_spk": language1.text,
                "qual": quali1.text,
                "must_skill": selectedSKills
              },
            ];
          } else {
            if (jobCount.text == '1') {
              switch (profession1.text) {
                case "Labour":
                  professionId1 = 0;
                  break;
                case "Plaster Mistri":
                  professionId1 = 1;
                  break;
                case "Weilding":
                  professionId1 = 2;
                  break;
                case "Plumber":
                  professionId1 = 3;
                  break;
                case "Electrcian":
                  professionId1 = 4;
                  break;
                case "Painter":
                  professionId1 = 5;
                  break;
                case "Carpenter":
                  professionId1 = 6;
                  break;
                case "TilesMistri":
                  professionId1 = 7;
                  break;
                case "Engineer":
                  professionId1 = 8;
                  break;
                case "Architect":
                  professionId1 = 9;
                  break;
                case "Dukandar":
                  professionId1 = 10;
                  break;
                case "Contractor":
                  professionId1 = 11;
                  break;
                case "Customer":
                  professionId1 = 12;
                  break;
                case "Other":
                  professionId1 = 13;
                  break;
              }
              switch (profession2.text) {
                case "Labour":
                  professionId2 = 0;
                  break;
                case "Plaster Mistri":
                  professionId2 = 1;
                  break;
                case "Weilding":
                  professionId2 = 2;
                  break;
                case "Plumber":
                  professionId2 = 3;
                  break;
                case "Electrcian":
                  professionId2 = 4;
                  break;
                case "Painter":
                  professionId2 = 5;
                  break;
                case "Carpenter":
                  professionId2 = 6;
                  break;
                case "TilesMistri":
                  professionId2 = 7;
                  break;
                case "Engineer":
                  professionId2 = 8;
                  break;
                case "Architect":
                  professionId2 = 9;
                  break;
                case "Dukandar":
                  professionId2 = 10;
                  break;
                case "Contractor":
                  professionId2 = 11;
                  break;
                case "Customer":
                  professionId2 = 12;
                  break;
                case "Other":
                  professionId2 = 13;
                  break;
              }
              JobData = [
                {
                  "gender": gender1.text.toString(),
                  "profession": professionId1,
                  "capacity": capacity1.text,
                  "slr_str": salaryStr1.text,
                  "slr_end": salaryEnd1.text,
                  "exp": exp1.text,
                  "lng_spk": language1.text,
                  "qual": quali1.text,
                  "must_skill": selectedSKills
                },
                {
                  "gender": gender2.text.toString(),
                  "profession": professionId2,
                  "capacity": capacity2.text,
                  "slr_str": salaryStr2.text,
                  "slr_end": salaryEnd2.text,
                  "exp": exp2.text,
                  "lng_spk": language2.text,
                  "qual": quali2.text,
                  "must_skill": selectedSKills
                },
              ];
            } else {
              if(jobCount.text=='2')
              {switch (profession1.text) {
                case "Labour":
                  professionId1 = 0;
                  break;
                case "Plaster Mistri":
                  professionId1 = 1;
                  break;
                case "Weilding":
                  professionId1 = 2;
                  break;
                case "Plumber":
                  professionId1 = 3;
                  break;
                case "Electrcian":
                  professionId1 = 4;
                  break;
                case "Painter":
                  professionId1 = 5;
                  break;
                case "Carpenter":
                  professionId1 = 6;
                  break;
                case "TilesMistri":
                  professionId1 = 7;
                  break;
                case "Engineer":
                  professionId1 = 8;
                  break;
                case "Architect":
                  professionId1 = 9;
                  break;
                case "Dukandar":
                  professionId1 = 10;
                  break;
                case "Contractor":
                  professionId1 = 11;
                  break;
                case "Customer":
                  professionId1 = 12;
                  break;
                case "Other":
                  professionId1 = 13;
                  break;
              }
              switch (profession2.text) {
                case "Labour":
                  professionId2 = 0;
                  break;
                case "Plaster Mistri":
                  professionId2 = 1;
                  break;
                case "Weilding":
                  professionId2 = 2;
                  break;
                case "Plumber":
                  professionId2 = 3;
                  break;
                case "Electrcian":
                  professionId2 = 4;
                  break;
                case "Painter":
                  professionId2 = 5;
                  break;
                case "Carpenter":
                  professionId2 = 6;
                  break;
                case "TilesMistri":
                  professionId2 = 7;
                  break;
                case "Engineer":
                  professionId2 = 8;
                  break;
                case "Architect":
                  professionId2 = 9;
                  break;
                case "Dukandar":
                  professionId2 = 10;
                  break;
                case "Contractor":
                  professionId2 = 11;
                  break;
                case "Customer":
                  professionId2 = 12;
                  break;
                case "Other":
                  professionId2 = 13;
                  break;
              }
              switch (profession3.text) {
                case "Labour":
                  professionId3 = 0;
                  break;
                case "Plaster Mistri":
                  professionId3 = 1;
                  break;
                case "Weilding":
                  professionId3 = 2;
                  break;
                case "Plumber":
                  professionId3 = 3;
                  break;
                case "Electrcian":
                  professionId3 = 4;
                  break;
                case "Painter":
                  professionId3 = 5;
                  break;
                case "Carpenter":
                  professionId3 = 6;
                  break;
                case "TilesMistri":
                  professionId3 = 7;
                  break;
                case "Engineer":
                  professionId3 = 8;
                  break;
                case "Architect":
                  professionId3 = 9;
                  break;
                case "Dukandar":
                  professionId3 = 10;
                  break;
                case "Contractor":
                  professionId3 = 11;
                  break;
                case "Customer":
                  professionId3 = 12;
                  break;
                case "Other":
                  professionId3 = 13;
                  break;}
              }
              JobData = [
                {
                  "gender": gender1.text.toString(),
                  "profession": professionId1,
                  "capacity": capacity1.text,
                  "slr_str": salaryStr1.text,
                  "slr_end": salaryEnd1.text,
                  "exp": exp1.text,
                  "lng_spk": language1.text,
                  "qual": quali1.text,
                  "must_skill": selectedSKills
                },
                {
                  "gender": gender2.text.toString(),
                  "profession": professionId2,
                  "capacity": capacity2.text,
                  "slr_str": salaryStr2.text,
                  "slr_end": salaryEnd2.text,
                  "exp": exp2.text,
                  "lng_spk": language2.text,
                  "qual": quali2.text,
                  "must_skill": selectedSKills
                },
                {
                  "gender": gender3.text.toString(),
                  "profession": professionId3,
                  "capacity": capacity3.text,
                  "slr_str": salaryStr3.text,
                  "slr_end": salaryEnd3.text,
                  "exp": exp3.text,
                  "lng_spk": language3.text,
                  "qual": quali3.text,
                  "must_skill": selectedSKills
                },
              ];
            }
          }

          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          // final Map<String, dynamic> details = <String, dynamic>{};

          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["location"] = address.text;
          data["lattitude"] = "5362"; //need change
          data["longitude"] = "5362"; //need change
          data["city"] = address.text;
          data["posted_by"] = LocalStorage.shared.getUID();
          data["title"] = profession1.text;
          data["description"] = description.text;
          data["active"] = true;
          data["job_tmg"] = jobTmg.text;
          data["date"] = DateTime(now.year, now.month, now.day).toString();
          data["details"] = JobData;

          await apiRepository.PostJob(data)
              .then((ApiResult<FeedbackModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("done");
                    errorSnackbar(value.msg.toString());
                    Get.offAll(
                        Confirmationjob(title: profession1.text.toString()));
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
