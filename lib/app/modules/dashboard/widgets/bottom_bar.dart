// import 'package:ekinch/app/modules/dashboard/controllers/dashboard_controller.dart';
// import 'package:flutter/material.dart';
// import 'package:ekinch/app/custom_widget/color.dart';
// import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
// import 'package:ekinch/app/modules/home/views/home_view.dart';
// import 'package:ekinch/app/modules/job/form/views/jobs_landing.dart';
// import 'package:ekinch/app/modules/profile/views/profile_view.dart';
// import 'package:ekinch/app/modules/reels/views/reels_view.dart';
// import 'package:ekinch/app/modules/reels/views/video_viewer.dart';
// import 'package:ekinch/widgets/math_utils.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:get/get.dart';
// import 'package:persistent_bottom_nav_bar/persistent_tab_view.dart';

// import '../../../generated/assets.dart';
// import '../../records/views/records_view.dart';

// class BottomBar extends StatefulWidget {
//   BottomBar({super.key,});

//   @override
//   State<BottomBar> createState() => _BottomBarState();
// DashboardController dashboardController=Get.put(DashboardController());
// }

// class _BottomBarState extends State<BottomBar> {
//   final _controller = PersistentTabController(initialIndex: 0);
//   @override
//   Widget build(BuildContext context) {
//     return PersistentTabView(
//       context,
//       onItemSelected: (index) {
//         setState(() {
//           _controller.index = index;
//         });
//       },
//       controller: _controller,
//       screens: _buildScreens() as List<Widget>,
//       items: _navBarsItems(),
//       confineInSafeArea: true,
//       navBarHeight: getVerticalSize(79),
//       backgroundColor:
//         Color.fromARGB(0, 250, 249, 249),// Default is Colors.white.
//       handleAndroidBackButtonPress: true, // Default is true.
//       resizeToAvoidBottomInset:
//           false, // This needs to be true if you want to move up the screen when keyboard appears. Default is true.
//       stateManagement: true, // Default is true.
//       hideNavigationBarWhenKeyboardShows:
//           true, // Recommended to set 'resizeToAvoidBottomInset' as true while using this argument. Default is true.
//       decoration: NavBarDecoration(
//         borderRadius: BorderRadius.circular(10.0),
//         colorBehindNavBar: Colors.white,
//       ),
//       popAllScreensOnTapOfSelectedTab: true,
//       popActionScreens: PopActionScreensType.all,
//       itemAnimationProperties: ItemAnimationProperties(
//         // Navigation Bar's items animation properties.
//         duration: Duration(milliseconds: 100),
//         curve: Curves.ease,
//       ),
//       screenTransitionAnimation: ScreenTransitionAnimation(
//         // Screen transition animation on change of selected tab.
//         animateTabTransition: true,
//         curve: Curves.ease,
//         duration: Duration(milliseconds: 100),
//       ),
//       navBarStyle:
//           NavBarStyle.style3, // Choose the nav bar style with this property.
//     );
//   }
// }

// List _buildScreens() {
//   DashboardController dashboardController=Get.put(DashboardController());

//   return [
//     dashboardController.GetDashboard(),
//     // Container(),
//     ReelsView(),
//     JobLanding(),
//     RecordsView(),
//     ProfileView(),
//   ];
// }

// List<PersistentBottomNavBarItem> _navBarsItems() {
//   return [
//     PersistentBottomNavBarItem(
//       icon: Image.asset(Assets.home),
//       inactiveIcon: Image.asset(
//         Assets.home,
//         color: KColors.greyIcon,
//       ),
//       title: ("Home"),
//       activeColorPrimary: KColors.orange,
//       inactiveColorPrimary: Colors.black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Image.asset(
//         Assets.lib_icon,
//         color: Colors.black,
//       ),
//       inactiveIcon: Image.asset(Assets.lib_icon),
//       title: ("Library"),
//       activeColorPrimary: KColors.orange,
//       inactiveColorPrimary: Colors.black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Image.asset(
//         Assets.job,
//         color: Colors.black,
//       ),
//       inactiveIcon: Image.asset(Assets.job),
//       title: ("Job"),
//       activeColorPrimary: KColors.orange,
//       inactiveColorPrimary: Colors.black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Image.asset(
//         Assets.records,
//         color: Colors.black,
//       ),
//       inactiveIcon: Image.asset(Assets.records),
//       title: ("Records"),
//       activeColorPrimary: KColors.orange,
//       inactiveColorPrimary: Colors.black,
//     ),
//     PersistentBottomNavBarItem(
//       icon: Image.asset(
//         Assets.profile,
//         color: Colors.black,
//       ),
//       inactiveIcon: Image.asset(Assets.profile),
//       title: ("Profile"),
//       activeColorPrimary: KColors.orange,
//       inactiveColorPrimary: Colors.black,
//     ),
//   ];
// }
