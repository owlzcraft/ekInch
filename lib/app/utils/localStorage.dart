import 'dart:convert';

import 'package:ekinch/app/models/sign_in.dart';
import 'package:get_storage/get_storage.dart';

import '../models/company_profile.dart';
import '../models/login_model.dart';
import '../models/profile_model.dart';

class LocalStorage {
  static final GetStorage localBox = GetStorage();
  static final LocalStorage _singleton = LocalStorage._internal();
  factory LocalStorage() => _singleton;
  LocalStorage._internal();
  static LocalStorage get shared => _singleton;

  void saveWalkthrough() {
    localBox.write("WALKTHROUGH", true);
  }

  bool isWalkthroughComplete() {
    return localBox.read("WALKTHROUGH") ?? false;
  }

  void saveLoggedIn(bool value) {
    localBox.write("IS_LOGGED_IN", value);
  }

  bool isLoggedIn() {
    return localBox.read("IS_LOGGED_IN") ?? false;
  }
 

  Future<void> reset() async {
    localBox.erase();
  }

  void saveUserData(ProfileModel userData) async {
    localBox.write("USER_DATA", profileModelToJson(userData));
  }

  ProfileModel? getUserData() {
    ProfileModel? userData;
    final String? user = localBox.read("USER_DATA");
    if (user != null) {
      userData = ProfileModel.fromJson(json.decode(user));
      return userData;
    }
    return null;
  }
 void saveCompanyData(CompanyProfileModel userData) async {
    localBox.write("COMPANY_DATA", companyModelToJson(userData));
  }

  CompanyProfileModel? getCompanyData() {
    CompanyProfileModel? userData;
    final String? user = localBox.read("USER_DATA");
    if (user != null) {
      userData = CompanyProfileModel.fromJson(json.decode(user));
      return userData;
    }
    return null;
  }

  void saveFCMTOKEN(String value) {
    localBox.write("FCM_TOKEN", value);
  }

  void savephoto(String value) {
    localBox.write("Profile", value);
  }
   void saveCompanyLogo(String value) {
    localBox.write("Company", value);
  }

  void saveNumber(String value) {
    localBox.write("number", value);
  }
void saveUID(int value) {
    localBox.write("uid", value);
  }

  int getUID() {
    return localBox.read("uid");
  }
  String getFCMToken() {
    return localBox.read("FCM_TOKEN");
  }
String getComapanyLogo() {
    return localBox.read("Company");
  }
  String getProfile() {
    return localBox.read("Profile");
  }

  String getnumber() {
    return localBox.read("number");
  }
}
