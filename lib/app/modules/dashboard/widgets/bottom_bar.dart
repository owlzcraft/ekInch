import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_application_00/app/modules/job/form/views/jobs_landing.dart';
import 'package:flutter_application_00/app/modules/profile/views/profile_view.dart';
import 'package:flutter_application_00/app/modules/reels/views/reels_view.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

import '../../../generated/assets.dart';
import '../../records/views/records_view.dart';

class BottomBar extends StatelessWidget {
  BottomBar({super.key});

  final _controller = PersistentTabController(initialIndex: 0);

  @override
  Widget build(BuildContext context) {
    return PersistentTabView(
      context,
      controller: _controller,
      screens: _buildScreens(),
      items: _navBarsItems(),
      confineInSafeArea: true,
      navBarHeight: getVerticalSize(79),
      backgroundColor: Color.fromARGB(255, 254, 252, 252), // Default is Colors.white.
      handleAndroidBackButtonPress: true, // Default is true.
      resizeToAvoidBottomInset:
          false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
      stateManagement: true, // Default is true.
      hideNavigationBarWhenKeyboardShows:
          true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
      decoration: NavBarDecoration(
        borderRadius: BorderRadius.circular(10.0),
        colorBehindNavBar: Colors.white,
      ),
      popAllScreensOnTapOfSelectedTab: true,
      popActionScreens: PopActionScreensType.all,
      itemAnimationProperties: ItemAnimationProperties(
        // Navigation Bar's items animation properties.
        duration: Duration(milliseconds: 100),
        curve: Curves.ease,
      ),
      screenTransitionAnimation: ScreenTransitionAnimation(
        // Screen transition animation on change of selected tab.
        animateTabTransition: true,
        curve: Curves.ease,
        duration: Duration(milliseconds: 100),
      ),
      navBarStyle:
          NavBarStyle.style3, // Choose the nav bar style with this property.
    );
  }
}

List<Widget> _buildScreens() {
  return [
    // DashboardView(
    //   name: 'Sanjay',
    // ),
    Container(),
    ReelsView(),
    JobLanding(),
    RecordsView(),
    ProfileView(),
  ];
}

List<PersistentBottomNavBarItem> _navBarsItems() {
  return [
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.home),
      title: ("Home"),
      activeColorPrimary: KColors.orange,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.lib_icon),
      title: ("Library"),
      activeColorPrimary: KColors.orange,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.job,),
      title: ("Job"),
      activeColorPrimary: KColors.orange,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.records),
      title: ("Records"),
      activeColorPrimary: KColors.orange,
      inactiveColorPrimary: Colors.black,
    ),
    PersistentBottomNavBarItem(
      icon: Image.asset(Assets.profile),
      title: ("Profile"),
      activeColorPrimary: KColors.orange,
      inactiveColorPrimary: Colors.black,
    ),
  ];
}
