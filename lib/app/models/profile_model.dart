// ignore_for_file: non_constant_identifier_names, no_leading_underscores_for_local_identifiers

import 'dart:convert';

ProfileModel profileModelFromJson(String str) =>
    ProfileModel.fromJson(json.decode(str));

String profileModelToJson(ProfileModel data) => json.encode(data.toJson());

class ProfileModel {
  ProfileModel(
      {this.status, this.details, this.userId, this.userData, this.new_number});
  int? status;
  String? details;
  String? userId;
  String? new_number;
  UserData? userData;

  ProfileModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    details = json['details'];
    userId = json['userId'];
    new_number = json['new_number'];
    userData = UserData.fromJson(json['user_data']);
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['status'] = status;
    _data['details'] = details;
    _data['userId'] = userId;
    _data['new_number'] = new_number;
    _data['user_data'] = userData?.toJson();
    return _data;
  }
}

class UserData {
  UserData({
    this.phoneNumber,
    this.firstName,
    this.adhaarNumber,
    this.organisation,
    this.profession,
    this.years,
    this.gender,
    this.longitude,
    this.latitude,
    this.address,
    this.photo,
  });
  String? phoneNumber;
  String? firstName;
  String? adhaarNumber;
  String? organisation;
  String? profession;
  int? years;
  String? gender;
  String? longitude;
  String? latitude;
  String? address;
  String? photo;

  UserData.fromJson(Map<String, dynamic> json) {
    phoneNumber = json['phone_number'];
    firstName = json['first_name'];
    adhaarNumber = json['adhaar_number'];
    organisation = json['organisation'];
    profession = json['profession'];
    years = json['years'];
    gender = json['gender'];
    longitude = json['longitude'];
    latitude = json['latitude'];
    address = json['address'];
    photo = json['photo'];
  }

  Map<String, dynamic> toJson() {
    final _data = <String, dynamic>{};
    _data['phone_number'] = phoneNumber;
    _data['first_name'] = firstName;
    _data['adhaar_number'] = adhaarNumber;
    _data['organisation'] = organisation;
    _data['profession'] = profession;
    _data['years'] = years;
    _data['gender'] = gender;
    _data['longitude'] = longitude;
    _data['latitude'] = latitude;
    _data['address'] = address;
    _data['photo'] = photo;
    return _data;
  }
}
