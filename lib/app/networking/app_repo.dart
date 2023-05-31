// ignore_for_file: non_constant_identifier_names

import 'package:dio/dio.dart';
import 'package:ekinch/app/models/application_request.dart';
import 'package:ekinch/app/models/data_model.dart';
import 'package:ekinch/app/models/job_application.dart';
import 'package:ekinch/app/models/msg_ok.dart';
import 'package:ekinch/app/models/myJobModel.dart';
import 'package:flutter/foundation.dart';
import 'package:ekinch/app/models/sign_in.dart';
import 'package:ekinch/app/networking/service_routes.dart';

import '../../widgets/snack_bar.dart';
import '../models/GetJobForm.dart';
import '../models/available_job_list.dart';
import '../models/categories_video.dart';
import '../models/company_profile.dart';
import '../models/getCategories.dart';
import '../models/get_feedback.dart';
import '../models/job_applied_list.dart';
import '../models/language_model.dart';
import '../models/otp_model.dart';
import '../models/profile_model.dart';
import '../models/profile_pic.dart';
import '../models/recentlAdded.dart';
import '../models/records_model.dart';
import '../models/reel_model.dart';
import '../models/update_getJob.dart';
import '../models/upload_reel_model.dart';
import 'api_result.dart';
import 'dio_client.dart';
import 'network_exceptions.dart';

class APIRepository {
  DioClient? dioClient;

  APIRepository({bool isTokenRequired = false}) {
    final dio = Dio();

    // if (isTokenRequired) {
    //   dio.options.headers = {
    //     "Authorization": "Bearer ${LocalStorage.shared.getUserData()?.token}"
    //   };
    // }
    dioClient = DioClient(ServiceConstants.BASE_URL, dio);
  }

  // Options getToken() {
  //   final dioOptions = Options();
  //   dioOptions.headers = {
  //     "Authorization": "Bearer ${LocalStorage.shared.getUserData()?.token}"
  //   };
  //   return dioOptions;
  // }

  Options multiPartOptions() {
    final dioOptions = Options();
    dioOptions.headers = {
      // "Authorization": "Bearer ${LocalStorage.shared.getUserData()?.token}",
      'Content-Type': 'multipart/form-data'
    };
    return dioOptions;
  }

  String getError(e) {
    return NetworkExceptions.getErrorMessage(
        NetworkExceptions.getDioException(e));
  }

  ///////////////////////////////////////////////API/////////////////////////////////////////////////

  //LANGUAGE SELECTION

  Future<ApiResult<LocalizationModel>> selectLanguage(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.PROFILE, data: data);
      final LocalizationModel model = LocalizationModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  ///Sign In
  Future<ApiResult<SignInModel>> login(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.LOGIN, data: data);
      final SignInModel signInModel = SignInModel.fromJson(response.data);
      return ApiResult.success(data: signInModel);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Update Firebase Cloud Messaging token API
  Future<ApiResult<SignInModel>> updateFcmToken(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.UPDATEFCMTOKEN, data: data);
      final SignInModel signInModel = SignInModel.fromJson(response.data);
      return ApiResult.success(data: signInModel);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

//Verify Otp

  Future<ApiResult<OtpModel>> verifyOtp(Map<String, dynamic> data) async {
    try {
      final response = await dioClient!.post(ServiceConstants.OTP, data: data);
      final OtpModel model = OtpModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Register

  Future<ApiResult<ProfileModel>> register(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.PROFILE, data: data);
      final ProfileModel model = ProfileModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Company Profile

  Future<ApiResult<CompanyProfileModel>> updateCompanyProfile(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.COMPANYPROFILE, data: data);
      final CompanyProfileModel model =
          CompanyProfileModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Register

  Future<ApiResult<RecordsModel>> records(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.RECORDS, data: data);
      final RecordsModel model = RecordsModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Company Data Status

  Future<ApiResult<CheckStatusModel>> CompanyStatus(
      Map<String, dynamic> data) async {
    try {
      final response = await dioClient!
          .post(ServiceConstants.COMPANYPROFILESTATUS, data: data);
      final CheckStatusModel model = CheckStatusModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Send Otp - new phone number

  Future<ApiResult<OtpModel>> sendOtp(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.SENDOTP, data: data);
      final OtpModel model = OtpModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //VerifyNewNumber

  Future<ApiResult<ProfileModel>> UpdateNumber(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.UPDATEPHONE, data: data);
      final ProfileModel model = ProfileModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// CHANGE PROFILE IMAGE
  Future<ApiResult<ProfilePic>> changeProfileIMage(data) async {
    try {
      final response = await dioClient!.post(ServiceConstants.PROFILEPIC,
          data: data, options: multiPartOptions());
      final ProfilePic model = ProfilePic.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  /// CHANGE COMPANY IMAGE
  Future<ApiResult<CompanyProfileModel>> changeComapnyImage(data) async {
    try {
      final response = await dioClient!.post(ServiceConstants.COMPANYPROFILE,
          data: data, options: multiPartOptions());
      final CompanyProfileModel model =
          CompanyProfileModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Recently Added
  Future<ApiResult<RecentlyAddedModel>> recentlyAdded(data) async {
    try {
      final response = await dioClient!.post(ServiceConstants.RECENTLYADDED,
          data: data, options: multiPartOptions());
      final RecentlyAddedModel model =
          RecentlyAddedModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Get Reels

  Future<ApiResult<ReelModel>> getReels(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.GETREELS, data: data);
      final ReelModel model = ReelModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Upload Reel

  Future<ApiResult<UploadReelModel>> uploadReel(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.UPLOAD_REEL, data: data);
      final UploadReelModel model = UploadReelModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Get Category Vidoes

  Future<ApiResult<CategoriesVideoModel>> categoryVidoesData(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.CATEGORIESVIDEO, data: data);
      final CategoriesVideoModel model =
          CategoriesVideoModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Get categories

  Future<ApiResult<GetcategoriesModel>> getCategories(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.GETCATEGORIES, data: data);
      final GetcategoriesModel model =
          GetcategoriesModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Post Feedback

  Future<ApiResult<FeedbackModel>> PostFeedback(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.FEEDBACK, data: data);
      final FeedbackModel model = FeedbackModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Get List of Applied Jobs

  Future<ApiResult<JobAppliedListModel>> appliedJobList(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.APPLIEDJOBLIST, data: data);
      final JobAppliedListModel model =
          JobAppliedListModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Get Feedback

  Future<ApiResult<GetFeedbackModel>> GetFeedback(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.FEEDBACK, data: data);
      final GetFeedbackModel model = GetFeedbackModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Availble users for job

  Future<ApiResult<AvailableUserModel>> availableUserList(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.AVAILABLEUSERLIST, data: data);
      final AvailableUserModel model =
          AvailableUserModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
//check Post Job Status

  Future<ApiResult<CheckStatusModel>> checkPostJobStatus(
      Map<String, dynamic> data) async {
    try {
      final response = await dioClient!
          .post(ServiceConstants.CHECKPOSTJOBSTATUS, data: data);
      final CheckStatusModel model = CheckStatusModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Post Job

  Future<ApiResult<FeedbackModel>> PostJob(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.POSTJOB, data: data);
      final FeedbackModel model = FeedbackModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Application Request List

  Future<ApiResult<ApplicationRequestModel>> ApplicationRequest(
      Map<String, dynamic> data) async {
    try {
      final response = await dioClient!
          .post(ServiceConstants.APPLICATIONREQUESTLIST, data: data);
      final ApplicationRequestModel model =
          ApplicationRequestModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Post Job list

  Future<ApiResult<JobPostModel>> PostJobList(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.MyJobs, data: data);
      final JobPostModel model = JobPostModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Get job form fill Update

  Future<ApiResult<UpdateGetJobFormModel>> GetJobForm(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.GETJOBFORM, data: data);
      final UpdateGetJobFormModel model =
          UpdateGetJobFormModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Get job form fill -Get details

  Future<ApiResult<GetJobFormModel>> FetchGetJobForm(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.GETJOBFORM, data: data);
      final GetJobFormModel model = GetJobFormModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  Future<ApiResult<AvailableJobsModel>> FilterJob(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.FILTERJOBS, data: data);
      final AvailableJobsModel model =
          AvailableJobsModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Apply for Job

  Future<ApiResult<FeedbackModel>> ApplyJob(Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.APPLYJOB, data: data);
      final FeedbackModel model = FeedbackModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }

  //Get Available job list

  Future<ApiResult<AvailableJobsModel>> availableJobList(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.JOBLIST, data: data);
      final AvailableJobsModel model =
          AvailableJobsModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  //Check Status for resume

  Future<ApiResult<CheckStatusModel>> checkResumeStatus(
      Map<String, dynamic> data) async {
    try {
      final response =
          await dioClient!.post(ServiceConstants.GETJOBFORMSTATUS, data: data);
      final CheckStatusModel model = CheckStatusModel.fromJson(response.data);
      return ApiResult.success(data: model);
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      errorSnackbar(getError(e));
      return ApiResult.failure(error: NetworkExceptions.getDioException(e));
    }
  }
  // Future<ApiResult<OTPModel>> otp(Map<String, dynamic> data) async {
  //   try {
  //     final response =
  //     await dioClient!.post(ServiceConstants.OTP, data: data );
  //     final OTPModel otpModel = OTPModel.fromJson(response.data);
  //     return ApiResult.success(data: otpModel);
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     errorSnackbar(getError(e));
  //     return ApiResult.failure(error: NetworkExceptions.getDioException(e));
  //   }
  // }
}
