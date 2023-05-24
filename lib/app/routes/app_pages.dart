// ignore_for_file: constant_identifier_names

import 'package:ekinch/app/modules/Onboarding/bindings/onboarding_binding.dart';
import 'package:ekinch/app/modules/Onboarding/views/onboarding_view.dart';
import 'package:ekinch/app/modules/company/view/company_view.dart';
import 'package:ekinch/app/modules/job/form/views/jobs_landing.dart';
import 'package:get/get.dart';
import '../modules/language/bindings/language_binding.dart';
import '../modules/language/views/language_view.dart';
import '../modules/mobile/bindings/mobile_binding.dart';
import '../modules/mobile/views/mobile_view.dart';
import '../modules/otp/bindings/otp_binding.dart';
import '../modules/otp/views/otp_view.dart';
import '../modules/profile/bindings/profile_binding.dart';
import '../modules/profile/views/profile_view.dart';
import '../modules/records/bindings/records_binding.dart';
import '../modules/records/views/records_view.dart';
import '../modules/referNearn/bindings/refer_nearn_binding.dart';
import '../modules/referNearn/views/refer_nearn_view.dart';
import '../modules/register/bindings/register.binding.dart';
import '../modules/register/views/register.view.dart';
import '../modules/settings/bindings/settings_binding.dart';
import '../modules/settings/views/settings_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SPLASH;

  static final routes = [
    GetPage(
        name: _Paths.SPLASH,
        page: () => const SplashView(),
        binding: SplashBinding()),

    GetPage(
        name: _Paths.LANGUAGE,
        transition: Transition.fadeIn,
        transitionDuration: const Duration(milliseconds: 600),
        page: () => const LanguageView(),
        binding: LanguageBinding()),
    GetPage(
        name: _Paths.MOBILE,
        transition: Transition.rightToLeft,
        page: () => const MobileView(),
        binding: MobileBinding()),
    GetPage(
      name: _Paths.COMPANY,
      transition: Transition.rightToLeft,
      page: () => const CompanyView(
        address: '',
        companyName: '',
        contact: '',
        email: '',
        photo: '',
        oldUser: false,
      ),
      // binding: MobileBinding()
    ),
    GetPage(
        name: _Paths.REGISTER,
        transition: Transition.rightToLeft,
        page: () => const RegisterView(),
        binding: RegisterBinding()),
    GetPage(
        name: _Paths.LANGUAGE,
        page: () => const LanguageView(),
        binding: LanguageBinding()),
    // GetPage(name: _Paths.OTP, page: () => OtpView(), binding: OtpBinding()),
    GetPage(
        name: _Paths.RECORDS,
        transition: Transition.fadeIn,
        page: () => const RecordsView(),
        binding: RecordsBinding()),
    GetPage(
        name: _Paths.REFERNEARN,
        page: () => ReferNearnView(),
        binding: ReferNearnBinding()),
    GetPage(name: _Paths.OTP, page: () => const OtpView(), binding: OtpBinding()),
    // GetPage(
    //     name: _Paths.REELS,
    //     page: () => const ReelsView(),
    //     binding: ReelsBinding()),
    GetPage(
        name: _Paths.SETTINGS,
        page: () => const SettingsView(),
        binding: SettingsBinding()),
    GetPage(
        name: _Paths.ONBOARDING,
        transition: Transition.leftToRight,
        page: () => OnboardingView(),
        binding: OnboardingBinding()),
    GetPage(
        name: _Paths.PROFILE,
        page: () => const ProfileView(),
        binding: ProfileBinding()),
    GetPage(
      name: _Paths.JOB,
      page: () => const JobLanding(),
      // binding: PostjobBinding(),
    ),
  ];
}
