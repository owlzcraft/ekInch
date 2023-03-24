import 'package:flutter/material.dart';
import 'package:get/get.dart';

class JobController extends GetxController {
  var activeQualification = 0.obs;
  var qualificationData = [
    {"text1": "Below 10th", "text2": "Pass"},
    {"text1": "10th Pass", "text2": ""},
    {"text1": "12th Pass and", "text2": "Above"},
    {"text1": "Graduate and", "text2": "Above"},
  ].obs;
  var activeMedium = 0.obs;
  var activeFluency = 0.obs;
  var activeExp = 0.obs;
  var schoolMediums = ["Hindi", "English", "Others"].obs;
  var englishFluency = ["No", "Good", "Fluent"].obs;
  var expData = ["Fresher", "Experience"].obs;
  var years = ["0"];
  Filyears() {
    for (var i = 1968; i <= DateTime.now().year; i++) {
      years.remove("0");
      years.add(i.toString());
    }
  }

  String gender = "";
  TextEditingController qualificationTap = TextEditingController();
  TextEditingController board = TextEditingController();
  TextEditingController englishLevel = TextEditingController();
  TextEditingController experienceTap = TextEditingController();
  TextEditingController date = TextEditingController();
  TextEditingController month = TextEditingController();
  TextEditingController year = TextEditingController();
  TextEditingController schoolBoard = TextEditingController();
  TextEditingController jobTitle = TextEditingController();
  TextEditingController jobCategory = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController qualification = TextEditingController();

  void onInit() {
    Filyears();
    super.onInit();
  }
}
