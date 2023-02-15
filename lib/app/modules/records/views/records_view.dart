import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottom_bar.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/refer_nearn_view.dart';
import 'package:flutter_application_00/app/modules/settings/views/settings_view.dart';
import 'package:flutter_application_00/widgets/Upperbar.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:flutter_image_slideshow/flutter_image_slideshow.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mj_image_slider/mj_options.dart';
import '../../../../widgets/math_utils.dart';
import '../../../generated/assets.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../controllers/records_controller.dart';
import 'package:mj_image_slider/mj_image_slider.dart';

class RecordsView extends StatefulWidget {
  @override
  State<RecordsView> createState() => _RecordsViewState();
}

class _RecordsViewState extends State<RecordsView> {
  bool visibilitylights = true;

  bool visibilityhospitals = false;

  bool visibilitycivil = false;

  bool visibilityplumber = false;

  bool visibilitypainiting = false;

  bool isDrawerOpen = false;

  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();

  void showdrop1() {
    setState(() {
      visibilitylights = !visibilitylights;
    });
  }

  void showdrop2() {
    setState(() {
      visibilityhospitals = !visibilityhospitals;
    });
  }

  void showdrop3() {
    setState(() {
      visibilitycivil = !visibilitycivil;
    });
  }

  void showdrop4() {
    setState(() {
      visibilityplumber = !visibilityplumber;
    });
  }

  void showdrop5() {
    setState(() {
      visibilitypainiting = !visibilitypainiting;
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
          style: GoogleFonts.kadwa(color: Colors.white, fontWeight: FontWeight.bold),
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
        //   child: SingleChildScrollView(
        //     child: Wrap(
        //       crossAxisAlignment: WrapCrossAlignment.center,
        //       children: [
        //         Container(
        //           child: MJImageSlider(
        //             options: MjOptions(
        //               aspectRatio: 16/9,
        //                 enableInfiniteScroll: false,
        //                 onPageChanged: (i) {},
        //                 scrollDirection: Axis.horizontal,
        //                 viewportFraction: 2.0),
        //             widgets: [
        //               ...images
        //                   .map((e) => Image(image: AssetImage(e),))
        //                   .toList()
        //             ],
        //           ),
        //         ),
        //       ],
        //     ),
        //   ), //
        // ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child:
          Container(
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
                  padding: const EdgeInsets.only(
                      left: 8.0, bottom: 32.0, top: 32.0),
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
            onTap: showdrop1,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Lights",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Kadwa",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
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
              visible: visibilitylights,
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: getHorizontalSize(420),
                      height: getVerticalSize(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(74),
                            height: getVerticalSize(74),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Light work part 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "Electrician ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "429",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.watch,
                                        color: Colors.grey),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "00 Min 20 Sec",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Icon(Icons.check_circle_outline),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(420),
                      height: getVerticalSize(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(74),
                            height: getVerticalSize(74),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Light work part 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "Electrician ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "429",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.watch,
                                        color: Colors.grey),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "00 Min 20 Sec",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Icon(Icons.check_circle_outline),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          InkWell(
            onTap: showdrop2,
            child: Container(
              width: getHorizontalSize(396),
              height: getVerticalSize(50),
              decoration: BoxDecoration(
                  color: KColors.greybg,
                  borderRadius: BorderRadius.circular(6)),
              child: const Padding(
                padding: EdgeInsets.only(left: 14.9, right: 14.9),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  // ignore: prefer_const_literals_to_create_immutables
                  children: [
                    Text(
                      "Hospitals",
                      style: TextStyle(
                          color: Colors.black,
                          fontFamily: "Kadwa",
                          fontWeight: FontWeight.bold,
                          fontSize: 18),
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: getHorizontalSize(420),
                      height: getVerticalSize(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(74),
                            height: getVerticalSize(74),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Light work part 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "Electrician ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "429",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.watch,
                                        color: Colors.grey),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "00 Min 20 Sec",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Icon(Icons.check_circle_outline),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(420),
                      height: getVerticalSize(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(74),
                            height: getVerticalSize(74),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Light work part 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "Electrician ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "429",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.watch,
                                        color: Colors.grey),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "00 Min 20 Sec",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Icon(Icons.check_circle_outline),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          InkWell(
            onTap: showdrop3,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Civil",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Kadwa",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: getHorizontalSize(420),
                      height: getVerticalSize(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(74),
                            height: getVerticalSize(74),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Light work part 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "Electrician ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "429",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.watch,
                                        color: Colors.grey),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "00 Min 20 Sec",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Icon(Icons.check_circle_outline),
                          )
                        ],
                      ),
                    ),
                    Container(
                      width: getHorizontalSize(420),
                      height: getVerticalSize(100),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: getHorizontalSize(74),
                            height: getVerticalSize(74),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                shape: BoxShape.rectangle),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  "Light work part 1",
                                  style: TextStyle(
                                      fontSize: 16,
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                const Text(
                                  "Electrician ",
                                  style: TextStyle(
                                    fontSize: 12,
                                    color: Colors.black,
                                  ),
                                  textAlign: TextAlign.start,
                                ),
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    const Icon(
                                      Icons.remove_red_eye_outlined,
                                      size: 18,
                                      color: Colors.grey,
                                    ),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "429",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                    SvgPicture.asset(Assets.watch,
                                        color: Colors.grey),
                                    const Padding(
                                      padding:
                                          EdgeInsets.only(left: 2.9, right: 13),
                                      child: Text(
                                        "00 Min 20 Sec",
                                        style: TextStyle(
                                            fontSize: 14, color: Colors.grey),
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 45.0),
                            child: Icon(Icons.check_circle_outline),
                          )
                        ],
                      ),
                    ),
                  ]),
            ),
          ),
          Container(
            width: getHorizontalSize(396),
            height: getVerticalSize(50),
            decoration: BoxDecoration(
                color: KColors.greybg, borderRadius: BorderRadius.circular(6)),
            child: const Padding(
              padding: EdgeInsets.only(left: 14.9, right: 14.9),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                // ignore: prefer_const_literals_to_create_immutables
                children: [
                  Text(
                    "Plumber",
                    style: TextStyle(
                        color: Colors.black,
                        fontFamily: "Kadwa",
                        fontWeight: FontWeight.bold,
                        fontSize: 18),
                  ),
                  Icon(Icons.arrow_drop_down_sharp, size: 30)
                ],
              ),
            ),
          ),
          InkWell(
            onTap: showdrop5,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15.0),
              child: Container(
                width: getHorizontalSize(396),
                height: getVerticalSize(50),
                decoration: BoxDecoration(
                    color: KColors.greybg,
                    borderRadius: BorderRadius.circular(6)),
                child: const Padding(
                  padding: EdgeInsets.only(left: 14.9, right: 14.9),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    // ignore: prefer_const_literals_to_create_immutables
                    children: [
                      Text(
                        "Painting",
                        style: TextStyle(
                            color: Colors.black,
                            fontFamily: "Kadwa",
                            fontWeight: FontWeight.bold,
                            fontSize: 18),
                      ),
                      Icon(Icons.arrow_drop_down_sharp, size: 30)
                    ],
                  ),
                ),
              ),
            ),
          ),
        ]),
      ])
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
          ),
            bottomNavigationBar: BottomTabView(3),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
