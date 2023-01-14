import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

import 'app/routes/app_pages.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
  const SystemUiOverlayStyle(statusBarColor: Colors.transparent));
  const device_height = 802.9090909090909;
  const device_width = 392.72727272727275;

  runApp(ScreenUtilInit(builder: ((context, child) {
    return GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  })));
}
