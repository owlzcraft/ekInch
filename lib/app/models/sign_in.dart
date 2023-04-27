import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.ok,
    this.msg,
    this.userId,
  });
  bool? ok;
  String? msg;
  String? userId;

  SignInModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    msg = json['msg'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ok'] = ok;
    _data['msg'] = msg;
    _data['userId'] = userId;
    return _data;
  }
}
