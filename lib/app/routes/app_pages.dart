import 'package:flutter_application_00/app/modules/language/bindings/language_binding.dart';
import 'package:flutter_application_00/app/modules/language/views/language_view.dart';
import 'package:flutter_application_00/app/modules/mobile/bindings/mobile_binding.dart';
import 'package:flutter_application_00/app/modules/otp/bindings/otp_binding.dart';
import 'package:flutter_application_00/app/modules/otp/views/otp_view.dart';
import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/mobile/views/mobile_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => const HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.SPLASH,
          page: () => const SplashView(),
          binding: SplashBinding(),
        ),
      ],
    ),
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()),
    GetPage(
        name: _Paths.LANGUAGE,
        page: () => LanguageView(),
        binding: LanguageBinding()),
        GetPage(
        name: _Paths.MOBILE,
        page: () => const MobileView(),
        binding: MobileBinding()),
        GetPage(
        name: _Paths.LANGUAGE,
        page: () => LanguageView(),
        binding: LanguageBinding()),
        GetPage(
        name: _Paths.OTP,
        page: () =>  OtpView(),
        binding: OtpBinding())
  ];
}
