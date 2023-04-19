import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/modules/company/view/company_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:dio/dio.dart' as dio;
import 'package:mime_type/mime_type.dart';
import 'package:ekinch/app/modules/otp/views/otp_view.dart';
import 'package:flutter/material.dart';
import 'package:http_parser/http_parser.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../models/company_profile.dart';
import '../../../models/otp_model.dart';
import '../../../models/profile_model.dart';
import '../../../models/profile_pic.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../routes/app_pages.dart';
import '../../../utils/localStorage.dart';
import '../../job/form/views/details_form.dart';
import '../../resume/view/preview_view.dart';

class CompanyController extends GetxController {
  //TODO: Implement ReelsController
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  TextEditingController companyName = TextEditingController();
  TextEditingController companyEmail = TextEditingController();
  TextEditingController companyAddress = TextEditingController();
  TextEditingController companyType = TextEditingController();
  TextEditingController contact = TextEditingController();
  final count = 0.obs;
  final picker = ImagePicker();
  final isProfileSelected = false.obs;
  final profile = ''.obs;
  pickProfileCamera() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 1);
    if (pickedImage != null) {
      if (!GetUtils.isImage(pickedImage.path)) {
        errorSnackbar('Invalid Image type');
        return;
      }
      isProfileSelected.value = true;
      profile.value = pickedImage.path;
      changeLogo();
    } else {
      isProfileSelected.value = false;
      errorSnackbar("No Photo Taken");
    }
  }

  pickProfileGallery() async {
    final pickedImage =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 1);
    if (pickedImage != null) {
      if (!GetUtils.isImage(pickedImage.path)) {
        errorSnackbar('Invalid Image type');
        return;
      }
      isProfileSelected.value = true;
      profile.value = pickedImage.path;
      changeLogo();
    } else {
      isProfileSelected.value = false;
      errorSnackbar("No Photo Taken");
    }
  }

  changeLogo() {
    Get.showOverlay(
        asyncFunction: () async {
          final formData = dio.FormData.fromMap({
            "photo": dio.MultipartFile.fromFileSync(profile.value,
                filename: profile.value.split('/').join(''),
                contentType:
                    MediaType('image', mime(profile.value)!.split('/')[1])),
            "userId": LocalStorage.shared.getUserData()!.userId,
            "token": LocalStorage.shared.getFCMToken(),
            "flag": "0",
            "user": LocalStorage.shared.getUID(),
          });
          await apiRepository
              .changeComapnyImage(formData)
              .then((ApiResult<CompanyProfileModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    successSnackBar("Profile Pic Uploaded");
                    LocalStorage.shared
                        .saveCompanyLogo(value.data?.photo as String);
                    print("Api not working");
                    Get.offAll(CompanyView(
                      companyName: value.data!.name.toString(),
                      address: value.data!.address.toString(),
                      contact: value.data!.contact.toString(),
                      email: value.data!.email.toString(),
                      photo: value.data!.photo.toString(),
                      oldUser: true,
                    ));
                  } else {
                    errorSnackbar("Image not Found");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  Future<void> updateCompanyProfile() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["name"] = companyName.text;
          data["email"] = companyEmail.text;
          data["contact"] = contact.text;
          data["flag"] = 0;
          data["user"] = LocalStorage.shared.getUID();
          data["address"] = companyAddress.text;

          await apiRepository
              .updateCompanyProfile(data)
              .then((ApiResult<CompanyProfileModel> value) {
            value.when(
                success: (value) {
                  if (value?.ok == true) {
                    errorSnackbar("Profile Updated!");
                    // LocalStorage.shared
                    //     .saveCompanyData(value as CompanyProfileModel);
                    GetCompanyProfile();
                  } else if (value?.ok == false) {
                    errorSnackbar("Something Went Wrong");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

//Get data For Company Profile
  Future<void> GetCompanyProfile() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["flag"] = 1;
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository
              .updateCompanyProfile(data)
              .then((ApiResult<CompanyProfileModel> value) {
            value.when(
                success: (value) {
                  if (value?.ok == true) {
                    LocalStorage.shared
                        .saveCompanyData(value as CompanyProfileModel);
                    Get.to(CompanyView(
                      companyName: value.data!.name.toString(),
                      address: value.data!.address.toString(),
                      email: value.data!.email.toString(),
                      contact: value.data!.contact.toString(),
                      photo: value.data!.photo.toString(),
                      oldUser: true,
                    ));
                  } else if (value?.ok == false) {
                    errorSnackbar("Something Went Wrong");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

//Company Data Check

  Future<void> CompanyDataStatus() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository.CompanyStatus(data)
              .then((ApiResult<CheckStatusModel> value) {
            value.when(
                success: (value) {
                  if (value?.data == true) {
                    // errorSnackbar("Get API");
                    GetCompanyProfile();
                    // Get.to(CompanyView(address: '', companyName: '', contact: '', email: '', photo: '',));
                  } else if (value?.data == false) {
                    Get.to(CompanyView(
                      address: 'Company Address',
                      companyName: 'Company Name',
                      contact: ' Company Contact no.',
                      email: 'Company Email',
                      photo: 'assets/images/profile_icon.png',
                      oldUser: false,
                    ));
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

//Get Company Data

  Future<void> GetCompanyData() async {
    print("**************************");
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["uid"] = LocalStorage.shared.getUID();

          await apiRepository.CompanyStatus(data)
              .then((ApiResult<CheckStatusModel> value) {
            value.when(
                success: (value) {
                  if (value?.data == true) {
                    errorSnackbar("Get API");

                    // Get.to(CompanyView(address: '', companyName: '', contact: '', email: '', photo: '',));
                  } else if (value?.data == false) {
                    Get.to(CompanyView(
                      address: 'Company Address',
                      companyName: 'Company Name',
                      contact: ' Company Contact no.',
                      email: 'Company Email',
                      photo: 'assets/images/profile_icon.png',
                      oldUser: false,
                    ));
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  // //Get Job Status
  // Future<void> CheckResumeStatusValue() async {
  //   print("**************************");
  //   final fcmToken = LocalStorage.shared.getFCMToken();
  //   Get.showOverlay(
  //       asyncFunction: () async {
  //         print(fcmToken);
  //         final Map<String, dynamic> data = <String, dynamic>{};
  //         data["token"] = fcmToken;
  //         data["userId"] = LocalStorage.shared.getnumber();
  //         data["uid"] = LocalStorage.shared.getUID();

  //         await apiRepository
  //             .checkResumeStatus(data)
  //             .then((ApiResult<CheckStatusModel> value) {
  //           value.when(
  //               success: (value) {
  //                 if (value!.data) {
  //                   errorSnackbar("Get Resume APi");
  //                   Get.to(GetJobPreviewView(
  //                       category: "Category",
  //                       dob: "09/09/09",
  //                       gender: "gender",
  //                       experience: "experience",
  //                       quali: "quali", date: '', board: '', englishSpk: '', expTap: '', month: '', year: '',));
  //                 } else {
  //                   Get.to(DetailsForm());
  //                 }
  //               },
  //               failure: (networkExceptions) {});
  //         });
  //       },
  //       loadingWidget: const LoadingIndicator());
  // }

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
