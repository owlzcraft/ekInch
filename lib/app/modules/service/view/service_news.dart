import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/listpostjob/views/widget/key_value.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/listpostjob/views/review.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../../utils/localStorage.dart';
import '../../notication/view/notification_view.dart';
import '../../profile/views/profile_view.dart';
import '../../settings/views/settings_view.dart';

class ServiceAndNews extends StatefulWidget {
  ServiceAndNews({
    super.key,
  });

  @override
  ServiceAndNewsState createState() => ServiceAndNewsState();
}

class ServiceAndNewsState extends State<ServiceAndNews>
    with TickerProviderStateMixin {
  TabController? _tabController;
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void initState() {
    _tabController = new TabController(length: 2, vsync: this);
    super.initState();
  }

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
                //check if drawer is closed
                scaffoldKey.currentState!.openDrawer(); //open drawer
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
            preferredSize: Size.fromHeight(100),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 4.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                              "${LocalStorage.shared.getUserData()!.userData?.firstName}",
                              style: GoogleFonts.kadwa(
                                  fontSize: F28(),
                                  color: Colors.white,
                                  height: 1.2,
                                  fontWeight: FontWeight.bold)),
                          Text(
                            "${LocalStorage.shared.getUserData()?.userData?.profession}",
                            style: GoogleFonts.kadwa(
                                height: 1.7,
                                fontSize: F20(),
                                color: const Color(0xffE0E0E0)),
                          ),
                        ],
                      ),
                      InkWell(
                          onTap: () => {Get.to(ProfileView())},
                          child: CircleAvatar(
                            radius: 25,
                            backgroundColor: Color(0xFFE0E0E0),
                            child: Container(
                              height: 60.sp,
                              width: 60.sp,
                              decoration: BoxDecoration(
                                color: Colors.black,
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: LocalStorage.shared.getProfile() ==
                                            "https://d3nypwrzdy6f4k.cloudfront.net/"
                                        ? AssetImage(
                                            'assets/images/profile_icon.png')
                                        : NetworkImage(
                                                "${LocalStorage.shared.getProfile()}")
                                            as ImageProvider),
                                border: Border.all(
                                    color: KColors.greyLine, width: 2.0),
                              ),
                            ),
                          )),
                    ],
                  ),
                ),
                TabBar(
                  controller: _tabController,
                  indicatorColor: yellow,
                  indicatorWeight: 3,
                  unselectedLabelStyle: GoogleFonts.kadwa(fontSize: F18()),
                  labelStyle: GoogleFonts.kadwa(fontSize: F18()),
                  tabs: [Tab(text: "Services"), Tab(text: "News")],
                ),
              ],
            ),
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [],
                ),
              ),
            ),
            Review()
          ],
        ),
      ),
    );
  }
}
