// ignore_for_file: file_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/referNearn/controllers/refer_nearn_controller.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class StatusScreen extends StatefulWidget {
  const StatusScreen({super.key});

  @override
  State<StatusScreen> createState() => _StatusScreenState();
}

class _StatusScreenState extends State<StatusScreen> {
  ReferNearnController controller = Get.put(ReferNearnController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        height: Get.width,
        color: Colors.white,
        child: Center(
          child: Text(
AppLocalizations.of(context)!.noData,
            style: GoogleFonts.kadwa(fontSize: F20(), color: Colors.grey),
          ),
        ),
        // child: Column(
        //   children: [
        //     Padding(
        //       padding:
        //           const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
        //       child: TextFeildWhite(
        //         controller: _searchcontroller,
        //         hintText: 'Job, location and other',
        //       ),
        //     ),
        //     Column(
        //       children: controller.statusData
        //           .map((e) => StatusWidget(
        //               e['image'].toString(),
        //               e['name'].toString(),
        //               e['sentOn'].toString(),
        //               e['code'].toString(),
        //               e['accepted'] == "true" ? true : false,
        //               int.parse(e['points'].toString())))
        //           .toList(),
        //     )
        //   ],
        // ),
      ),
    );
  }
}
