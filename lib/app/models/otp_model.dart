import 'dart:convert';

OtpModel otpModelFromJson(String str) => OtpModel.fromJson(json.decode(str));

String otpModelToJson(OtpModel data) => json.encode(data.toJson());

class OtpModel {
  OtpModel(
      {this.ok,
      this.errorMessage,
      this.userId,
      this.token,
      this.uid,
      this.new_pro_check});
  bool? ok;
  String? errorMessage;
  String? userId;
  String? token;
  int? uid;
  bool? new_pro_check;

  OtpModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    errorMessage = json['errorMessage'];
    userId = json['userId'];
    uid = json['uid'];
    new_pro_check = json['new_pro_check'];

    token = json['token'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ok'] = ok;
    _data['errorMessage'] = errorMessage;
    _data['userId'] = userId;
    _data['uid'] = uid;
    _data['new_pro_check'] = new_pro_check;
    _data['token'] = token;
    return _data;
  }
}
