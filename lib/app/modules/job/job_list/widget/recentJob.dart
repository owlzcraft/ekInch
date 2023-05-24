// ignore_for_file: file_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:google_fonts/google_fonts.dart';

class RecentJob extends StatefulWidget {
  const RecentJob({Key? key}) : super(key: key);

  @override
  RecentJobState createState() => RecentJobState();
}

class RecentJobState extends State<RecentJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Center(
              child: Text(
            AppLocalizations.of(context)!.recentJobs,
            style: GoogleFonts.kadwa(fontSize: F20(), color: Colors.grey),
          ))
        ],
      ),
    ));
  }
}
