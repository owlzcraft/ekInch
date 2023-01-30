import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

import '../../referNearn/views/refer_nearn_view.dart';
import '../../settings/views/settings_view.dart';

class NotificationView extends StatelessWidget {
   NotificationView({super.key});
GlobalKey<ScaffoldState>  notDrawerKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(70),
        child: AppBar(
          title: const Text(
            "Notification",
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                notDrawerKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
          actions: [
            IconButton(
              padding: const EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {Get.to(() =>  NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            ),
          ],
          backgroundColor:
              // Colors.white.withOpacity(0.3),
              Colors.black, //You can make this transparent
          elevation: 0.0, //No shadow
        ),
      ),
      body:SingleChildScrollView(child: Center(child: Text("Notifications"))),bottomNavigationBar: MyNavigator(),);
  }
}