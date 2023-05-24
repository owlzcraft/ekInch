import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/recently_added/view/widget/user_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../notication/view/notification_view.dart';
import '../../postjob/widgets/shortDropDown.dart';
import '../../settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecentlyAddedView extends StatefulWidget {
  const RecentlyAddedView({super.key});

  @override
  State<RecentlyAddedView> createState() => RecentlyAddedViewState();
}

class RecentlyAddedViewState extends State<RecentlyAddedView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: KColors.greybg,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            AppLocalizations.of(context)!.recentlyAdded,
            style: GoogleFonts.kadwa(
                fontSize: F24(),
                color: Colors.white,
                fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                notDrawerKey.currentState!.openDrawer();
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            )
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      bottomNavigationBar: const BottomTabView(9),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFeildGreyBorder(
              hintText: AppLocalizations.of(context)!.searchByName,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 4.0),
              child: Text(
                AppLocalizations.of(context)!.recentlyAddedUsers,
                style: GoogleFonts.kadwa(
                    fontSize: F20(),
                    color: Colors.black,
                    fontWeight: FontWeight.w700),
              ),
            ),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician"),
            UserCard("", "Nisha", "Electrician")
          ],
        ),
      )),
    );
  }
}
