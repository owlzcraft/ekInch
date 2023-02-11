


import 'dart:convert';

OTPModel otpModelFromJson(String str) =>
    OTPModel.fromJson(json.decode(str));

String otpModelToJson(OTPModel data) => json.encode(data.toJson());


class OTPModel {
  OTPModel({
    // required this.errorCode,
    // required this.errorMessage,
    // required this.userId,
     this.errorCode,
     this.errorMessage,
     this.userId,
  });
  // late final String errorCode;
  // late final String errorMessage;
  // late final String userId;
  String? errorCode;
   String? errorMessage;
  String? userId;

  OTPModel.fromJson(Map<String, dynamic> json){
    errorCode = json['errorCode'];
    errorMessage = json['errorMessage'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['errorCode'] = errorCode;
    _data['errorMessage'] = errorMessage;
    _data['userId'] = userId;
    return _data;
  }
}