


import 'dart:convert';

OTPModel otpModelFromJson(String str) =>
    OTPModel.fromJson(json.decode(str));

String otpModelToJson(OTPModel data) => json.encode(data.toJson());


class OTPModel {
  OTPModel({
    required this.status,
    required this.errorMessage,
    required this.userId,
  });
  late final int status;
  late final String errorMessage;
  late final String userId;
  
  OTPModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    errorMessage = json['errorMessage'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['errorMessage'] = errorMessage;
    _data['userId'] = userId;
    return _data;
  }
}