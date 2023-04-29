import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/listpostjob/controller/post_job_controller.dart';
import 'package:ekinch/app/modules/listpostjob/views/widget/job_application_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:bottom_sheet/bottom_sheet.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/font_size.dart';
import '../../../generated/assets.dart';
import '../../../models/available_job_list.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class JobView extends StatefulWidget {
  List<Data> JobList;
  JobView({super.key, required this.JobList});

  @override
  State<JobView> createState() => _JobViewState();
}

class _JobViewState extends State<JobView> {
  TextEditingController _searchcontroller = TextEditingController();
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  final List<String> categoryList = [
    "Civil",
    "Hospital",
    "Light",
    "Wielding",
    "Plumber",
    "Building"
  ];

  @override
  Widget build(BuildContext context) {
    showFilter() {
      return showStickyFlexibleBottomSheet(
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(100), topRight: Radius.circular(100))),
        minHeight: 0,
        initHeight: 0.35,
        maxHeight: 1,
// isExpand: false,
        headerHeight: 30.sp,
        context: context,
        bottomSheetColor: Colors.transparent,
        headerBuilder: (BuildContext context, double offset) {
          return Container(
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(100),
                    topRight: Radius.circular(100))),
            // child:  Text(
            //             'Filter by',
            //             style: GoogleFonts.kadwa(
            //               fontSize: F18(),
            //               fontWeight: FontWeight.w700,
            //               color: Colors.black,
            //             ),
            //           ),
          );
        },
        // barrierColor: Colors.white,
        bodyBuilder: (BuildContext context, double offset) {
          return SliverChildListDelegate(
            <Widget>[
              Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                width: Get.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 30.0),
                      child: Text(
                        'Filter by',
                        style: GoogleFonts.kadwa(
                          fontSize: F22(),
                          fontWeight: FontWeight.w700,
                          color: Colors.black,
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: Divider(
                        color: Colors.grey,
                        height: 1.0,
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Select Category',
                            style: GoogleFonts.kadwa(
                              fontSize: F18(),
                              fontWeight: FontWeight.w700,
                              color: Colors.black,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 12.0),
                            child: DropdownButtonFormField2(
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.zero,
                                border: OutlineInputBorder(
                                  borderSide: const BorderSide(
                                      color: Color(0xFFCDCDCD)),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                              isExpanded: false,
                              hint: Text(
                                "Select Category",
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(18),
                                    color: const Color(0xFF636363)),
                              ),
                              icon: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Icon(
                                  Icons.keyboard_arrow_down,
                                  color: Colors.black45,
                                ),
                              ),
                              iconSize: 30,
                              buttonHeight: 60,
                              dropdownDecoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                              ),
                              items: categoryList
                                  .map((item) => DropdownMenuItem<String>(
                                        value: item,
                                        child: Text(
                                          item,
                                          style: GoogleFonts.kadwa(
                                              fontSize: getFontSize(18),
                                              color: const Color(0xFF636363)),
                                        ),
                                      ))
                                  .toList(),
                              validator: (value) {
                                if (value == null) {
                                  return 'Please Select Company';
                                }
                              },
                              onChanged: (value) {
                                // controller.companyType.text = value as String;
                                // controller.companytype.text = value as String;
                              },
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: Colors.white,
                                        border: Border.all(
                                            color: Colors.black, width: 1.0),
                                        borderRadius: BorderRadius.circular(6),
                                      ),
                                      child: Center(
                                        child: Text(
                                          'Cancel',
                                          style: GoogleFonts.kadwa(
                                            fontSize: F24(),
                                            fontWeight: FontWeight.w700,
                                            color: Colors.black,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 16.0),
                                    child: InkWell(
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: KColors.orange,
                                          border: Border.all(
                                              color: KColors.orange,
                                              width: 1.0),
                                          borderRadius:
                                              BorderRadius.circular(6),
                                        ),
                                        child: Center(
                                          child: Text(
                                            'Apply',
                                            style: GoogleFonts.kadwa(
                                              fontSize: F24(),
                                              fontWeight: FontWeight.w700,
                                              color: Colors.black,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ],
          );
        },
        anchors: [0, 0.5, 1],
      );
    }

    return Scaffold(
        bottomNavigationBar: BottomTabView(2),
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
            style:
                GoogleFonts.kadwa(fontSize: F20(), fontWeight: FontWeight.w700),
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
                  padding: const EdgeInsets.only(
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
                      InkWell(
                        onTap: () {
                          showFilter();
                        },
                        child: Container(
                          width: 50.sp,
                          height: 50.sp,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              border: Border.all(color: whitedark, width: 0.5)),
                          child: Padding(
                            padding: const EdgeInsets.all(15.0),
                            child: SvgPicture.asset(
                              "assets/images/shape.svg",
                            ),
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
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        // SizedBox(
                        //   height: 40.sp,
                        //   width: Get.width / 2.4,
                        //   child: Dropdownshort(
                        //     dropdownvalue: 'Full-time job',
                        //     items: [
                        //       'Full-time job',
                        //       'Part-time job',
                        //     ],
                        //   ),
                        // ),
                        InkWell(
                          onTap: () {},
                          child: SvgPicture.asset(
                            "assets/images/refresh.svg",
                            color: grey,
                          ),
                        )
                      ],
                    ),
                    Column(
                      children: (widget.JobList)
                          .map((e) => JobApplicationCard(
                                image: e.company!.photo.toString(),
                                title: e.title.toString(),
                                subtitle: e.location.toString(),
                                time: " ",
                                // qualification: e.jobDetails![0].qual.toString(),
                                experience:
                                    "{e.jobDetails![0].exp.toString()} years experience",
                                salary:
                                    "{e.jobDetails![0].slrStr.toString()}-{e.jobDetails![0].slrEnd.toString()}",
                                location: e.city.toString(),
                                // language: e.jobDetails![0].lngSpk.toString(),
                                views: " ",
                                jobInfo: e.description.toString(),
                                jobTime: e.jobTmg.toString(),
                                qualification: "hsd",
                                require: "shd",
                                language: "shd",
                                // require: e.jobDetails![0].mustSkill.toString(),
                                address: e.company!.address.toString(),
                                companyName: e.company!.name.toString(),
                                jobId: e.id.toString(),
                                // status: false,
                                status: e.applyStatus,
                              ))
                          .toList(),
                      // children: (widget.JobList)
                      //         .map((e) => JobApplicationCard(

                      //             ))
                      //         .toList(),
                    ),
                  ],
                ),
              ),
            ])));
  }
}
