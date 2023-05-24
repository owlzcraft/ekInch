import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../postjob/widgets/shortDropDown.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class RecentJobs extends StatelessWidget {
  const RecentJobs({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding:
            const EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 5,
              child: TextFeildGreyBorder(
                // controller: _searchcontroller,
                hintText: AppLocalizations.of(context)!.searchjobbyname,
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
                      color: const Color.fromARGB(255, 81, 80, 80),
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
          AppLocalizations.of(context)!.alljobList,
          style: GoogleFonts.kadwa(fontSize: F18()),
        ),
      ),
      const Padding(
        padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 2.0),
        child: Column(
          children: [
            //   JobApplicationCard(
            //       "assets/images/ultra1.png",
            //       "Plumber Engineer",
            //       "UltraTech Cement, India",
            //       "2 days ago",
            //       "10th Pass",
            //       "2 years experience",
            //       "1800-2500/month",
            //       "Roorkee",
            //       "Good speak hindi ",
            //       "78 already applied"),
            //  JobApplicationCard(
            //       "assets/images/ultra1.png",
            //       "Plumber Engineer",
            //       "EKINCH Cement, India",
            //       "2 days ago",
            //       "10th Pass",
            //       "2 years experience",
            //       "1800-2500/month",
            //       "Roorkee",
            //       "Good speak hindi ",
            //       "78 already applied"),JobApplicationCard(
            //       "assets/images/ultra1.png",
            //       "Plumber Engineer",
            //       "UltraTech Cement, India",
            //       "2 days ago",
            //       "10th Pass",
            //       "2 years experience",
            //       "1800-2500/month",
            //       "Roorkee",
            //       "Good speak hindi ",
            //       "78 already applied"),JobApplicationCard(
            //       "assets/images/ultra1.png",
            //       "Plumber Engineer",
            //       "UltraTech Cement, India",
            //       "2 days ago",
            //       "10th Pass",
            //       "2 years experience",
            //       "1800-2500/month",
            //       "Roorkee",
            //       "Good speak hindi ",
            //       "78 already applied"),
          ],
        ),
      ),
    ]));
  }
}
