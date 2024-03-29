import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/referNearn/views/inviteScreen.dart';
import 'package:ekinch/app/modules/referNearn/views/statusScreen.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../custom_widget/font_size.dart';
import '../../dashboard/widgets/navigation.dart';
import '../controllers/refer_nearn_controller.dart';

class ReferNearnView extends GetView<ReferNearnController> {
  ReferNearnView({Key? key}) : super(key: key);

  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        backgroundColor: Colors.white,
        key: notDrawerKey,
        bottomNavigationBar: const BottomTabView(9),
        // bottomNavigationBar: MyNavigator(),
        drawer: const SettingsView(),
        appBar: AppBar(
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                notDrawerKey.currentState!.openDrawer();
              }
            },
          ),
          backgroundColor: Colors.black,
          title:  Text(
            AppLocalizations.of(context)!.referEarn,
            style: GoogleFonts.kadwa(color: Colors.white, fontWeight: FontWeight.w700,fontSize: F24()),
          ),
          centerTitle: true,
          bottom: TabBar(
            indicator: const BoxDecoration(
                border: Border(
                    bottom: BorderSide(width: 3, color: Color(0xFFFEBA0F)))),
            // indicatorColor: Color(0xFFFEBA0F),
            tabs: [
              Tab(
                  child: Text(
                AppLocalizations.of(context)!.invite,
                style: GoogleFonts.kadwa(fontSize: 16),
              )),
              Tab(
                  child: Text(
                 AppLocalizations.of(context)!.status,
                style: GoogleFonts.kadwa(fontSize: 16),
              ))
            ],
          ),
          actions: [
            Padding(
              padding:
                   const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.all(Radius.circular(5))),
                child: Row(
                  children: [
                    Center(
                      child: Text(
                        "1500  ",
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, color: Colors.black),
                      ),
                    ),
                    Center(
                      child: Image.asset(
                        Assets.reward_icon,
                        scale: 1.3,
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
        body: const TabBarView(
          children: [InviteScreen(), StatusScreen()],
        ),
      ),
    );
  }
}
