// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:ekinch/app/modules/settings/views/settings_view.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:get/get.dart';

// import '../../../../../../widgets/math_utils.dart';
// import '../../../../../generated/assets.dart';
// import '../../../../notication/view/notification_view.dart';

// class ProfileFormView extends StatelessWidget {
//   ProfileFormView({super.key});
//   GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();
//   var _chosenValue;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         key: notDrawerKey,
//         drawer: const SettingsView(),
//         // appBar: UpperBar("Records", "Records", true, true),
//         appBar: PreferredSize(
//           preferredSize: const Size.fromHeight(140),
//           child: AppBar(
//             centerTitle: false,
//             bottom: PreferredSize(
//               preferredSize: const Size(0.0, 4.0),
//               child: Padding(
//                 padding: const EdgeInsets.only(
//                     left: 16.0, right: 16.0, top: 16.0, bottom: 30),
//                 child: Row(
//                   children: [
//                     Column(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         const Text(
//                           "Hello,",
//                           style: TextStyle(
//                             color: Colors.white,
//                             fontSize: 16,
//                           ),
//                         ),
//                         SizedBox(
//                           height: 5,
//                         ),
//                         const Text(
//                           "Sanjay Singh",
//                           style: TextStyle(
//                               color: Colors.white,
//                               fontSize: 27,
//                               fontWeight: FontWeight.bold),
//                         ),
//                       ],
//                     ),
//                     SizedBox(
//                       width: getHorizontalSize(130),
//                     ),
//                     CircleAvatar(
//                       radius: 30.sp,
//                       backgroundColor: const Color(0xFFBFBCBC),
//                       child: CircleAvatar(
//                         radius: 28.sp,
//                         backgroundImage:
//                             const AssetImage("assets/images/profile.jpg"),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             leading: IconButton(
//               icon: SvgPicture.asset(Assets.drawerIcon_white),
//               onPressed: () {
//                 if (!notDrawerKey.currentState!.isDrawerOpen) {
//                   //check if drawer is closed
//                   notDrawerKey.currentState!.openDrawer(); //open drawer
//                 }
//               },
//             ),
//             actions: [
//               IconButton(
//                 padding: const EdgeInsetsDirectional.only(end: 9.11),
//                 onPressed: (() => {Get.to(() => NotificationView())}),
//                 icon: SvgPicture.asset(Assets.notification),
//               ),
//             ],
//             backgroundColor: Colors.black,
//             elevation: 0.0,
//           ),
//         ),
//         body: SingleChildScrollView(
//           child: Padding(
//             padding: const EdgeInsets.all(16.0),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.start,
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 const Text(
//                   "Please fill all Details",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 const SizedBox(
//                   height: 4,
//                 ),
//                 const Text(
//                   "Your profile help us to find best job for you",
//                   style: TextStyle(
//                     color: Color.fromARGB(255, 132, 131, 131),
//                     fontSize: 16,
//                   ),
//                 ),
//                 DropdownButton(
//                     focusColor: Colors.white,
//                     value: _chosenValue,
//                     //elevation: 5,
//                     style: TextStyle(color: Colors.white),
//                     iconEnabledColor: Colors.black,
//                     items: <String>[
//                       'Android',
//                       'IOS',
//                       'Flutter',
//                       'Node',
//                       'Java',
//                       'Python',
//                       'PHP',
//                     ].map<DropdownMenuItem<String>>((String value) {
//                       return DropdownMenuItem<String>(
//                         value: value,
//                         child: Text(
//                           value,
//                           style: TextStyle(color: Colors.black),
//                         ),
//                       );
//                     }).toList(),
//                     hint: Text(
//                       "Please choose a langauage",
//                       style: TextStyle(
//                           color: Colors.black,
//                           fontSize: 14,
//                           fontWeight: FontWeight.w500),
//                     ),
//                     onChanged: (value) {}),
//                 const Text(
//                   "Qualification ?*",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 const Text(
//                   "PMy School Medium Was ?*",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 const Text(
//                   "How i Speak English ?*",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 const Text(
//                   "I’m Fresher/Experience*",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//                 const Text(
//                   "My Age is*",
//                   style: TextStyle(
//                       color: Colors.black,
//                       fontSize: 18,
//                       fontWeight: FontWeight.w700),
//                 ),
//               ],
//             ),
//           ),
//         ));
//   }
// }
