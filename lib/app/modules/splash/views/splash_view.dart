import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/splash_controller.dart';

class SplashView extends StatefulWidget {
   const SplashView({Key? key}) : super(key: key);

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
   SplashController controller=Get.put(SplashController());

  @override
  Widget build(BuildContext context) {
    return Image.asset(
      'assets/images/splash_screen.png',
      fit: BoxFit.cover,
    );
  }
}
