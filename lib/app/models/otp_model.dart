import 'dart:convert';

OtpModel otpModelFromJson(String str) =>
    OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());
class OtpModel {
  OtpModel({
this.status,
this.errorMessage,
this.userId,
this.token,
  });
   int? status;
   String? errorMessage;
   String? userId;
  String? token;
  
  OtpModel.fromJson(Map<String, dynamic> json){
    status = json['status'];
    errorMessage = json['errorMessage'];
    userId = json['userId'];
    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['errorMessage'] = errorMessage;
    _data['userId'] = userId;
    _data['token'] = token;
    return _data;
  }
}