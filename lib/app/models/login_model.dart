import 'dart:convert';

/// success : true
/// token : "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpZCI6IjYzMGVmNmI2YjMzYzQxMWY4NmUxNGQ3MSIsInBhcnRuZXJTdGF0dXMiOjAsImlhdCI6MTY2MTk0MjAxNywiZXhwIjoxNjkzNDc4MDE3fQ.1gYj1yt3RHsYXJHRg-9suYHutlPpOaOu_jVHeKnAW5A"
/// data : {"accountStatus":1,"avatarPath":"","phoneNumber":"","createdAt":"2022-08-31T05:50:46.390Z","email":"mailto:localpartner@yopmail.com","firstName":"local","lastName":"partner","isVerified":true,"location":[],"partnerStatus":0,"partnerVerified":false,"companyName":"Inter Miami FC","companyRegistrationNumber":"237237","businessAddress":"Manchester","isPartner":false,"passportPhotoVerified":"0","passportSelfieVerified":"0","firebaseUid":""}
/// message : "Login Successful"
/// isVerified : true
/// userId : "630ef6b6b33c411f86e14d71"

LoginModel loginModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String loginModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  LoginModel({
    this.success,
    this.token,
    this.loggedInUser,
    this.message,
    this.isVerified,
    this.userId,
  });

  LoginModel.fromJson(dynamic json) {
    success = json['success'];
    token = json['token'];
    loggedInUser =
        json['data'] != null ? LoggedInUser.fromJson(json['data']) : null;
    message = json['message'];
    isVerified = json['isVerified'];
    userId = json['userId'];
  }
  bool? success;
  String? token;
  LoggedInUser? loggedInUser;
  String? message;
  bool? isVerified;
  String? userId;
  LoginModel copyWith({
    bool? success,
    String? token,
    LoggedInUser? data,
    String? message,
    bool? isVerified,
    String? userId,
  }) =>
      LoginModel(
        success: success ?? this.success,
        token: token ?? this.token,
        loggedInUser: data ?? loggedInUser,
        message: message ?? this.message,
        isVerified: isVerified ?? this.isVerified,
        userId: userId ?? this.userId,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['token'] = token;
    if (loggedInUser != null) {
      map['data'] = loggedInUser?.toJson();
    }
    map['message'] = message;
    map['isVerified'] = isVerified;
    map['userId'] = userId;
    return map;
  }
}


class LoggedInUser {
  LoggedInUser({
    this.accountStatus,
    this.avatarPath,
    this.phoneNumber,
    this.createdAt,
    this.email,
    this.firstName,
    this.lastName,
    this.isVerified,
    this.location,
    this.partnerStatus,
    this.partnerVerified,
    this.companyName,
    this.companyRegistrationNumber,
    this.businessAddress,
    this.isPartner,
    this.passportPhotoVerified,
    this.passportSelfieVerified,
    this.firebaseUid,
  });

  LoggedInUser.fromJson(dynamic json) {
    accountStatus = json['accountStatus'];
    avatarPath = json['avatarPath'];
    phoneNumber = json['phoneNumber'];
    createdAt = json['createdAt'];
    email = json['email'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    isVerified = json['isVerified'];
    if (json['location'] != null) {
      location = [];
    }
    partnerStatus = json['partnerStatus'];
    partnerVerified = json['partnerVerified'];
    companyName = json['companyName'];
    companyRegistrationNumber = json['companyRegistrationNumber'];
    businessAddress = json['businessAddress'];
    isPartner = json['isPartner'];
    passportPhotoVerified = json['passportPhotoVerified'];
    passportSelfieVerified = json['passportSelfieVerified'];
    firebaseUid = json['firebaseUid'];
  }
  num? accountStatus;
  String? avatarPath;
  String? phoneNumber;
  String? createdAt;
  String? email;
  String? firstName;
  String? lastName;
  bool? isVerified;
  List<dynamic>? location;
  num? partnerStatus;
  bool? partnerVerified;
  String? companyName;
  String? companyRegistrationNumber;
  String? businessAddress;
  bool? isPartner;
  String? passportPhotoVerified;
  String? passportSelfieVerified;
  String? firebaseUid;
  LoggedInUser copyWith({
    num? accountStatus,
    String? avatarPath,
    String? phoneNumber,
    String? createdAt,
    String? email,
    String? firstName,
    String? lastName,
    bool? isVerified,
    List<dynamic>? location,
    num? partnerStatus,
    bool? partnerVerified,
    String? companyName,
    String? companyRegistrationNumber,
    String? businessAddress,
    bool? isPartner,
    String? passportPhotoVerified,
    String? passportSelfieVerified,
    String? firebaseUid,
  }) =>
      LoggedInUser(
        accountStatus: accountStatus ?? this.accountStatus,
        avatarPath: avatarPath ?? this.avatarPath,
        phoneNumber: phoneNumber ?? this.phoneNumber,
        createdAt: createdAt ?? this.createdAt,
        email: email ?? this.email,
        firstName: firstName ?? this.firstName,
        lastName: lastName ?? this.lastName,
        isVerified: isVerified ?? this.isVerified,
        location: location ?? this.location,
        partnerStatus: partnerStatus ?? this.partnerStatus,
        partnerVerified: partnerVerified ?? this.partnerVerified,
        companyName: companyName ?? this.companyName,
        companyRegistrationNumber:
            companyRegistrationNumber ?? this.companyRegistrationNumber,
        businessAddress: businessAddress ?? this.businessAddress,
        isPartner: isPartner ?? this.isPartner,
        passportPhotoVerified:
            passportPhotoVerified ?? this.passportPhotoVerified,
        passportSelfieVerified:
            passportSelfieVerified ?? this.passportSelfieVerified,
        firebaseUid: firebaseUid ?? this.firebaseUid,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['accountStatus'] = accountStatus;
    map['avatarPath'] = avatarPath;
    map['phoneNumber'] = phoneNumber;
    map['createdAt'] = createdAt;
    map['email'] = email;
    map['firstName'] = firstName;
    map['lastName'] = lastName;
    map['isVerified'] = isVerified;
    if (location != null) {
      map['location'] = location?.map((v) => v.toJson()).toList();
    }
    map['partnerStatus'] = partnerStatus;
    map['partnerVerified'] = partnerVerified;
    map['companyName'] = companyName;
    map['companyRegistrationNumber'] = companyRegistrationNumber;
    map['businessAddress'] = businessAddress;
    map['isPartner'] = isPartner;
    map['passportPhotoVerified'] = passportPhotoVerified;
    map['passportSelfieVerified'] = passportSelfieVerified;
    map['firebaseUid'] = firebaseUid;
    return map;
  }
}
