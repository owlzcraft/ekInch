// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

Widget StatusWidget(String image, String name, String sentOn, String code,
    bool accepted, int points) {
  return Padding(
    padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10),
    child: Container(
      // decoration: const BoxDecoration(
      //     color: Colors.white,
      //     borderRadius: BorderRadius.all(Radius.circular(10))),
      // padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 15),
      // child: Row(
      //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //   children: [
      //     Row(
      //       crossAxisAlignment: CrossAxisAlignment.start,
      //       children: [
      //         Center(
      //           child: CircleAvatar(
      //             radius: 27,
      //             child: Image.asset(image),
      //           ),
      //         ),
      //         Padding(
      //           padding: const EdgeInsets.symmetric(horizontal: 20.0),
      //           child: Column(
      //             crossAxisAlignment: CrossAxisAlignment.start,
      //             children: [
      //               Text(name,
      //                   style: const TextStyle(
      //                       fontWeight: FontWeight.w700, fontSize: 18)),
      //               Text(
      //                 "Sent on $sentOn",
      //                 style: const TextStyle(
      //                     color: Color(0xFF6A6A6A),
      //                     fontSize: 13,
      //                     fontWeight: FontWeight.w400),
      //               ),
                    
      //             ],
      //           ),
      //         ),
      //       ],
      //     ),
      //     Column(
      //       children: [
      //         accepted
      //             ? Container(
      //                 padding:
      //                     const EdgeInsets.symmetric(vertical: 2, horizontal: 10),
      //                 decoration: BoxDecoration(
      //                     color: const Color(0xFF000B46),
      //                     borderRadius: BorderRadius.circular(5)),
      //                 child: Row(
      //                   children: [
      //                     Text(
      //                       "$points  ",
      //                       style: GoogleFonts.kadwa(
      //                           fontSize: 16,
      //                           fontWeight: FontWeight.w700,
      //                           color: Colors.white),
      //                     ),
      //                     Image.asset(
      //                       Assets.reward_icon,
      //                       scale: 1.5,
      //                     ),
      //                   ],
      //                 ))
      //             : Container(),
      //         SizedBox(
      //           height: getVerticalSize(20),
      //         ),
      //         accepted
      //             ? const Text(
      //                 "Accepted",
      //                 style: TextStyle(color: Colors.green),
      //               )
      //             : const Text(
      //                 "Waiting",
      //                 style: TextStyle(color: Color(0xFFDD4D4D)),
      //               )
      //       ],
      //     )
      //   ],
      // ),
    ),
  );
}
