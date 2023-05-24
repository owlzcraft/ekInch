import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/message/view/widget/message_card.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MessageView extends StatefulWidget {
  const MessageView({super.key});

  @override
  State<MessageView> createState() => _MessageViewState();
}

class _MessageViewState extends State<MessageView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            AppLocalizations.of(context)!.messages,
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
              onPressed: (() => {}),
              icon: SvgPicture.asset(Assets.search_icon),
            ),
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
              MessageCard(
                "",
                "Rozanne Barrientes",
                "A wonderful serenity has taken...",
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: const BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
