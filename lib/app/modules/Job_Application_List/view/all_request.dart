import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/widget/approve_deny.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class AllApplicationListView extends StatefulWidget {
  final String company;
  final String title;
  final String location;
  final String salary;
  final String qualification;
  final String language;
  final String experience;
  final String time;
  AllApplicationListView({
    super.key,
    required this.company,
    required this.title,
    required this.location,
    required this.salary,
    required this.qualification,
    required this.language,
    required this.experience,
    required this.time,
  });

  @override
  AllApplicationListViewState createState() => AllApplicationListViewState();
}

class AllApplicationListViewState extends State<AllApplicationListView>
    with TickerProviderStateMixin {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SettingsView(),
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: Colors.black,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Get.back();
          },
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
                onPressed: (() => {Get.to(() => NotificationView())}),
                icon: SvgPicture.asset(Assets.notification_white)),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(60),
          child: Padding(
            padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Container(
                  width: getHorizontalSize(85),
                  height: getVerticalSize(40),
                  decoration: const BoxDecoration(
                      color: Colors.black,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/ultra1.png"))),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("UltraTech Cement",
                          style: GoogleFonts.kadwa(
                              fontSize: F24(),
                              color: Colors.white,
                              height: 1.3,
                              fontWeight: FontWeight.bold)),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          SvgPicture.asset(
                            'assets/icons/aloc.svg',
                            color: Colors.white,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 3.0),
                            child: Text(
                              "Roorkee Uttarakhand",
                              style: GoogleFonts.kadwa(
                                  height: 1.2,
                                  fontSize: F14(),
                                  color: const Color(0xffE0E0E0)),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: CircleAvatar(
        radius: 25.sp,
        backgroundColor: KColors.orange,
        child: Image.asset(
          "assets/images/job.png",
          color: Colors.black,
          scale: 3.0,
        ),
      ),
      bottomNavigationBar: BottomTabView(2),
      backgroundColor: KColors.greybg,
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 13.0, vertical: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Text(
                          widget.title,
                          style: GoogleFonts.kadwa(
                              height: 1.2,
                              fontSize: F18(),
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 2.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SvgPicture.asset(
                              'assets/images/location.svg',
                              alignment: Alignment.topLeft,
                              matchTextDirection: true,
                            ),
                            Text(
                              widget.location,
                              style: GoogleFonts.kadwa(
                                  fontSize: F14(),
                                  color: KColors.textGrey,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8.0, horizontal: 4.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding:
                                      EdgeInsets.only(left: 2.sp, right: 10.0),
                                  child: SvgPicture.asset(
                                      'assets/images/money.svg'),
                                ),
                                Text(
                                  widget.salary,
                                  style: GoogleFonts.kadwa(
                                      fontSize: F14(),
                                      color: KColors.textGrey,
                                      fontWeight: FontWeight.w400),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      left: 12.0, right: 8.0),
                                  child: SvgPicture.asset(
                                    'assets/images/seak.svg',
                                    alignment: Alignment.centerLeft,
                                  ),
                                ),
                                Text(
                                  widget.language,
                                  style: GoogleFonts.kadwa(
                                      fontSize: F14(),
                                      color: KColors.textGrey,
                                      fontWeight: FontWeight.w400),
                                ),
                              ],
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(vertical: 2.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SvgPicture.asset('assets/images/grad.svg'),
                                  Padding(
                                    padding: const EdgeInsets.only(
                                        right: 2.0, left: 5.0),
                                    child: Text(
                                      widget.qualification,
                                      style: GoogleFonts.kadwa(
                                          fontSize: F14(),
                                          color: KColors.textGrey,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                  Text(
                                    ' - ',
                                    style: GoogleFonts.kadwa(
                                        fontSize: F14(),
                                        color: KColors.textGrey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                  Text(
                                    widget.experience,
                                    style: GoogleFonts.kadwa(
                                        fontSize: F14(),
                                        color: KColors.textGrey,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "All Request",
                              style: GoogleFonts.kadwa(
                                  fontSize: F18(),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                            Text(
                              "Accepted (4)",
                              style: GoogleFonts.kadwa(
                                  fontSize: F14(),
                                  color: Colors.black,
                                  fontWeight: FontWeight.w700),
                            ),
                          ],
                        ),
                      ),
                      const Divider(
                        color: KColors.lightGrey,
                        thickness: 1.5,
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                top: 12.sp,
                right: 16.sp,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    SvgPicture.asset(
                      Assets.share_black,
                      color: KColors.textGrey,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        widget.time,
                        style: GoogleFonts.kadwa(
                            fontSize: F12(),
                            color: KColors.textGrey,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                ApproveDenyCard(
                    "", "Naveen Kumar", "Plumber", "2 Years Experience"),
                ApproveDenyCard(
                    "", "Naveen Kumar", "Plumber", "2 Years Experience"),
                ApproveDenyCard(
                    "", "Naveen Kumar", "Plumber", "2 Years Experience"),
                ApproveDenyCard(
                    "", "Naveen Kumar", "Plumber", "2 Years Experience"),
                ApproveDenyCard(
                    "", "Naveen Kumar", "Plumber", "2 Years Experience")
              ],
            ),
          )
        ],
      ),
    );
  }
}
