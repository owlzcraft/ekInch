// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';

// import '../../../../../widgets/math_utils.dart';
// import '../../../../custom_widget/color.dart';
// import '../../../../generated/assets.dart';

// Widget CustomTapBar(void  onTap,String title, bool variable) {
//   return Column(children :[InkWell(
//                 onTap: onTap,
//                 child: Container(
//                   width: getHorizontalSize(396),
//                   height: getVerticalSize(50),
//                   decoration: BoxDecoration(
//                       color: KColors.greybg,
//                       borderRadius: BorderRadius.circular(6)),
//                   child: Padding(
//                     padding: const EdgeInsets.only(left: 14.9, right: 14.9),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       // ignore: prefer_const_literals_to_create_immutables
//                       children: [
//                          Text(
//                           title,
//                           style: TextStyle(
//                               color: Colors.black,
//                               fontFamily: "Kadwa",
//                               fontWeight: FontWeight.bold,
//                               fontSize: 18),
//                         ),
//                         const Icon(Icons.arrow_drop_down_sharp, size: 30),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//               Padding(
//                 padding: const EdgeInsets.only(left: 16.0),
//                 child: Visibility(
//                   visible: variable,
//                   child: Column(
//                       mainAxisAlignment: MainAxisAlignment.start,
//                       crossAxisAlignment: CrossAxisAlignment.center,
//                       children: [
//                         Container(
//                           width: getHorizontalSize(420),
//                           height: getVerticalSize(100),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: getHorizontalSize(74),
//                                 height: getVerticalSize(74),
//                                 decoration: const BoxDecoration(
//                                     color: KColors.greybg,
//                                     shape: BoxShape.rectangle),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text(
//                                       "Light work part 1",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     const Text(
//                                       "Electrician ",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.black,
//                                       ),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                           Icons.remove_red_eye_outlined,
//                                           size: 18,
//                                           color: Colors.grey,
//                                         ),
//                                         const Text(
//                                           "429",
//                                           style: TextStyle(
//                                               fontSize: 14, color: Colors.grey),
//                                         ),
//                                         SvgPicture.asset(Assets.watch,
//                                             color: Colors.grey),
//                                         const Text(
//                                           "00 Min 20 Sec",
//                                           style: TextStyle(
//                                               fontSize: 14, color: Colors.grey),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Icon(Icons.check_circle_outline)
//                             ],
//                           ),
//                         ),
//                         Container(
//                           width: getHorizontalSize(420),
//                           height: getVerticalSize(100),
//                           child: Row(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             children: [
//                               Container(
//                                 width: getHorizontalSize(74),
//                                 height: getVerticalSize(74),
//                                 decoration: const BoxDecoration(
//                                     color: KColors.greybg,
//                                     shape: BoxShape.rectangle),
//                               ),
//                               Padding(
//                                 padding: const EdgeInsets.all(16.0),
//                                 child: Column(
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceEvenly,
//                                   crossAxisAlignment: CrossAxisAlignment.start,
//                                   children: [
//                                     const Text(
//                                       "Light work part 1",
//                                       style: TextStyle(
//                                           fontSize: 16,
//                                           color: Colors.black,
//                                           fontWeight: FontWeight.w600),
//                                     ),
//                                     const Text(
//                                       "Electrician ",
//                                       style: TextStyle(
//                                         fontSize: 12,
//                                         color: Colors.black,
//                                       ),
//                                       textAlign: TextAlign.start,
//                                     ),
//                                     Row(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceAround,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: [
//                                         const Icon(
//                                           Icons.remove_red_eye_outlined,
//                                           size: 18,
//                                           color: Colors.grey,
//                                         ),
//                                         const Text(
//                                           "429",
//                                           style: TextStyle(
//                                               fontSize: 14, color: Colors.grey),
//                                         ),
//                                         SvgPicture.asset(Assets.watch,
//                                             color: Colors.grey),
//                                         const Text(
//                                           "00 Min 20 Sec",
//                                           style: TextStyle(
//                                               fontSize: 14, color: Colors.grey),
//                                         ),
//                                       ],
//                                     )
//                                   ],
//                                 ),
//                               ),
//                               const Icon(Icons.check_circle_outline)
//                             ],
//                           ),
//                         ),
//                       ]),
//                 ),
//               ),]);
// }