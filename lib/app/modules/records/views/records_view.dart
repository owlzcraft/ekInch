import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/records/views/widget/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/loader.dart';
import '../../../../widgets/math_utils.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../generated/assets.dart';
import '../../../models/profile_model.dart';
import '../../../models/records_model.dart';
import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';
import '../../../utils/localStorage.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../controllers/records_controller.dart';

class RecordsView extends StatefulWidget {
  @override
  State<RecordsView> createState() => _RecordsViewState();
}

class _RecordsViewState extends State<RecordsView> {
  bool visibilitylights = false;
  bool visibilityhospitals = false;
  bool visibilitywood = false;
  bool visibilitycivil = false;
  bool visibilitybuilding = false;
  bool visibilitywielding = false;
  bool visibilityplumber = false;
  bool isDrawerOpen = false;
  List<DataH> civilList = [];
  List<DataH> lightList = [];
  List<DataH> hospitalList = [];
  List<DataH> plumberList = [];
  List<DataH> builderList = [];
  List<DataH> ironList = [];
  List<DataH> woodList = [];

  int categoryId = 100;
  final APIRepository apiRepository = APIRepository(isTokenRequired: true);

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  RecordsController controller = Get.put(RecordsController());
//Records

  Future<void> Records(category) async {
    final fcmToken = LocalStorage.shared.getFCMToken();
    Get.showOverlay(
        asyncFunction: () async {
          switch (category) {
            case "Civil work":
              categoryId = 100;
              break;
            case "Electrical work":
              categoryId = 300;
              break;
            case "Hospital work":
              categoryId = 200;
              break;
            case "Iron work":
              categoryId = 400;
              break;
            case "Plumbing work":
              categoryId = 500;
              break;
            case "Building painting work":
              categoryId = 600;
              break;
            case "wood work":
              categoryId = 700;
              break;
          }
          print(fcmToken);
          final Map<String, dynamic> data = <String, dynamic>{};
          data["userId"] = LocalStorage.shared.getnumber();
          data["token"] = fcmToken;
          data["catId"] = categoryId;

          await apiRepository
              .records(data)
              .then((ApiResult<RecordsModel> value) {
            value.when(
                success: (value) {
                  if (value!.ok == true) {
                    print("working");
                    switch (categoryId) {
                      case 100:
                        setState(() {
                          civilList = value.data!;
                        });
                        break;
                      case 200:
                        setState(() {
                          hospitalList = value.data!;
                        });
                        break;
                      case 300:
                        setState(() {
                          lightList = value.data!;
                        });
                        break;
                      case 400:
                        setState(() {
                          ironList = value.data!;
                        });
                        break;
                      case 500:
                        setState(() {
                          plumberList = value.data!;
                        });
                        break;
                      case 600:
                        setState(() {
                          builderList = value.data!;
                        });
                        break;
                      case 700:
                        setState(() {
                          woodList = value.data!;
                        });
                        break;
                    }
                    setState(() {});
                  } else if (value.ok == false) {
                    errorSnackbar("Something Went Wrong");
                  } else {
                    errorSnackbar("Please Try After Sometime");
                  }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

  void showdrop1() {
    setState(() {
      if (visibilitylights == false) {
        Records("Electrical work");
      }
      visibilitylights = !visibilitylights;
    });
  }

  void showdrop2() {
    setState(() {
      if (visibilityhospitals == false) {
        Records("Hospital work");
      }

      visibilityhospitals = !visibilityhospitals;
    });
  }

  void showdrop3() {
    setState(() {
      if (visibilitycivil == false) {
        Records("Civil work");
      }

      visibilitycivil = !visibilitycivil;
    });
  }

  void showdrop4() {
    setState(() {
      if (visibilityplumber == false) {
        Records("Plumbing work");
      }
      visibilityplumber = !visibilityplumber;
    });
  }

  void showdrop5() {
    setState(() {
      if (visibilitybuilding == false) {
        Records("Building painting work");
      }

      visibilitybuilding = !visibilitybuilding;
    });
  }

  void showdrop6() {
    setState(() {
      if (visibilitywielding == false) {
        Records("Iron work");
      }

      visibilitywielding = !visibilitywielding;
    });
  }

  void showdrop7() {
    setState(() {
      if (visibilitywood == false) {
        Records("wood work");
      }

      visibilitywood = !visibilitywood;
    });
  }

  List<String> images = [
    "assets/images/imagerecords.png",
    "assets/images/imagerecords.png",
    "assets/images/imagerecords.png",
    "assets/images/imagerecords.png",
    "assets/images/imagerecords.png",
  ];
  final CarouselController carouselController = CarouselController();

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      drawer: const SettingsView(),
      appBar: AppBar(
        title: Text(
          "Records",
          style: GoogleFonts.kadwa(
              color: Colors.white, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.drawerIcon_white),
          onPressed: () {
            if (!scaffoldKey.currentState!.isDrawerOpen) {
              scaffoldKey.currentState!.openDrawer();
            }
          },
        ),
        actions: [
          IconButton(
              onPressed: (() => {Get.to(() => ReferNearnView())}),
              icon: SvgPicture.asset(Assets.share_white)),
          IconButton(
            padding: const EdgeInsetsDirectional.only(end: 9.11),
            onPressed: (() => {Get.to(() => NotificationView())}),
            icon: SvgPicture.asset(Assets.notification),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
          child: Column(children: [
        Container(
          color: Colors.black,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              child: ImageSlideshow(
                initialPage: 0,
                autoPlayInterval: 10000,
                indicatorColor: KColors.orange,
                onPageChanged: (value) {
                  // debugPrint('Page changed: $value');
                },
                isLoop: true,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 8.0, bottom: 32.0, top: 32.0),
                    child: Container(
                        // width: getHorizontalSize(377),
                        // height: getVerticalSize(80),
                        child: Image.asset(Assets.Recordimg1),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                        )),
                  ),
                  Padding(
                    padding:
                        EdgeInsets.only(left: 8.0, bottom: 32.0, top: 32.0),
                    child: Container(
                        // width: getHorizontalSize(377),
                        // height: getVerticalSize(80),
                        child: Image.asset(Assets.Recordimg1),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15))),
                  ),
                ],
              ),
            ),
          ),
        ),
        Column(children: [
          InkWell(
            onTap: showdrop3,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Civil work",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: F18()),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: visibilitycivil,
              child: (civilList.length == 0)
                  ? Container(
                      color: Colors.white,
                      width: Get.width,
                      height: getVerticalSize(30),
                      child: Center(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.kadwa(
                              fontSize: F18(), color: Colors.grey),
                        ),
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: (civilList)
                          .map((e) => SectionCard(
                                subtitle: e.subcatName.toString(),
                                views: e.viewsCount.toString(),
                                title: e.videoFileName.toString(),
                                time: e.seenLength.toString(),
                                videoImage: '',
                              ))
                          .toList()),
            ),
          ),
          InkWell(
            onTap: showdrop1,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Electrical work",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: F18()),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, size: 30.sp),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Visibility(
                visible: visibilitylights,
                child: (lightList.length == 0)
                    ? Container(
                        color: Colors.white,
                        width: Get.width,
                        height: getVerticalSize(30),
                        child: Center(
                          child: Text(
                            "No Data",
                            style: GoogleFonts.kadwa(
                                fontSize: F18(), color: Colors.grey),
                          ),
                        ))
                    : Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: (lightList)
                            .map((e) => SectionCard(
                                  subtitle: e.subcatName.toString(),
                                  views: e.viewsCount.toString(),
                                  title: e.videoFileName.toString(),
                                  time: e.seenLength.toString(),
                                  videoImage: '',
                                ))
                            .toList()),
              )),
          InkWell(
            onTap: showdrop2,
            child: Container(
              width: getHorizontalSize(396),
              height: getVerticalSize(50),
              decoration: BoxDecoration(
                  color: KColors.greybg,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: EdgeInsets.only(left: 14.9, right: 14.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Hospitals work",
                      style: GoogleFonts.kadwa(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: F18()),
                    ),
                    Icon(Icons.arrow_drop_down_sharp, size: 30),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: visibilityhospitals,
              child: (hospitalList.length == 0)
                  ? Container(
                      color: Colors.white,
                      width: Get.width,
                      height: getVerticalSize(30),
                      child: Center(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.kadwa(
                              fontSize: F18(), color: Colors.grey),
                        ),
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: (hospitalList)
                          .map((e) => SectionCard(
                                subtitle: e.subcatName.toString(),
                                views: e.viewsCount.toString(),
                                title: e.videoFileName.toString(),
                                time: e.seenLength.toString(),
                                videoImage: 'need chane',
                              ))
                          .toList()),
            ),
          ),

          InkWell(
            onTap: showdrop4,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Plumbing work",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: F18()),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: visibilityplumber,
              child: (plumberList.length == 0)
                  ? Container(
                      color: Colors.white,
                      width: Get.width,
                      height: getVerticalSize(30),
                      child: Center(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.kadwa(
                              fontSize: F18(), color: Colors.grey),
                        ),
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: (plumberList)
                          .map((e) => SectionCard(
                                subtitle: e.subcatName.toString(),
                                views: e.viewsCount.toString(),
                                title: e.videoFileName.toString(),
                                time: e.seenLength.toString(),
                                videoImage: '',
                              ))
                          .toList()),
            ),
          ),
          InkWell(
            onTap: showdrop5,
            child: Container(
              width: getHorizontalSize(396),
              height: getVerticalSize(50),
              decoration: BoxDecoration(
                  color: KColors.greybg,
                  borderRadius: BorderRadius.circular(6)),
              child: Padding(
                padding: EdgeInsets.only(left: 14.9, right: 14.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Building painting work",
                      style: GoogleFonts.kadwa(
                          color: Colors.black,
                          fontWeight: FontWeight.bold,
                          fontSize: F18()),
                    ),
                    Icon(Icons.arrow_drop_down_sharp, size: 30),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: visibilitybuilding,
              child: (builderList.length == 0)
                  ? Container(
                      color: Colors.white,
                      width: Get.width,
                      height: getVerticalSize(30),
                      child: Center(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.kadwa(
                              fontSize: F18(), color: Colors.grey),
                        ),
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: (builderList)
                          .map((e) => SectionCard(
                                subtitle: e.subcatName.toString(),
                                views: e.viewsCount.toString(),
                                title: e.videoFileName.toString(),
                                time: e.seenLength.toString(),
                                videoImage: '',
                              ))
                          .toList()),
            ),
          ),
          InkWell(
            onTap: showdrop6,
            child: Padding(
              padding: const EdgeInsets.only(top: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Iron Work",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: F18()),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: visibilitywielding,
              child: (ironList.length == 0)
                  ? Container(
                      color: Colors.white,
                      width: Get.width,
                      height: getVerticalSize(30),
                      child: Center(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.kadwa(
                              fontSize: F18(), color: Colors.grey),
                        ),
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: (ironList)
                          .map((e) => SectionCard(
                                subtitle: e.subcatName.toString(),
                                views: e.viewsCount.toString(),
                                title: e.videoFileName.toString(),
                                time: e.seenLength.toString(),
                                videoImage: '',
                              ))
                          .toList()),
            ),
          ),
          InkWell(
            onTap: showdrop7,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Wood work",
                        style: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: F18()),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, size: 30),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 16.0),
            child: Visibility(
              visible: visibilitywood,
              child: (woodList.length == 0)
                  ? Container(
                      color: Colors.white,
                      width: Get.width,
                      height: getVerticalSize(30),
                      child: Center(
                        child: Text(
                          "No Data",
                          style: GoogleFonts.kadwa(
                              fontSize: F18(), color: Colors.grey),
                        ),
                      ))
                  : Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: (woodList)
                          .map((e) => SectionCard(
                                subtitle: e.subcatName.toString(),
                                views: e.viewsCount.toString(),
                                title: e.videoFileName.toString(),
                                time: e.seenLength.toString(),
                                videoImage: '',
                              ))
                          .toList()),
            ),
          ),
          // bottomSheet: Column(children: [
          //   Stack(
          //     children: [
          //       InkWell(
          //         onTap: () {
          //           print(currentIndex);
          //         },
          //         child: Container(
          //           padding: const EdgeInsets.all(35),
          //           color: Colors.black,
          //           child: CarouselSlider(
          //             items: imageList
          //                 .map(
          //                   (item) => ClipRRect(
          //                     borderRadius: BorderRadius.all(Radius.circular(10)),
          //                     child: Image.asset(
          //                       item['image_path'],
          //                       fit: BoxFit.cover,
          //                       width: double.infinity,
          //                     ),
          //                   ),
          //                 )
          //                 .toList(),
          //             carouselController: carouselController,
          //             options: CarouselOptions(
          //               scrollPhysics: const BouncingScrollPhysics(),
          //               autoPlay: true,
          //               aspectRatio: 2,
          //               viewportFraction: 1,
          //               onPageChanged: (index, reason) {
          //                 // setState(() {
          //                 //   currentIndex = index;
          //                 // });
          //               },
          //             ),
          //           ),
          //         ),
          //       ),
          //       Positioned(
          //         bottom: 20,
          //         left: 0,
          //         right: 0,
          //         child: Row(
          //           mainAxisAlignment: MainAxisAlignment.center,
          //           children: imageList.asMap().entries.map((entry) {
          //             return GestureDetector(
          //               onTap: () => carouselController.animateToPage(entry.key),
          //               child: Container(
          //                 width: currentIndex == entry.key ? 20 : 10,
          //                 height: 10.0,
          //                 margin: const EdgeInsets.symmetric(
          //                   horizontal: 3.0,
          //                 ),
          //                 decoration: BoxDecoration(
          //                     borderRadius: BorderRadius.circular(10),
          //                     color: currentIndex == entry.key
          //                         ? const Color(0xfffEBA0F)
          //                         : Colors.black,
          //                     border:
          //                         Border.all(color: Color(0xffB4B4B4), width: 1)),
          //               ),
          //             );
          //           }).toList(),
          //         ),
          //       ),
          //     ],
          //   ),
          // ]),
        ])
      ])),
      bottomNavigationBar: BottomTabView(3),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
