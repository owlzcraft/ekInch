import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
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
      //  supportedLocales: localization.supportedLocales,
      //   localizationsDelegates: localization.localizationsDelegates,
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  })));
  
}
