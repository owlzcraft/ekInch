import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../models/job_applied_list.dart';
import '../../../listpostjob/views/widget/job_application_card.dart';
import '../../../postjob/widgets/shortDropDown.dart';
import 'job_applied_card.dart';

class JobsApplied extends StatelessWidget {
  bool noData;
  List<Data> JobAppliedList;
  JobsApplied({super.key, required this.noData, required this.JobAppliedList});

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
          // child: Column(
          //   children: noData
          //       ?
          //           Padding(
          //             padding: const EdgeInsets.symmetric(vertical: 60.0),
          //             child: Center(
          //                 child: Text(
          //               "No Jobs Applied",
          //               style: GoogleFonts.kadwa(
          //                   fontSize: F18(), color: Colors.grey),
          //             )),
          //           )

          // :
          child: Column(
              children: (JobAppliedList)
                  .map((e) => JobAppliedCard(
                      experience: e.job!.jobDetails[0].exp.toString(),
                      image: e.job!.company.photo.toString(),
                      language: e.job!.jobDetails[0].lngSpk.toString(),
                      location: e.job!.company.address.toString(),
                      qualification: e.job!.jobDetails[0].qual.toString(),
                      salary: "${e.job!.jobDetails[0].slrStr.toString()}",
                      subtitle: "",
                      time: "",
                      title: e.job!.title.toString(),
                      views: "already applied"))
                  .toList()))
    ]));
  }
}
