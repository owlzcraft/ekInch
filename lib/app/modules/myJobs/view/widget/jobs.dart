import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../listpostjob/views/widget/job_application_card.dart';
import '../../../postjob/widgets/shortDropDown.dart';
import 'job_applied_card.dart';

class JobsApplied extends StatelessWidget {
  bool noData;
  JobsApplied({super.key,required this.noData});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: TextFeildGreyBorder(
                // controller: _searchcontroller,
                hintText: 'Search company by name',
              ),
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 16.0),
                child: Container(
                  width: 40.sp,
                  height: 40.sp,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      border: Border.all(color: Colors.black, width: 0.5)),
                  child: Center(
                    child: SvgPicture.asset(
                      "assets/images/shape.svg",
                      color: Color.fromARGB(255, 81, 80, 80),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Text(
          "All Jobs List",
          style: GoogleFonts.kadwa(fontSize: F18()),
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: 
        
        Column(
          children: 
          noData?[Padding(
            padding: const EdgeInsets.symmetric(vertical:60.0),
            child: Center(child: Text("No Jobs Applied",style: GoogleFonts.kadwa(fontSize: F18(),color: Colors.grey),)),
          )]:
          [
            JobAppliedCard(
                "assets/images/ultra1.png",
                "Plumber Engineer",
                "UltraTech Cement, India",
                "2 days ago",
                "10th Pass",
                "2 years experience",
                "1800-2500/month",
                "Roorkee",
                "Good speak hindi ",
                "78 already applied"),
            JobAppliedCard(
                "assets/images/ultra1.png",
                "Plumber Engineer",
                "UltraTech Cement, India",
                "30 days ago",
                "10th Pass",
                "2 years experience",
                "1800-2500/month",
                "Roorkee",
                "Good speak hindi ",
                "10 already applied"),
            JobAppliedCard(
                "assets/images/ultra1.png",
                "Plumber Engineer",
                "UltraTech Cement, India",
                "2 days ago",
                "10th Pass",
                "2 years experience",
                "1800-2500/month",
                "Roorkee",
                "Good speak hindi ",
                "78 already applied"),
          ],
        ),
      ),
    ]));
  }
}
