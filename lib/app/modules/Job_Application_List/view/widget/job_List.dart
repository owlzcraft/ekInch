import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/widget/job_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../listpostjob/views/widget/job_application_card.dart';
import '../../../myJobs/view/widget/job_applied_card.dart';
import '../../../postjob/widgets/shortDropDown.dart';

class JobsApplicationList extends StatelessWidget {
  bool noData;
  JobsApplicationList({super.key, required this.noData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: TextFeildGreyBorder(
          // controller: _searchcontroller,
          hintText: 'Search company by name',
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Applications",
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
                      "No Jobs Applied",
                      style: GoogleFonts.kadwa(
                          fontSize: F18(), color: Colors.grey),
                    )),
                  )
                ]
              : [
                  JobApplicationRequestCard(
                      "assets/images/ultra1.png",
                      "Plumber Engineer",
                      "UltraTech Cement, India",
                      "2 days ago",
                      "10th Pass",
                      "2 years experience",
                      "1800-2500/month",
                      "Roorkee",
                      "Good speak hindi ",
                      "78 already applied",
                      false),
                  JobApplicationRequestCard(
                      "assets/images/ultra1.png",
                      "Plumber Engineer",
                      "UltraTech Cement, India",
                      "2 days ago",
                      "10th Pass",
                      "2 years experience",
                      "1800-2500/month",
                      "Roorkee",
                      "Good speak hindi ",
                      "78 already applied",
                      true),
                  JobApplicationRequestCard(
                      "assets/images/ultra1.png",
                      "Plumber Engineer",
                      "UltraTech Cement, India",
                      "2 days ago",
                      "10th Pass",
                      "2 years experience",
                      "1800-2500/month",
                      "Roorkee",
                      "Good speak hindi ",
                      "78 already applied",
                      false),
                ],
        ),
      ),
    ]));
  }
}
