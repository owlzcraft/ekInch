// ignore_for_file: non_constant_identifier_names

import 'dart:convert';
import 'dart:typed_data';

import 'package:buttons_tabbar/buttons_tabbar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/awards_certificate.dart/view/award_view.dart';
import 'package:ekinch/app/modules/dashboard/widgets/TabButton.dart';
import 'package:ekinch/app/modules/recently_added/view/recently_added.dart';
import 'package:ekinch/app/modules/service/view/service_news.dart';
import 'package:ekinch/app/networking/app_repo.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:ekinch/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/dash_header.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/dashboard/widgets/services_news.widget.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import "package:flutter_screenutil/flutter_screenutil.dart";
import 'package:ekinch/app/modules/dashboard/widgets/awards.widgets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/recentlyAdded.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/video.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/videoCategory.widget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/work.widget.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:video_player/video_player.dart';
import '../../../../widgets/loader.dart';
import '../../../custom_widget/color.dart';
import '../../../models/categories_video.dart';
import '../../../models/recentlAdded.dart';
import '../../../models/reel_model.dart';
import '../../../networking/api_result.dart';
import '../../postjob/widgets/shortDropDown.dart';
import '../controllers/dashboard_controller.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class DashboardView extends StatefulWidget {
  List<Data> ReelsList;
  List<RData> RecentlyAddedList;
  List<RCategory> CivilList;

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
  var thumbnail = '';
  late TabController _tabButtonController;
  Uint8List videoThumb = base64Decode("");

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

  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  @override
  Widget build(BuildContext context) {
    //Select video Modal
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
                AppLocalizations.of(context)!.selectreel,
                style: GoogleFonts.kadwa(
                    fontSize: F24(), fontWeight: FontWeight.w700),
              ),
              content: SingleChildScrollView(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    InkWell(
                      onTap: () {
                        setState(() async {
                          thumbnail = await controller.getVideoFromCamera();
                          print("______________________________");
                          print(thumbnail);
                          videoThumb = base64Decode(thumbnail);
                          // showDataAlertUploadVideo();
                          Navigator.of(context).pop();
                          // Navigator.of(context).pop();
                          setState(() {});
                        });
                      },
                      child: Column(
                        children: [
                          Icon(
                            Icons.camera_alt_outlined,
                            size: 50.sp,
                          ),
                          Text(
                            AppLocalizations.of(context)!.camera,
                            style:
                                GoogleFonts.kadwa(fontWeight: FontWeight.w400),
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
                            AppLocalizations.of(context)!.gallery,
                            style:
                                GoogleFonts.kadwa(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

    final APIRepository apiRepository = APIRepository(isTokenRequired: true);
    String categoryId = "100";
    Future<void> GetCategoryReels(int index) async {
      switch (index) {
        case 0:
          categoryId = "100";
          break;
        case 1:
          categoryId = "200";
          break;
        case 2:
          categoryId = "300";
          break;
        case 3:
          categoryId = "400";
          break;
        case 4:
          categoryId = "500";
          break;
        case 5:
          categoryId = "600";
          break;
        case 6:
          categoryId = "700";
          break;
      }
      final fcmToken = LocalStorage.shared.getFCMToken();
      Get.showOverlay(
          asyncFunction: () async {
            final Map<String, dynamic> data = <String, dynamic>{};
            data["token"] = fcmToken;
            data["userId"] = LocalStorage.shared.getnumber();
            data["categoryId"] = categoryId;
            await apiRepository
                .categoryVidoesData(data)
                .then((ApiResult<CategoriesVideoModel> value) {
              value.when(
                  success: (value) {
                    if (value!.status == 200) {
                      setState(() {
                        widget.CivilList = value.category!;
                      });
                    } else if (value.status == 400) {
                      errorSnackbar(
                          AppLocalizations.of(context)!.pleaseRefresh);
                    } else {
                      errorSnackbar(AppLocalizations.of(context)!
                          .checkInternetConnection);
                    }
                  },
                  failure: (networkExceptions) {});
            });
          },
          loadingWidget: const LoadingIndicator());
    }

    var videoCategoryData = [
      {
        "image": "assets/images/civil.png",
        "title": AppLocalizations.of(context)!.civil,
        "videos": "6",
        "categoryId": "100"
      },
      {
        "image": "assets/images/hospital.png",
        "title": AppLocalizations.of(context)!.hospital,
        "videos": "10",
        "categoryId": "200"
      },
      {
        "image": "assets/images/light.png",
        "title": AppLocalizations.of(context)!.light,
        "videos": "5",
        "categoryId": "300"
      },
      {
        "image": "assets/images/welding.png",
        "title": AppLocalizations.of(context)!.welding,
        "videos": "7",
        "categoryId": "400"
      },
      {
        "image": "assets/images/plumber.png",
        "title": AppLocalizations.of(context)!.plumber,
        "videos": "4",
        "categoryId": "500"
      },
      {
        "image": "assets/images/civil.png",
        "title": AppLocalizations.of(context)!.wood,
        "videos": "6",
        "categoryId": "600"
      },
    ];
    showWarning() {
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
                  AppLocalizations.of(context)!.comingSoon,
                  style: GoogleFonts.kadwa(
                      color: Colors.black,
                      fontSize: F28(),
                      fontWeight: FontWeight.w700),
                ),
              ),
            );
          });
    }

//Upload video modal
    // showDataAlertSubscribe(String title, String subtitle) {
    //   showDialog(
    //       context: context,
    //       builder: (context) {
    //         return AlertDialog(
    //           insetPadding: EdgeInsets.all(8.sp),
    //           shape: const RoundedRectangleBorder(
    //             borderRadius: BorderRadius.all(
    //               Radius.circular(
    //                 4.0,
    //               ),
    //             ),
    //           ),
    //           title: Center(
    //             child: Text(
    //               title,
    //               style: GoogleFonts.kadwa(
    //                   color: Colors.black,
    //                   fontSize: F28(),
    //                   fontWeight: FontWeight.w700),
    //             ),
    //           ),
    //           content: SingleChildScrollView(
    //             child: Column(
    //               crossAxisAlignment: CrossAxisAlignment.center,
    //               mainAxisSize: MainAxisSize.min,
    //               children: <Widget>[
    //                 Text(
    //                   subtitle,
    //                   textAlign: TextAlign.center,
    //                   style: GoogleFonts.kadwa(
    //                       height: 1.2,
    //                       fontSize: F20(),
    //                       fontWeight: FontWeight.w400),
    //                 ),
    //                 Padding(
    //                   padding: EdgeInsets.symmetric(vertical: 20.sp),
    //                   child: GFButton(
    //                     onPressed: () {
    //                       Get.to(PlansView());
    //                     },
    //                     color: KColors.orange,
    //                     fullWidthButton: true,
    //                     size: 50.2,
    //                     text: AppLocalizations.of(context)!.subscribeNow,
    //                     textStyle: GoogleFonts.kadwa(
    //                       color: Colors.black,
    //                       fontWeight: FontWeight.w700,
    //                       fontSize: F24(),
    //                     ),
    //                     // shape: GFButtonShape.standard,
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ),
    //         );
    //       });
    // }
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
                AppLocalizations.of(context)!.uploadVideos,
                style: GoogleFonts.kadwa(
                    fontSize: F24(), fontWeight: FontWeight.w400),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    TextFormField(
                      autofocus: false,
                      controller: controller.title,
                      onChanged: (value) {},
                      decoration: InputDecoration(
                        hintText: AppLocalizations.of(context)!.enterVideoTitle,
                        hintStyle: GoogleFonts.kadwa(
                            fontSize: F18(), fontWeight: FontWeight.w400),
                        contentPadding: EdgeInsets.symmetric(
                            vertical: 10.sp, horizontal: 10.sp),
                        focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(5),
                            borderSide:
                                const BorderSide(color: Color(0xFFFEBA0F))),
                        border: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      style: GoogleFonts.kadwa(
                          fontSize: F18(), color: const Color(0xFF636363)),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: DropdownFieldFull(
                        controller: controller.reelCategory,
                        hintText: AppLocalizations.of(context)!.selectCategory,
                        items: [
                          AppLocalizations.of(context)!.civil,
                          AppLocalizations.of(context)!.wood,
                          AppLocalizations.of(context)!.light,
                          AppLocalizations.of(context)!.hospital,
                          AppLocalizations.of(context)!.plumber,
                          AppLocalizations.of(context)!.cast_iron_work,
                          AppLocalizations.of(context)!.welding,
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 12.sp),
                      child: InkWell(
                        onTap: () {
                          showDataAlertProfile();
                        },
                        child: DottedBorder(
                          dashPattern: const [8, 4],
                          color: const Color(0xFFCDCDCD),
                          strokeCap: StrokeCap.butt,
                          strokeWidth: 1,
                          borderType: BorderType.Rect,
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 20.sp, vertical: 40.sp),
                            child: ((videoThumb as List).isEmpty)
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text(
                                        AppLocalizations.of(context)!
                                            .uploadVideo,
                                        style: GoogleFonts.kadwa(
                                            fontSize: F24(),
                                            fontWeight: FontWeight.w700),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 8.sp),
                                        child: Image.asset(
                                          "assets/images/upload.png",
                                          scale: 3.0,
                                        ),
                                      )
                                    ],
                                  )
                                : Image.memory(
                                    videoThumb,
                                    scale: 1.5,
                                  ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                      child: GFButton(
                        onPressed: () {
                          if ((videoThumb as List).isEmpty) {
                            errorSnackbar('Please select a file to upload');
                          } else {
                            //Need change
                            controller.uploadReel(context, thumbnail);
                          }
                        },
                        color: KColors.orange,
                        fullWidthButton: true,
                        size: 50.2,
                        text: AppLocalizations.of(context)!.upload,
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

    return DefaultTabController(
      length: 7,
      child: Scaffold(
        key: _scaffoldKey,
        bottomNavigationBar: const BottomTabView(0),
        // bottomNavigationBar: BottomBar(),
        drawer: const SettingsView(),
        appBar: DynamicAppBar(
            "${LocalStorage.shared.getUserData()!.userData?.firstName}",
            AppLocalizations.of(context)!.welcomeDash,
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
                              AppLocalizations.of(context)!.shortVideo,
                              style: GoogleFonts.kadwa(
                                  fontWeight: FontWeight.w700, fontSize: F20()),
                            )),
                        Text(
                          AppLocalizations.of(context)!.viewAll,
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
                                      horizontal: 16.0, vertical: 10.0),
                                  child: Text(
                                    AppLocalizations.of(context)!.uploadVideos,
                                    textAlign: TextAlign.center,
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
                          children: (widget.ReelsList).map((e) {
                            var reelsArr = [e.reel];
                            for (var i = 0; i < widget.ReelsList.length; i++) {
                              if (!reelsArr
                                  .contains(widget.ReelsList[i].reel)) {
                                reelsArr.add(widget.ReelsList[i].reel);
                              }
                            }
                            return Video(
                              image: e.thumbnail,
                              view: e.view,
                              text: e.title,
                              reels: reelsArr,
                              onTap: () {},
                            );
                          }).toList(),
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
                            AppLocalizations.of(context)!.learnVideo,
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
                        return VideoCategory(
                            e['image'].toString(),
                            e['title'].toString(),
                            e['videos'].toString(),
                            context);
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
                            AppLocalizations.of(context)!.beginner,
                            style: GoogleFonts.kadwa(
                                fontSize: F18(), fontWeight: FontWeight.w700),
                          ),
                        ),
                        Tab(
                          child: InkWell(
                            onTap: () {
                              showWarning();
                              //   showDataAlertSubscribe("Professionl",
                              //       "Do you want to continue with Professionals, Please do Subscribe");
                            },
                            child:
                                Text(AppLocalizations.of(context)!.professional,
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
                      unselectedBorderColor:
                          const Color.fromRGBO(238, 238, 238, 0.992),
                      radius: 100,
                      onTap: (index) {
                        GetCategoryReels(index);
                      },
                      tabs: [
                        Tab(
                          child: TabButton(
                            AppLocalizations.of(context)!.civil,
                          ),
                        ),
                        Tab(
                          child:
                              TabButton(AppLocalizations.of(context)!.hospital),
                        ),
                        Tab(
                          child: TabButton(AppLocalizations.of(context)!.light),
                        ),
                        Tab(
                          child:
                              TabButton(AppLocalizations.of(context)!.welding),
                        ),
                        Tab(
                          child:
                              TabButton(AppLocalizations.of(context)!.plumber),
                        ),
                        Tab(
                          child:
                              TabButton(AppLocalizations.of(context)!.building),
                        ),
                        Tab(
                          child: TabButton(AppLocalizations.of(context)!.wood),
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
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(horizontal: 10.sp),
                    child: Row(
                      children: (widget.CivilList)
                          .map((e) => work(
                                image: e.subCategories[0].subCategoryData[0]
                                    .coursesImage,
                                view: e.subCategories[0].subCategoryData[0]
                                    .totalLikes
                                    .toString(),
                                text:
                                    e.subCategories[0].subCategoryData[0].title,
                              ))
                          .toList(),
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
                          AppLocalizations.of(context)!.awardandCertificate,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F20()),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const AwardAndCertificate());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.viewAll,
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
                    child: const Row(
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
                          AppLocalizations.of(context)!.servicesandNews,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F20()),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const ServiceAndNews());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.viewAll,
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
                          AppLocalizations.of(context)!.recentlyAdded,
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w700, fontSize: F20()),
                        ),
                        InkWell(
                          onTap: () {
                            Get.to(const RecentlyAddedView());
                          },
                          child: Text(
                            AppLocalizations.of(context)!.viewAll,
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
                        children: (widget.RecentlyAddedList)
                            .map((e) => HeroProfile(
                                date: e.dateOfReg.toString(),
                                image: e.photo.toString(),
                                job: e.profession.toString(),
                                location: e.address.toString(),
                                minutes: "",
                                name: e.firstName.toString(),
                                time: ""))
                            .toList()),
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

// Widget buildCard(int index) => Container(
//       color: Colors.red,
//       width: 150.sp,
//       height: 150.sp,
//       child: Center(
//         child: Text('$index'),
//       ),
//     );
