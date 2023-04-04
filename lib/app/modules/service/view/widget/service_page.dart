import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/font_size.dart';
import '../../../dashboard/widgets/services_news.widget.dart';
import 'other_service_card.dart';

class ServicePage extends StatelessWidget {
  const ServicePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: EdgeInsets.only(
                      top: 10.0.sp, left: 16.0.sp, right: 10.0.sp),
                  child: Text(
                    'All Services',
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w400, fontSize: F16()),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  padding: const EdgeInsets.symmetric(horizontal:12.0),
                  crossAxisSpacing: 2.0,
                  crossAxisCount: 2,
                  children: <Widget>[
                    servicesAndNews(
                      "Cement Material\nLaunch Online",
                      "Easily make your profile\nand get jobs",
                      false,
                      "assets/images/snnews1.png",
                      "22 Oct, 2022",
                      "12:00 PM",
                    ),
                    servicesAndNews(
                      "Find the perfect\nJobs",
                      "Easily make your profile\nand get jobs",
                      false,
                      "assets/images/snnews2.png",
                      "",
                      "",
                    ),
                    servicesAndNews(
                      "Find the perfect\nJobs",
                      "Easily make your profile\nand get jobs",
                      false,
                      "assets/images/snnews2.png",
                      "",
                      "",
                    ),
                    servicesAndNews(
                      "Find the perfect\nJobs",
                      "Easily make your profile\nand get jobs",
                      false,
                      "assets/images/snnews2.png",
                      "",
                      "",
                    ),
                    servicesAndNews(
                      "Find the perfect\nJobs",
                      "Easily make your profile\nand get jobs",
                      false,
                      "assets/images/snnews2.png",
                      "",
                      "",
                    ),
                    servicesAndNews(
                      "Find the perfect\nJobs",
                      "Easily make your profile\nand get jobs",
                      false,
                      "assets/images/snnews2.png",
                      "",
                      "",
                    ),
                  ],
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                Padding(
                  padding: EdgeInsets.only(
                       left: 16.0.sp, right: 10.0.sp),
                  child: Text(
                    'Other Services',
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w400, fontSize: F16()),
                  ),
                ),
              ],
            ),
          ),
          SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  padding: EdgeInsets.symmetric(horizontal: 12.sp),
                  child: Row(
                    children: [
                      OtherServicesCard(
                        "Find the perfect Jobs",
                        "Easily make your profile\nand get jobs",
                        "assets/images/snnews2.png",
                      ),
                      OtherServicesCard(
                        "Find the perfect Jobs",
                        "Easily make your profile\nand get jobs",
                        "assets/images/snnews2.png",
                      ),
                      OtherServicesCard(
                        "Find the perfect Jobs",
                        "Easily make your profile\nand get jobs",
                        "assets/images/snnews2.png",
                      ),
                      OtherServicesCard(
                        "Find the perfect Jobs",
                        "Easily make your profile\nand get jobs",
                        "assets/images/snnews2.png",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
           SliverList(
            delegate: SliverChildListDelegate.fixed(
              [
                SizedBox(height: getVerticalSize(40),)
              ],
            ),
          ),
        ],
      ),
    );
  }
}
