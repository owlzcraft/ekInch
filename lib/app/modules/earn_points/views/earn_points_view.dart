// import 'dart:ui';

// import 'package:flutter/material.dart';
// import 'package:ekinch/app/generated/assets.dart';
// import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
// import 'package:ekinch/widgets/Upperbar.dart';
// import 'package:ekinch/widgets/math_utils.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:getwidget/getwidget.dart';
// import 'package:get/get.dart';
// import '../../../custom_widget/color.dart';
// import '../../notication/view/notification_view.dart';
// import '../../settings/views/settings_view.dart';
// import '../controllers/earn_points_controller.dart';

// class EarnPointsView extends GetView<EarnPointsController> {
//   EarnPointsView({Key? key}) : super(key: key);
//   GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       key: notDrawerKey, drawer: const SettingsView(),
//       // appBar: UpperBar("Records", "Records", true, true),
//       appBar: PreferredSize(
//         preferredSize: Size.fromHeight(70),
//         child: AppBar(
//           title: const Text(
//             "Earn Points",
//             style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//           ),
//           centerTitle: true,
//           leading: IconButton(
//             icon: SvgPicture.asset(Assets.drawerIcon_white),
//             onPressed: () {
//               if (!notDrawerKey.currentState!.isDrawerOpen) {
//                 //check if drawer is closed
//                 notDrawerKey.currentState!.openDrawer(); //open drawer
//               }
//             },
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(16.0),
//               child: Container(
//                 child: Padding(
//                   padding: const EdgeInsets.all(3.0),
//                   child: Text(
//                     '15000',
//                     textAlign: TextAlign.start,
//                     style: TextStyle(
//                         fontSize: 16,
//                         color: Colors.black,
//                         fontWeight: FontWeight.bold,
//                         fontFamily: "Kadwa"),
//                   ),
//                 ),
//                 width: getHorizontalSize(75),
//                 height: getVerticalSize(25),
//                 decoration: BoxDecoration(
//                     color: Colors.white,
//                     borderRadius: BorderRadius.circular(5)),
//               ),
//             ),
//             // onPressed: (() => {Get.to(() =>  NotificationView())}),
//             // icon: SvgPicture.asset(Assets.notification),
//           ],
//           backgroundColor:
//               // Colors.white.withOpacity(0.3),
//               Colors.black, //You can make this transparent
//           elevation: 0.0, //No shadow
//         ),
//       ),
//       body: SingleChildScrollView(
//           child: Padding(
//         padding: const EdgeInsets.all(16.0),
//         child: Column(
//           children: [
//             Center(child: SvgPicture.asset(Assets.earnimg1)),
//             Text(
//               '1200 Point',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontFamily: 'Poppins',
//                   fontWeight: FontWeight.bold,
//                   fontSize: 36.0),
//             ),
//             SizedBox(height: getVerticalSize(10),),
//             Text(
//               '1000 pt=10rs so share and earn point',
//               style: TextStyle(
//                   color: Colors.black,
//                   fontSize: 14.0),
//             ),
//             SizedBox(height: getVerticalSize(35),),
//             TextFormField(
//                         // controller: ,
//                         validator: ((value) {
//                           print("value");
//                           if (value!.isEmpty) {
//                             return " Field can't be empty";
//                           }
//                           if (value.isEmail) {
//                             print("value here in valid");
//                           } else {
//                             print("in else");
//                             return "Enter a valid email.";
//                           }
//                         }),
//                         decoration:  InputDecoration(
//                           border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(6.0),
//                   ),
//                             labelText: "Enter code here",
//                             labelStyle: TextStyle(fontSize: 18.0)),
//             ),
//             SizedBox(height: getVerticalSize(28),),
//             GFButton(
//                             onPressed: () {
//                               // userLogin();
//                             },
//                             color: KColors.orange,
//                             fullWidthButton: true,
//                             size: 50.2,
//                             text: "Get Point",
//                             textStyle: const TextStyle(
//                               color: Colors.black,fontWeight: FontWeight.bold,
//                                 fontSize: 18.0, fontFamily: 'Kadwa'),
//                             // shape: GFButtonShape.standard,
//                           ),
//           ],
//         ),
//       )),
//       // bottomNavigationBar: MyNavigator(),
//     );
//   }
// }
