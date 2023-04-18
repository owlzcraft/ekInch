import 'dart:convert';

SignInModel signInModelFromJson(String str) =>
    SignInModel.fromJson(json.decode(str));

String signInModelToJson(SignInModel data) => json.encode(data.toJson());

class SignInModel {
  SignInModel({
    this.ok,
    this.errorMessage,
    this.userId,
  });
  bool? ok;
  String? errorMessage;
  String? userId;

  SignInModel.fromJson(Map<String, dynamic> json) {
    ok = json['ok'];
    errorMessage = json['errorMessage'];
    userId = json['userId'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['ok'] = ok;
    _data['errorMessage'] = errorMessage;
    _data['userId'] = userId;
    return _data;
  }
}
