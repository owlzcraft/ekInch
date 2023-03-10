import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ekinch/app/custom_widget/dash_header.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottom_bar.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/dashboard/widgets/services_news.widget.dart';
import 'package:ekinch/app/modules/language/views/language_view.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:ekinch/app/modules/dashboard/widgets/awards.widgets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/categoryPill.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/recentlyAdded.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/video.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/videoCategory.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/work.widget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  const DashboardView({
    super.key,
  });

  @override
  State<DashboardView> createState() => _DashboardStateView();
}

class _DashboardStateView extends State<DashboardView>
    with SingleTickerProviderStateMixin {
  DashboardController controller = Get.put(DashboardController());
  late TabController _tabController;
  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    var videoCategoryData = [
      {"image": "assets/images/civil.png", "title": "Civil", "videos": "6"},
      {
        "image": "assets/images/hospital.png",
        "title": "Hospital",
        "videos": "10"
      },
      {"image": "assets/images/light.png", "title": "Light", "videos": "5"},
      {"image": "assets/images/welding.png", "title": "Welding", "videos": "7"},
      {"image": "assets/images/plumber.png", "title": "Plumber", "videos": "4"},
      {"image": "assets/images/civil.png", "title": "Civil", "videos": "6"},
    ];
    var cat_pill_data = [
      {"name": "Civil", "active": true},
      {"name": "Plumber", "active": false},
      {"name": "Electrician", "active": false},
      {"name": "Plumber", "active": false},
    ];
    return Scaffold(
      key: scaffoldKey,
      bottomNavigationBar: BottomTabView(0),
      // bottomNavigationBar: BottomBar(),
      drawer: const SettingsView(),
      appBar: DynamicAppBar("${LocalStorage.shared.getUserData()?.userData?.firstName}", "Welcome !", true, scaffoldKey),
      body: Container(
        color: Colors.white,
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: EdgeInsets.only(
                    top: 10.0.sp, left: 10.0.sp, right: 10.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Short Videos',
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      'View all >',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding:
                    EdgeInsets.only(bottom: 10.sp, left: 10.sp, right: 10.sp),
                child: Row(
                  children: [
                    Video(image: 'assets/images/sample_thumb.jpg'),
                    Video(image: 'assets/images/sample_thumb.jpg'),
                    Video(image: 'assets/images/sample_thumb.jpg'),
                    Video(image: 'assets/images/sample_thumb.jpg'),
                    Video(image: 'assets/images/sample_thumb.jpg'),
                    Video(image: 'assets/images/sample_thumb.jpg'),
                    Video(image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                      padding: EdgeInsets.symmetric(horizontal: 20.sp),
                      margin: EdgeInsets.only(top: 10),
                      child: Text(
                        'Learn from the Videos',
                        style: GoogleFonts.kadwa(
                            fontWeight: FontWeight.w700, fontSize: 18.sp),
                      )),
                ],
              ),
              Padding(
                padding:
                    EdgeInsets.symmetric(vertical: 10.sp, horizontal: 10.sp),
                child: GridView.count(
                  physics: NeverScrollableScrollPhysics(),
                  scrollDirection: Axis.vertical,
                  shrinkWrap: true,
                  crossAxisCount: 3,
                  childAspectRatio: 0.9,
                  crossAxisSpacing: 10.sp,
                  mainAxisSpacing: 10.sp,
                  children: videoCategoryData.map((e) {
                    return VideoCategory(e['image'].toString(),
                        e['title'].toString(), e['videos'].toString());
                  }).toList(),
                ),
              ),
              TabBar(
                  controller: _tabController,
                  // indicatorColor: Color(0xFFFEBA0F),
                  unselectedLabelColor: const Color(0xFF767676),
                  labelColor: Colors.black,
                  indicatorSize: TabBarIndicatorSize.tab,
                  indicator: BoxDecoration(
                      border: Border(
                          bottom:
                              BorderSide(width: 3, color: Color(0xFFFEBA0F)))),
                  // ignore: prefer_const_literals_to_create_immutables
                  tabs: [
                    const Tab(
                      child: Text(
                        "Beginner",
                        style: TextStyle(
                            fontSize: 16, fontWeight: FontWeight.w700),
                      ),
                    ),
                    const Tab(
                      child: Text("Professional",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                    ),
                    const Tab(
                      child: Text("Expert",
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w700,
                          )),
                    )
                  ]),
              SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Row(
                      children: cat_pill_data
                          .map((e) => GestureDetector(
                                onTap: () {
                                  for (int i = 0;
                                      i < cat_pill_data.length;
                                      i++) {
                                    print(i == cat_pill_data.indexOf(e));
                                    if (i == cat_pill_data.indexOf(e)) {
                                      print('in if $i');
                                      setState(() {
                                        cat_pill_data[i]['active'] = true;
                                      });
                                    } else {
                                      setState(() {
                                        cat_pill_data[i]['active'] = false;
                                      });
                                    }
                                  }
                                  print(cat_pill_data);
                                },
                                child: categoryPill(e['name'].toString(),
                                    (e["active"] == true) ? true : false),
                              ))
                          .toList(),
                    ),
                  )),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0.sp),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Award and Certificate',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      'View all >',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: Row(
                  children: [
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg'),
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg'),
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg'),
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg'),
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg'),
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg'),
                    Award_and_Certificate(
                        image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 10),
                padding: EdgeInsets.all(10.0.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Services and News',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      'View all >',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    servicesAndNews(
                      "Cement Material\nLaunch Online",
                      "",
                      true,
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
                      "Cement Material\n Launch Online",
                      "",
                      true,
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
                      "Cement Material\n Launch Online",
                      "",
                      true,
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
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0.sp),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Recently Added',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      'View all >',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 12.sp),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    HeroProfile(
                        "assets/images/profile.jpg",
                        "Electrician",
                        "Ashok Kumar",
                        "Roorkee",
                        "18 Oct, 2022",
                        "12:10AM",
                        "10min"),
                    HeroProfile(
                        "assets/images/profile.jpg",
                        "Electrician",
                        "Ashok Kumar",
                        "Roorkee",
                        "18 Oct, 2022",
                        "12:10AM",
                        "10min")
                  ],
                ),
              ),
              Container(
                height: 10,
              )
            ],
          ),
        ),
      ),
    );
  }
}

Widget buildCard(int index) => Container(
      color: Colors.red,
      width: 150.sp,
      height: 150.sp,
      child: Center(
        child: Text('$index'),
      ),
    );
