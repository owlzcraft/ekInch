import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'app/utils/localStorage.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  const device_height = 802.9090909090909;
  const device_width = 392.72727272727275;
//comment
  var walkThrough = LocalStorage.shared.isWalkthroughComplete();
// final FlutterLocalization localization = FlutterLocalization.instance;
  runApp(ScreenUtilInit(builder: ((context, child) {
    return GetMaterialApp(
      supportedLocales: [
        const Locale('en', 'US'),
        const Locale('hi', 'IN'),
      ],
      localizationsDelegates: [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        // If the locale of the device is not supported,
        // fallback to the default locale (English, US).
        return const Locale('en', 'US');
      },
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  })));
}
