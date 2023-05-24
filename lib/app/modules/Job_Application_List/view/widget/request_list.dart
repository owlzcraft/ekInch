import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RequestList extends StatelessWidget {
  final bool noData;
  const RequestList({super.key, required this.noData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 16.0, right: 16.0, top: 8.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.jobApplicationsRequest,
              style: GoogleFonts.kadwa(fontSize: F16()),
            ),
            InkWell(
              onTap: () {},
              child: SvgPicture.asset(
                "assets/images/refresh.svg",
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: Column(
          children: noData
              ? [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 60.0),
                    child: Center(
                        child: Text(
                      AppLocalizations.of(context)!.noJobsApplied,
                      style: GoogleFonts.kadwa(
                          fontSize: F18(), color: Colors.grey),
                    )),
                  )
                ]
              : [
                  // JobApplicationRequestCard(
                  //     "assets/images/ultra1.png",
                  //     "Plumber Engineer",
                  //     "UltraTech Cement, India",
                  //     "2 days ago",
                  //     "10th Pass",
                  //     "2 years experience",
                  //     "1800-2500/month",
                  //     "Roorkee",
                  //     "Good speak hindi ",
                  //     "78 already applied",
                  //     false),
                  // JobApplicationRequestCard(
                  //     "assets/images/ultra1.png",
                  //     "Plumber Engineer",
                  //     "UltraTech Cement, India",
                  //     "2 days ago",
                  //     "10th Pass",
                  //     "2 years experience",
                  //     "1800-2500/month",
                  //     "Roorkee",
                  //     "Good speak hindi ",
                  //     "78 already applied",
                  //     true),
                  // JobApplicationRequestCard(
                  //     "assets/images/ultra1.png",
                  //     "Plumber Engineer",
                  //     "UltraTech Cement, India",
                  //     "2 days ago",
                  //     "10th Pass",
                  //     "2 years experience",
                  //     "1800-2500/month",
                  //     "Roorkee",
                  //     "Good speak hindi ",
                  //     "78 already applied",
                  //     false),
                ],
        ),
      ),
    ]));
  }
}
