import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/modules/notication/notification_controller.dart';
import 'app/routes/app_pages.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:ekinch/l10n/l10n.dart';

Locale _locale = const Locale('en');

Locale get locale => _locale;

void changeAppLanguage(Locale newLocale) {
  _locale = newLocale;
  Get.updateLocale(newLocale);
}

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  // await LocalStorage.init();
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();
  await PushNotificationService().setupInteractedMessage();
//comment
// final FlutterLocalization localization = FlutterLocalization.instance;
  runApp(ScreenUtilInit(builder: ((context, child) {
    return GetMaterialApp(
      supportedLocales: L10n.all,
      locale: _locale,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate
      ],
      localeResolutionCallback: (locale, supportedLocales) {
        for (var supportedLocale in supportedLocales) {
          if (supportedLocale.languageCode == locale!.languageCode &&
              supportedLocale.countryCode == locale.countryCode) {
            return supportedLocale;
          }
        }
        return const Locale('en', 'US');
      },
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  })));
}
