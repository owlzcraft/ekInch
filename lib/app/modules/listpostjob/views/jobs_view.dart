import 'package:ekinch/app/modules/listpostjob/views/widget/job_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../custom_widget/font_size.dart';
import '../../../generated/assets.dart';
import '../../../models/available_job_list.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class JobView extends StatefulWidget {
  List <Data>JobList;
  JobView({super.key, required this.JobList});

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  TextEditingController _searchcontroller = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        drawer: const SettingsView(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          centerTitle: true,
          elevation: 0,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!scaffoldKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                scaffoldKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
          title: Text(
            'Job Applications',
            style: TextStyle(
                fontSize: F18(),
                fontFamily: 'Kadwa',
                fontWeight: FontWeight.w700),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.only(right: 8.0),
              child: IconButton(
                  onPressed: (() => {Get.to(() => NotificationView())}),
                  icon: SvgPicture.asset(Assets.notification_white)),
            ),
            // SizedBox(
            //   width: MediaQuery.of(context).size.width * 0.03,
            // )
          ],
        ),
        body: SingleChildScrollView(
            child: Column(
                //crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                height: 100,
                color: black,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 15.0, right: 15, top: 10, bottom: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      SizedBox(
                        height: 50,
                        width: Get.width / 1.4,
                        child: TextFeildWhite(
                          controller: _searchcontroller,
                          hintText: 'Job, location and other',
                        ),
                      ),
                      Container(
                        width: 50.sp,
                        height: 50.sp,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            border: Border.all(color: whitedark, width: 0.5)),
                        child: Padding(
                          padding: EdgeInsets.all(15.0),
                          child: SvgPicture.asset(
                            "assets/images/shape.svg",
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(
                          height: 40.sp,
                          width: Get.width / 2.4,
                          child: Dropdownshort(
                            dropdownvalue: 'Full-time job',
                            items: [
                              'Full-time job',
                              'Part-time job',
                            ],
                          ),
                        ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/refresh.svg",
                            color: grey,
                          ),
                        )
                      ],
                    ),
                    // Column(
                    //   children: (widget.JobList).map((e) => JobApplicationCard(
                    //       image: e.company.photo,
                    //       title:e.title,
                    //       subtitle:e.description,
                    //       time:"2 days",
                    //       qualification:e.jobDetails[0].qual,
                    //       experience:e.jobDetails[0].exp,
                    //       salary:e.jobDetails[0].slrStr,
                    //       location:e.city,
                    //       language:e.jobDetails[0].lngSpk,
                    //       views:"200")).toList(),
                    //   // children: (widget.JobList)
                    //   //         .map((e) => JobApplicationCard(

                    //   //             ))
                    //   //         .toList(),
                    // ),
                    JobApplicationCard(
                        "assets/images/ultra1.png",
                        "Plumber Engineer",
                        "UltraTech Cement, India",
                        "2 days ago",
                        "10th Pass",
                        "2 years experience",
                        "1800-2500/month",
                        "Roorkee",
                        "Good speak hindi ",
                        "200 views"),
                    JobApplicationCard(
                        "assets/images/ultra1.png",
                        "Carpenter Engineer",
                        "UltraTech Cement, India",
                        "1 days ago",
                        "12th Pass",
                        "4 years experience",
                        "18000-25000/month",
                        "Roorkee",
                        "Good speak hindi & English ",
                        "700 views"),
                    JobApplicationCard(
                        "assets/images/ultra1.png",
                        "Electrician Engineer",
                        "UltraTech Cement, India",
                        "10 days ago",
                        "12th Pass",
                        "3 years experience",
                        "18000-25000/month",
                        "Haridwar",
                        "Good speak hindi & English ",
                        "750 views"),
                  ],
                ),
              ),
            ])));
  }
}
