import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/awards_certificate.dart/view/award_view.dart';
import 'package:ekinch/app/modules/dashboard/widgets/TabButton.dart';
import 'package:ekinch/app/modules/plans/view/plan_view.dart';
import 'package:ekinch/app/modules/recently_added/view/recently_added.dart';
import 'package:ekinch/app/modules/reels/bindings/reels_binding.dart';
import 'package:ekinch/app/modules/service/view/service_news.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/dash_header.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/dashboard/widgets/services_news.widget.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:ekinch/app/modules/dashboard/widgets/awards.widgets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/categoryPill.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/recentlyAdded.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/video.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/videoCategory.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/work.widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
import '../../../custom_widget/color.dart';
import '../../../models/recentlAdded.dart';
import '../../../models/reel_model.dart';
import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';

class DashboardView extends StatefulWidget {
  List<Data> ReelsList;
  List<RData> RecentlyAddedList;
  List CivilList;

  DashboardView(
      {super.key,
      required this.ReelsList,
      required this.RecentlyAddedList,
      required this.CivilList});

  @override
  State<DashboardView> createState() => _DashboardStateView();
}

class _DashboardStateView extends State<DashboardView>
    with TickerProviderStateMixin {
  DashboardController controller = Get.put(DashboardController());
  late TabController _tabController;
  late TabController _tabButtonController;

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    _tabButtonController = TabController(length: 7, vsync: this);

    super.initState();
    // var videocontroller = VideoPlayerController.network(
    //   'https://www.youtube.com/watch?v=p260etQQbJE&list=RDbiFowhF1Tt8&index=27',
    // )..initialize().then((_) {
    //     setState(() {});
    //   });
  }

  GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    int activeTab = 0;
    showDataAlertProfile() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: const EdgeInsets.all(10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Text(
                "Select Reel",
                style: GoogleFonts.kadwa(
                    fontSize: F24(), fontWeight: FontWeight.w700),
              ),
              content: Container(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          controller.getVideoFromCamera();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 50.sp,
                            ),
                            Text(
                              "Camera",
                              style: GoogleFonts.kadwa(
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.getVideoFromGallery();
                        },
                        child: Column(
                          children: [
                            Icon(Icons.filter, size: 50.sp),
                            Text(
                              "Gallery",
                              style: GoogleFonts.kadwa(
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }

    var tabViewVideoes = "civil";
    var videoCategoryData = [
      {
        "image": "assets/images/civil.png",
        "title": "Civil",
        "videos": "6",
        "categoryId": "100"
      },
      {
        "image": "assets/images/hospital.png",
        "title": "Hospital",
        "videos": "10",
        "categoryId": "200"
      },
      {
        "image": "assets/images/light.png",
        "title": "Light",
        "videos": "5",
        "categoryId": "300"
      },
      {
        "image": "assets/images/welding.png",
        "title": "Welding",
        "videos": "7",
        "categoryId": "400"
      },
      {
        "image": "assets/images/plumber.png",
        "title": "Plumber",
        "videos": "4",
        "categoryId": "500"
      },
      {
        "image": "assets/images/civil.png",
        "title": "Building",
        "videos": "6",
        "categoryId": "600"
      },
    ];
    // var cat_pill_data = [
    //   {"name": "Civil", "active": true},
    //   {"name": "Plumber", "active": false},
    //   {"name": "Electrician", "active": false},
    //   {"name": "Plumber", "active": false},
    // ];
    showDataAlertSubscribe(String title, String subtitle) {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.all(8.sp),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Center(
                child: Text(
                  title,
                  style: GoogleFonts.kadwa(
                      color: Colors.black,
                      fontSize: F28(),
                      fontWeight: FontWeight.w700),
                ),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      subtitle,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.kadwa(
                          height: 1.2,
                          fontSize: F20(),
                          fontWeight: FontWeight.w400),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                      child: GFButton(
                        onPressed: () {
                          Get.to(PlansView());
                        },
                        color: KColors.orange,
                        fullWidthButton: true,
                        size: 50.2,
                        text: "Subscribe Now",
                        textStyle: GoogleFonts.kadwa(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: F24(),
                        ),
                        // shape: GFButtonShape.standard,
                      ),
                    ),
                  ],
                ),
              ),
            );
          });
    }

    showDataAlertUploadVideo() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.all(24.sp),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Text(
                "Update Reel",
                style: GoogleFonts.kadwa(
                    fontSize: F24(), fontWeight: FontWeight.w400),
              ),
              content: Container(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TextFormField(
                        autofocus: true,
                        onChanged: (value) {},
                        decoration: InputDecoration(
                          hintText: "    Enter video title",
                          hintStyle: GoogleFonts.kadwa(
                              fontSize: F22(), fontWeight: FontWeight.w400),
                          contentPadding: EdgeInsets.symmetric(
                              vertical: 10.sp, horizontal: 10.sp),
                          focusedBorder: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5),
                              borderSide:
                                  const BorderSide(color: Color(0xFFFEBA0F))),
                          border: OutlineInputBorder(
                            borderSide:
                                const BorderSide(color: Color(0xFFCDCDCD)),
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        style: GoogleFonts.kadwa(
                            fontSize: F20(), color: const Color(0xFF636363)),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 12.sp),
                        child: InkWell(
                          onTap: () {
                            showDataAlertProfile();
                          },
                          child: DottedBorder(
                            dashPattern: [8, 4],
                            color: const Color(0xFFCDCDCD),
                            strokeCap: StrokeCap.butt,
                            strokeWidth: 1,
                            borderType: BorderType.Rect,
                            child: Padding(
                              padding: EdgeInsets.all(40.sp),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Upload Video",
                                    style: GoogleFonts.kadwa(
                                        fontSize: F24(),
                                        fontWeight: FontWeight.w700),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.sp),
                                    child: Image.asset(
                                      "assets/images/upload.png",
                                      scale: 3.0,
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 20.sp),
                        child: GFButton(
                          onPressed: () {},
                          color: KColors.orange,
                          fullWidthButton: true,
                          size: 50.2,
                          text: "Upload",
                          textStyle: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.w700,
                            fontSize: F24(),
                          ),
                          // shape: GFButtonShape.standard,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          });
    }

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: BottomTabView(0),
        // bottomNavigationBar: BottomBar(),
        drawer: const SettingsView(),
        appBar: DynamicAppBar(
            "${LocalStorage.shared.getUserData()?.userData?.firstName}",
            "Welcome !",
            true,
            _scaffoldKey),
        body: CustomScrollView(
          slivers: [
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
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
                                  fontWeight: FontWeight.w700, fontSize: F20()),
                            )),
                        Text(
                          'View all >',
                          style: GoogleFonts.kadwa(
                              fontSize: F18(),
                              color: const Color(0xFF767676),
                              fontWeight: FontWeight.w400),
                        )
                      ],
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
                    padding: EdgeInsets.only(
                        bottom: 10.sp, left: 10.sp, right: 10.sp),
                    child: Row(
                      children: [
                        InkWell(
                          onTap: () {
                            showDataAlertUploadVideo();
                          },
                          child: Container(
                            alignment: AlignmentDirectional.center,
                            width: (MediaQuery.of(context).size.width / 3.5).sp,
                            height: (MediaQuery.of(context).size.height /
                                    4.04809009283)
                                .sp,
                            margin: EdgeInsets.symmetric(
                                horizontal: 10.sp, vertical: 5.sp),
                            decoration: BoxDecoration(
                                color: KColors.orange,
                                borderRadius: BorderRadius.circular(20.sp)),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Image.asset(
                                  "assets/images/vcamera.png",
                                  scale: 3.0,
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0),
                                  child: Text(
                                    "Upload\nVideos",
                                    style: GoogleFonts.kadwa(
                                        height: 1.2,
                                        fontSize: F18(),
                                        fontWeight: FontWeight.w400),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Row(
                          children: (widget.ReelsList)
                              .map((e) => Video(
                                    image: e.thumbnail,
                                    view: e.view,
                                    text: e.title,
                                    onTap: () {},
                                  ))
                              .toList(),
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(horizontal: 20.sp),
                          child: Text(
                            'Learn from the Videos',
                            style: GoogleFonts.kadwa(
                                fontWeight: FontWeight.w700, fontSize: F20()),
                          )),
                    ],
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: EdgeInsets.symmetric(
                        vertical: 10.sp, horizontal: 10.sp),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
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
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  TabBar(
                      controller: _tabController,
                      // indicatorColor: Color(0xFFFEBA0F),
                      unselectedLabelColor: const Color(0xFF767676),
                      labelColor: Colors.black,
                      indicatorSize: TabBarIndicatorSize.tab,
                      indicator: const BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  width: 3, color: Color(0xFFFEBA0F)))),
                      // ignore: prefer_const_literals_to_create_immutables
                      tabs: [
                        Tab(
                          child: Text(
                            "Beginner",
                            style: GoogleFonts.kadwa(
                                fontSize: F18(), fontWeight: FontWeight.w700),
                          ),
                        ),
                        Tab(
                          child: InkWell(
                            onTap: () {
                              showDataAlertSubscribe("Professionl",
                                  "Do you want to continue with Professionals, Please do Subscribe");
                            },
                            child: Text("Professional",
                                style: GoogleFonts.kadwa(
                                  fontSize: F18(),
                                  fontWeight: FontWeight.w700,
                                )),
                          ),
                        ),
                      ]),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ButtonsTabBar(
                      controller: _tabButtonController,
                      backgroundColor: KColors.orange,
                      unselectedBackgroundColor:
                          const Color.fromARGB(255, 227, 224, 224),
                      labelStyle: GoogleFonts.kadwa(
                          color: KColors.orange, fontSize: F18()),
                      unselectedLabelStyle: GoogleFonts.kadwa(
                          color: KColors.lightGrey, fontSize: F18()),
                      unselectedBorderColor: KColors.greybg,
                      radius: 100,
                      onTap: (int) {
                        print(int);
                        setState(() {
                          activeTab = int;
                          print(activeTab);
                        });
                      },
                      tabs: [
                        Tab(
                          child: TabButton(
                            "Civil",
                          ),
                        ),
                        Tab(
                          child: TabButton("Hospital"),
                        ),
                        Tab(
                          child: TabButton("Light"),
                        ),
                        Tab(
                          child: TabButton("Wieldng"),
                        ),
                        Tab(
                          child: TabButton("Plumber"),
                        ),
                        Tab(
                          child: TabButton("Building"),
                        ),
                        Tab(
                          child: TabButton("Wood"),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // SliverList(
            //  delegate: SliverChildListDelegate.fixed(
            //      [
            //       TabBarView(
            //         // physics: ScrollPhysics(parent: ),
            //       controller: _tabButtonController,
            //       children: [
            //          SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ), SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ), SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ), SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ), SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ), SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ), SingleChildScrollView(
            //         scrollDirection: Axis.horizontal,
            //         padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //         child: Row(
            //           children: [
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg'),
            //             work(image: 'assets/images/sample_thumb.jpg')
            //           ],
            //         ),
            //       ),
            //             ],
            //         ),
            //     ],
            //   ),
            // ),

            // SliverList(
            //   delegate: SliverChildListDelegate.fixed(
            //     [
            //       SingleChildScrollView(
            //           scrollDirection: Axis.horizontal,
            //           child: Padding(
            //             padding: const EdgeInsets.symmetric(horizontal: 10.0),
            //             child: Row(
            //               children: cat_pill_data
            //                   .map((e) => GestureDetector(
            //                         onTap: () {
            //                           for (int i = 0;
            //                               i < cat_pill_data.length;
            //                               i++) {
            //                             print(i == cat_pill_data.indexOf(e));
            //                             if (i == cat_pill_data.indexOf(e)) {
            //                               print('in if $i');
            //                               setState(() {
            //                                 cat_pill_data[i]['active'] = true;
            //                               });
            //                             } else {
            //                               setState(() {
            //                                 cat_pill_data[i]['active'] = false;
            //                               });
            //                             }
            //                           }
            //                           print(cat_pill_data);
            //                         },
            //                         child: categoryPill(e['name'].toString(),
            //                             (e["active"] == true) ? true : false),
            //                       ))
            //                   .toList(),
            //             ),
            //           )),
            //     ],
            //   ),
            // ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Visibility(
                    visible: (activeTab == 0),
                    child: SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.symmetric(horizontal: 10.sp),
                      child: Row(
                        // children: (widget.CivilList)
                        //         .map((e) => work(
                        //               image: e.thumbnail,
                        //               view: e.view,
                        //               text: e.title,
                        //             ))
                        //         .toList(),
                        children: [
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                          work(
                            image: 'assets/images/sample_thumb.jpg',
                            text: '',
                            view: '',
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Award and Certificate',
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F20()),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(AwardAndCertificate());
                          },
                          child: Text(
                            'View all >',
                            style: GoogleFonts.kadwa(
                                fontSize: F18(),
                                color: const Color(0xFF767676),
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
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
                        Award_and_Certificate(image: 'assets/images/award.png'),
                        Award_and_Certificate(image: 'assets/images/award.png'),
                        Award_and_Certificate(image: 'assets/images/award.png'),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Services and News',
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F20()),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(ServiceAndNews());
                          },
                          child: Text(
                            'View all >',
                            style: GoogleFonts.kadwa(
                                fontSize: F18(),
                                color: const Color(0xFF767676),
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
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
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16.0, vertical: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Recently Added',
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F20()),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const RecentlyAddedView());
                          },
                          child: Text(
                            'View all >',
                            style: GoogleFonts.kadwa(
                                fontSize: F18(),
                                color: const Color(0xFF767676),
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
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
                ],
              ),
            ),
            SliverList(
              delegate: SliverChildListDelegate.fixed(
                [
                  SizedBox(
                    height: getVerticalSize(30),
                  ),
                ],
              ),
            )
          ],
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
