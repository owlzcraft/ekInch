import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/plans/view/widget/plans_card.dart';
import 'package:ekinch/app/modules/plans/view/widget/related_card.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_widget/color.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class PlansView extends StatefulWidget {
  const PlansView({super.key});

  @override
  State<PlansView> createState() => _PlansViewState();
}

class _PlansViewState extends State<PlansView> {
  GlobalKey<ScaffoldState> notDrawerKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            "Plans",
            style: GoogleFonts.kadwa(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: F24()),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
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
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            ),
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  PlansCard(
                      Colors.blue,
                      "Most Recommended",
                      "Starter Plan",
                      "INR 999.00",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access"),
                  PlansCard(
                      KColors.orange,
                      "Most Recommended",
                      "Starter Plan",
                      "INR 999.00",
                      "100 Employee Access",
                      "Organize your notes and workflows.",
                      "250 Message Send to Employee",
                      "250 Message Send to Employee",
                      "250 Message Send to Employee",
                      "100 Employee Access"),
                  PlansCard(
                      Colors.blue,
                      "Most Recommended",
                      "Starter Plan",
                      "INR 999.00",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access",
                      "100 Employee Access")
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                "Related Plan ",
                style: GoogleFonts.kadwa(
                    color: Colors.white,
                    fontSize: F20(),
                    fontWeight: FontWeight.w700),
              ),
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  RelatedCard(
                      KColors.greenBackground,
                      "Monthly Plan",
                      "250.99",
                      "100 User Data Access",
                      "10 Message daily send",
                      "12-03-2023",
                      "12-04-2023"),RelatedCard(
                      Colors.redAccent,
                      "Monthly Plan",
                      "250.99",
                      "100 User Data Access",
                      "10 Message daily send",
                      "12-03-2023",
                      "12-04-2023"), RelatedCard(
                      KColors.greenBackground,
                      "Monthly Plan",
                      "250.99",
                      "100 User Data Access",
                      "10 Message daily send",
                      "12-03-2023",
                      "12-04-2023"),RelatedCard(
                      Colors.redAccent,
                      "Monthly Plan",
                      "250.99",
                      "100 User Data Access",
                      "10 Message daily send",
                      "12-03-2023",
                      "12-04-2023")
                ],
              ),
            ),
            SizedBox(height: getVerticalSize(30),)
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
