// ignore_for_file: file_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/models/job_application.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/widget/job_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../postjob/widgets/shortDropDown.dart';
import '../../controller/jobApplicationController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobsApplicationList extends StatelessWidget {
  final bool noData;
  final String companyName;
  final String companyPhoto;
  final List<Data> jobPostList;
  final JobPostListController jobpostcontroller=Get.put(JobPostListController());
  JobsApplicationList(
      {super.key,
      required this.companyName,
      required this.noData,
      required this.jobPostList,
      required this.companyPhoto});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 10),
        child: TextFeildGreyBorder(
          // controller: _searchcontroller,
          hintText: AppLocalizations.of(context)!.searchjobbyname,
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              AppLocalizations.of(context)!.applications,
              style: GoogleFonts.kadwa(fontSize: F16()),
            ),
            InkWell(
              onTap: () {          jobpostcontroller.CompanyDataStatus();
},
              child: SvgPicture.asset(
                "assets/images/refresh.svg",
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: (jobPostList.isEmpty||jobPostList[0].jobDetails!.isEmpty)
                        ? Center(
                            child: Text(
                              "0 ${AppLocalizations.of(context)!.jobsApplied}",
                              style: GoogleFonts.kadwa(
                                  fontSize: F24(), color: Colors.grey),
                            ),
                          )
                         
            : Column(
                children: (jobPostList)
                    .map((e) => JobApplicationRequestCard(
                      jobId:e.id as int,
                        experience: "${e.jobDetails![0].exp.toString()} ${AppLocalizations.of(context)!.yearsExperience}",
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
                        views: "${e.appiledCnt.toString()} ${AppLocalizations.of(context)!.jobRequest}", companyName: companyName))
                    .toList(),
              ),
      ),
    ]));
  }
}
