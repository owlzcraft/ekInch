import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/listpostjob/views/jobDescription.dart';
import 'package:flutter_application_00/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../../../custom_widget/dash_header.dart';
import '../../../generated/assets.dart';
import '../../dashboard/widgets/bottomNavigate.wodget.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class JobView extends StatefulWidget {
  const JobView({super.key});

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
        leading:
         IconButton(
      icon: SvgPicture.asset(Assets.drawerIcon_white),
      onPressed: () {
        if (!scaffoldKey.currentState!.isDrawerOpen) {
          //check if drawer is closed
          scaffoldKey.currentState!.openDrawer(); //open drawer
        }
      },
    ),
        //  Image.asset(
        //   'assets/images/menu.png',
        //   cacheHeight: 18,
        // ),
        title: Text(
          'Ek Inch',
          style: TextStyle(
              fontSize: 18, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
        ),
        actions: [
          SvgPicture.asset(
            "assets/images/heart.svg",
            height: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.03,
          ),
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
                padding:
                    EdgeInsets.only(left: 15.0, right: 15, top: 10, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(height: 50,
                     width: Get.width / 1.4,
                      child: TextFeildWhite(
                        controller: _searchcontroller,
                        hintText: 'Job, location and other',
                      ),
                    ),
                    // SizedBox(
                    //   width: MediaQuery.of(context).size.width * 0.07,
                    // ),
                    Container(
                      width: 50,
                      height: 50,
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
            // Container(
            //   color: whitedark,
            //   height: 80,
            //   child: Column(
            //     crossAxisAlignment: CrossAxisAlignment.start,
            //     children: [
            //       Padding(
            //         padding: EdgeInsets.all(15.0),
            //         child: Row(
            //           mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //           children: [
            //             OutlinedButton(
            //                 style: OutlinedButton.styleFrom(
            //                   backgroundColor: yellow,
            //                   side: BorderSide.none,
            //                   fixedSize: Size(170, 0),
            //                   shape: StadiumBorder(),
            //                 ),
            //                 onPressed: () {},
            //                 child: Row(
            //                   mainAxisAlignment: MainAxisAlignment.center,
            //                   children: [
            //                     Text(
            //                       'Upload Resume',
            //                       style: TextStyle(
            //                           color: black,
            //                           fontSize: 14,
            //                           fontFamily: "Kadwa",
            //                           fontWeight: FontWeight.w700),
            //                     ),
            //                     SizedBox(
            //                       width:
            //                           MediaQuery.of(context).size.width * 0.03,
            //                     ),
            //                     SvgPicture.asset(
            //                       'assets/images/upload.svg',
            //                       height: 15,
            //                     ),
            //                   ],
            //                 )),
            //             Text(
            //               '35 Jobs',
            //               style: TextStyle(
            //                   color: black,
            //                   fontSize: 16,
            //                   fontFamily: "Kadwa",
            //                   fontWeight: FontWeight.w400),
            //             ),
            //           ],
            //         ),
            //       ),
            //       // Expanded(child: ()),
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  EdgeInsets.only(left: 10.0, right: 15, top: 15, bottom: 20),
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(right:5.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SizedBox(height: 40,
                         width: Get.width / 2.4,
                          child: Dropdownshort(
                            dropdownvalue: 'Full-time job',
                            items: [
                              'Full-time job',
                              'Part-time job',
                            ],
                          ),
                        ),
                        // SizedBox(
                        //   width: MediaQuery.of(context).size.width * 0.5,
                        // ),
                        SvgPicture.asset(
                          
                          "assets/images/refresh.svg",
                          color: grey,
                        )
                      ],
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => JobDescription()));
                    },
                    child: Container(
                     // height: MediaQuery.of(context).size.height * 0.4,
                      width: MediaQuery.of(context).size.width,
                      child: Card(
                        elevation: 1,
                        color: whitedark,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 10, top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child:
                                        Image.asset('assets/images/ultra1.png'),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(left: 5),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Plumber Engineer',
                                                  style: TextStyle(
                                                      fontSize: 16,
                                                      fontFamily: 'Kadwa',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                                Text(
                                                  'UltraTech Cement, India',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: greylight,
                                                      fontFamily: 'Kadwa',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                            SizedBox(
                                              width: 15,
                                            ),
                                            Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.end,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              children: [
                                                Icon(Icons.share_outlined,
                                                    color: greylightdark,
                                                    size: 18),
                                                SizedBox(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.02,
                                                ),
                                                Text(
                                                  '2 days ago',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: greylightdark,
                                                      fontFamily: 'Kadwa',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.02,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SvgPicture.asset(
                                                'assets/images/grad.svg'),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Text(
                                              '10th Pass - 2 years  experience',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: greylight,
                                                  fontFamily: 'Kadwa',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            SvgPicture.asset(
                                                'assets/images/money.svg'),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.03,
                                            ),
                                            Text(
                                              '1800-2500/month',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: greylight,
                                                  fontFamily: 'Kadwa',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02,
                                            ),
                                            Row(
                                              children: [
                                                SvgPicture.asset(
                                                    'assets/images/location.svg'),
                                                Text(
                                                  'Rorkee',
                                                  style: TextStyle(
                                                      fontSize: 12,
                                                      color: greylight,
                                                      fontFamily: 'Kadwa',
                                                      fontWeight:
                                                          FontWeight.w400),
                                                ),
                                              ],
                                            )
                                          ],
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.01,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            SvgPicture.asset(
                                                'assets/images/seak.svg'),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.01,
                                            ),
                                            Text(
                                              'Good speak hindi and write',
                                              style: TextStyle(
                                                  fontSize: 12,
                                                  color: greylight,
                                                  fontFamily: 'Kadwa',
                                                  fontWeight: FontWeight.w400),
                                            ),
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.02,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),

                              Divider(
                                color: Boxborder,
                                thickness: 0.5,
                              ),
                              SizedBox(
                                height:
                                    MediaQuery.of(context).size.height * 0.02,
                              ),
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Row(
                                    children: [
                                      Image.asset("assets/images/group.png"),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.02,
                                      ),
                                      Text(
                                        '200 views',
                                        style: TextStyle(
                                            fontSize: 12,
                                            color: greylight,
                                            fontWeight: FontWeight.w400,
                                            fontFamily: "Kadwa"),
                                      ),
                                    ],
                                  ),
                                  OutlinedButton(
                                    style: OutlinedButton.styleFrom(
                                      side: BorderSide(color: black, width: 1),
                                      fixedSize: Size(130, 0),
                                      shape: StadiumBorder(),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                      'Read More',
                                      style: TextStyle(
                                          color: black,
                                          fontSize: 14,
                                          fontFamily: "Kadwa",
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              )

//                         CircleAvatar(
// backgroundColor: whitedark,
//                           child:  Stack(
//                             alignment: Alignment(1, 1),
//                             children: <Widget>[
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png")
//
//
//
//                             ],
//                           ),
//                         ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height * 0.02,
                  ),
                  Container(
                   // height: MediaQuery.of(context).size.height * 0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Card(
                      elevation: 1,
                      color: whitedark,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 15.0, right: 10, top: 15, bottom: 15),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(top: 5.0),
                                  child:
                                      Image.asset('assets/images/ultra1.png'),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Text(
                                                'Plumber Engineer',
                                                style: TextStyle(
                                                    fontSize: 16,
                                                    fontFamily: 'Kadwa',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                              Text(
                                                'UltraTech Cement, India',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: greylight,
                                                    fontFamily: 'Kadwa',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                           SizedBox(
                                              width: 15,
                                            ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.end,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Icon(Icons.share_outlined,
                                                  color: greylightdark,
                                                  size: 18),
                                              SizedBox(
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .height *
                                                    0.02,
                                              ),
                                              Text(
                                                '2 days ago',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: greylightdark,
                                                    fontFamily: 'Kadwa',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.02,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset(
                                              'assets/images/grad.svg'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          Text(
                                            '10th Pass - 2 years  experience',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: greylight,
                                                fontFamily: 'Kadwa',
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/money.svg'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.03,
                                          ),
                                          Text(
                                            '1800-2500/month',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: greylight,
                                                fontFamily: 'Kadwa',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                          Row(
                                            children: [
                                              SvgPicture.asset(
                                                  'assets/images/location.svg'),
                                              Text(
                                                'Rorkee',
                                                style: TextStyle(
                                                    fontSize: 12,
                                                    color: greylight,
                                                    fontFamily: 'Kadwa',
                                                    fontWeight:
                                                        FontWeight.w400),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.01,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          SvgPicture.asset(
                                              'assets/images/seak.svg'),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.01,
                                          ),
                                          Text(
                                            'Good speak hindi and write',
                                            style: TextStyle(
                                                fontSize: 12,
                                                color: greylight,
                                                fontFamily: 'Kadwa',
                                                fontWeight: FontWeight.w400),
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.02,
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),

                            Divider(
                              color: Boxborder,
                              thickness: 0.5,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.02,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset("assets/images/group.png"),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.02,
                                    ),
                                    Text(
                                      '200 views',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: greylight,
                                          fontWeight: FontWeight.w400,
                                          fontFamily: "Kadwa"),
                                    ),
                                  ],
                                ),
                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(
                                    side: BorderSide(color: black, width: 1),
                                    fixedSize: Size(130, 0),
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 14,
                                        fontFamily: "Kadwa",
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ],
                            )

//                         CircleAvatar(
// backgroundColor: whitedark,
//                           child:  Stack(
//                             alignment: Alignment(1, 1),
//                             children: <Widget>[
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png")
//
//
//
//                             ],
//                           ),
//                         ),
                          ],
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
    );
  }
}
