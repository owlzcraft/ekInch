import 'package:flutter_application_00/app/modules/language/bindings/language_binding.dart';
import 'package:flutter_application_00/app/modules/language/views/language_view.dart';
import 'package:flutter_application_00/app/modules/mobile/bindings/mobile_binding.dart';
import 'package:flutter_application_00/app/modules/otp/bindings/otp_binding.dart';
import 'package:flutter_application_00/app/modules/otp/views/otp_view.dart';
import 'package:flutter_application_00/app/modules/profile/bindings/profile_binding.dart';
import 'package:flutter_application_00/app/modules/profile/views/profile_view.dart';
import 'package:flutter_application_00/app/modules/records/bindings/records_binding.dart';
import 'package:flutter_application_00/app/modules/records/views/records_view.dart';
import 'package:flutter_application_00/app/modules/reels/bindings/reels_binding.dart';
import 'package:flutter_application_00/app/modules/reels/views/reels_view.dart';
import 'package:flutter_application_00/app/modules/referNearn/bindings/refer_nearn_binding.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:flutter_application_00/app/modules/settings/bindings/settings_binding.dart';
import 'package:flutter_application_00/app/modules/settings/views/settings_view.dart';
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
    GetPage(name: _Paths.OTP, page: () => OtpView(), binding: OtpBinding()),
    GetPage(
        name: _Paths.RECORDS,
        page: () => RecordsView(),
        binding: RecordsBinding()),
    GetPage(
        name: _Paths.RECORDS,
        page: () => const ReferNearnView(),
        binding: ReferNearnBinding()),
    GetPage(
        name: _Paths.REELS,
        page: () => const ReelsView(),
        binding: ReelsBinding()),
    GetPage(
        name: _Paths.SETTINGS,
        page: () => const SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: _Paths.SETTINGS,
        page: () => ProfileView(),
        binding: ProfileBinding()),
  ];
}
