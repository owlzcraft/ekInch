// ignore_for_file: file_names, non_constant_identifier_names

import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/job_application.dart';
import 'package:ekinch/app/networking/api_result.dart';
import 'package:get/get.dart';
import '../../../../../widgets/loader.dart';
import '../../../../../widgets/snack_bar.dart';
import '../../../models/application_request.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';
import '../view/all_request.dart';
import '../view/job_application_view.dart';

class JobPostListController extends GetxController {
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);
   List<Data> jobList=[];
  List<DataR> applicationList=[];

//Job Post List
  Future<void> jobPostList() async {

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["uid"] = LocalStorage.shared.getUID();
          await apiRepository.PostJobList(data)
              .then((ApiResult<JobPostModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    jobList = value.data!;
                    Get.off(JobApplicationListView(
                      companyAddress: value.company!.address.toString(),
                      companyName: value.company!.name.toString(),
                      companyPhoto: value.company!.photo.toString(),
                      jobPostList: jobList,
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

  Future<void> CompanyDataStatus() async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository.CompanyStatus(data)
              .then((ApiResult<CheckStatusModel> value) {
            value.when(
                success: (value) {
                  if (value?.data == true) {
                    jobPostList();
                  } else if (value?.data == false) {
                    errorSnackbar("No Company");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  //Application list
  Future<void> applicationRequest(jobId, image, title, time, companyName,
      experience, location, language, salary, qualification) async {

    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["token"] = fcmToken;
          data["userId"] = LocalStorage.shared.getnumber();
          data["job_id"] = jobId;
          await apiRepository.ApplicationRequest(data)
              .then((ApiResult<ApplicationRequestModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    applicationList = value.data!;
                    Get.to(AllApplicationListView(
                      appreqList: applicationList,
                      jobId: jobId,
                      title: title,
                      location: location,
                      salary: salary,
                      qualification: qualification,
                      language: language,
                      experience: experience,
                      time: time,
                      companyName: companyName,
                      companyPhoto: image,
                    ));
                  } else if (value.ok == false) {
                    Get.back();
                    errorSnackbar("No Application");
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
