import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/models/job_application.dart';
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
  String companyPhoto;
  List<Data> jobPostList;
  JobsApplicationList(
      {super.key,
      required this.noData,
      required this.jobPostList,
      required this.companyPhoto});

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
        child: noData
            ? Padding(
                padding: const EdgeInsets.symmetric(vertical: 60.0),
                child: Center(
                    child: Text(
                  "No Jobs Posted",
                  style: GoogleFonts.kadwa(fontSize: F18(), color: Colors.grey),
                )),
              )
            : Column(
                children: (jobPostList)
                    .map((e) => JobApplicationRequestCard(
                        experience: "${e.jobDetails![0].exp.toString()} years experience",
                        image: companyPhoto.toString(),
                        language: e.jobDetails![0].lngSpk.toString(),
                        location: e.location.toString(),
                        open: e.active as bool,
                        qualification: e.jobDetails![0].qual.toString(),
                        salary:
                            "${e.jobDetails![0].slrStr.toString()}-${e.jobDetails![0].slrEnd.toString()}",
                        subtitle: e.city.toString(),
                        time: "",
                        title: e.title.toString(),
                        views: "${e.appiledCnt.toString()} Job Request"))
                    .toList(),
              ),
      ),
    ]));
  }
}
