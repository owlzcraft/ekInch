import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:get/get.dart';

class PostjobController extends GetxController {
  //TODO: Implement PostjobController
  TextEditingController profession = TextEditingController();
  TextEditingController numberOfPerson = TextEditingController();
  TextEditingController salary = TextEditingController();
  TextEditingController experience = TextEditingController();
  TextEditingController location = TextEditingController();
  TextEditingController language = TextEditingController();
  TextEditingController qualification = TextEditingController();
  TextEditingController gender = TextEditingController();
  TextEditingController skills = TextEditingController();
  TextEditingController describe = TextEditingController();
  TextEditingController jobTime = TextEditingController();
  TextEditingController interviewTime = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController recruiter = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController phone = TextEditingController();
  TextEditingController address = TextEditingController();

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
