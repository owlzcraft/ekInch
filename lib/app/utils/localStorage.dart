import 'dart:convert';

import 'package:ekinch/app/models/sign_in.dart';
import 'package:get_storage/get_storage.dart';

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

  void saveLoggedIn() {
    localBox.write("IS_LOGGED_IN", true);
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

  void saveFCMTOKEN(String value) {
    localBox.write("FCM_TOKEN", value);
  }

  void savephoto(String value) {
    localBox.write("Profile", value);
  }

  void saveNumber(String value) {
    localBox.write("number", value);
  }

  String getFCMToken() {
    return localBox.read("FCM_TOKEN");
  }

  String getProfile() {
    return localBox.read("Profile");
  }

  String getnumber() {
    return localBox.read("number");
  }
}
