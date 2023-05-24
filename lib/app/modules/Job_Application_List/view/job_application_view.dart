import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/widget/job_List.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/widget/request_list.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../../models/job_application.dart';
import '../../job/jobInterested/views/job_interested_view.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';
import '../controller/jobApplicationController.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobApplicationListView extends StatefulWidget {
  final String companyName;
  final String companyPhoto;
  final String companyAddress;
  List<Data> jobPostList;

  JobApplicationListView(
      {super.key,
      required this.companyAddress,
      required this.companyName,
      required this.jobPostList,
      required this.companyPhoto});

  @override
  JobApplicationListViewState createState() => JobApplicationListViewState();
}

class JobApplicationListViewState extends State<JobApplicationListView>
    with TickerProviderStateMixin {
  TabController? _tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  bool noData = false;
  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
    if (widget.jobPostList.isEmpty) {
      setState(() {
        widget.jobPostList = [];
        noData = true;
      });
    } else {
      setState(() {
        noData = false;
      });
    }
  }

  JobPostListController controller = Get.put(JobPostListController());
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        key: scaffoldKey,
        drawer: const SettingsView(),
        appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.black,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openDrawer();
              }
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
            preferredSize: const Size.fromHeight(120),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 16.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: getHorizontalSize(85),
                        height: getVerticalSize(40),
                        decoration: BoxDecoration(
                            color: Colors.black,
                            image: DecorationImage(
                                fit: BoxFit.cover,
                                image: NetworkImage(widget.companyPhoto))),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 10.0),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(widget.companyName,
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
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 3.0),
                                  child: Text(
                                    widget.companyAddress,
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: TabBar(
                    controller: _tabController,
                    indicatorColor: yellow,
                    indicatorWeight: 3,
                    unselectedLabelStyle: GoogleFonts.kadwa(fontSize: F18()),
                    labelStyle: GoogleFonts.kadwa(fontSize: F18()),
                    tabs: [
                      Tab(text: AppLocalizations.of(context)!.jobs),
                      Tab(text: AppLocalizations.of(context)!.acceptedRequest)
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: InkWell(
          onTap: () {
            Get.to(const JobInterestedView());
          },
          child: CircleAvatar(
            radius: 25.sp,
            backgroundColor: KColors.orange,
            child: Image.asset(
              "assets/images/job.png",
              color: Colors.black,
              scale: 3.0,
            ),
          ),
        ),
        bottomNavigationBar: const BottomTabView(2),
        backgroundColor: KColors.greybg,
        body: TabBarView(
          controller: _tabController,
          children: [
            JobsApplicationList(
              noData: noData,
              jobPostList: widget.jobPostList,
              companyPhoto: widget.companyPhoto,
              companyName: widget.companyName,
            ),
            RequestList(noData: noData),
          ],
        ),
      ),
    );
  }
}
