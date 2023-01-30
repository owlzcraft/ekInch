import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/language/views/language_view.dart';

import 'package:get/get.dart';

import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({Key? key}) : super(key: key);
  @override
  @override
  Widget build(BuildContext context) {
    print(controller.count);
    return Image.asset(
      'assets/images/splash_screen.png',
      fit: BoxFit.cover,
    );
  }
}
