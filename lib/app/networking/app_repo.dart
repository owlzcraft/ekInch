import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_application_00/app/models/sign_in.dart';
import 'package:flutter_application_00/app/networking/service_routes.dart';

import '../../widgets/snack_bar.dart';
import '../models/login_model.dart';
import '../models/otp_model.dart';
import '../utils/localStorage.dart';
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

  // Options multiPartOptions() {
  //   final dioOptions = Options();
  //   dioOptions.headers = {
  //     "Authorization": "Bearer ${LocalStorage.shared.getUserData()?.token}",
  //     'Content-Type': 'multipart/form-data'
  //   };
  //   return dioOptions;
  // }

  String getError(e) {
    return NetworkExceptions.getErrorMessage(
        NetworkExceptions.getDioException(e));
  }

  ///////////////////////////////////////////////API/////////////////////////////////////////////////
  ///Sign In
  Future<ApiResult<SignInModel>> login(Map<String, dynamic> data) async {
    try {
      print("*********************************************");
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

//Verify Otp

 Future<ApiResult<OtpModel>> verifyOtp(Map<String, dynamic> data) async {
    try {
      print("*********************************************");
      final response =
          await dioClient!.post(ServiceConstants.OTP, data: data);
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
