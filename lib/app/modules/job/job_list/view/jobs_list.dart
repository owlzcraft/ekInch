import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/job/job_list/widget/recentJob.dart';
import 'package:flutter_application_00/app/modules/listpostjob/views/review.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_animation_progress_bar/flutter_animation_progress_bar.dart';
import 'package:circle_progress_bar/circle_progress_bar.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../custom_widget/color.dart';
import '../../../settings/views/settings_view.dart';
import '../../profile/view/job_profile.dart';


class JobsList extends StatefulWidget {
  const JobsList({Key? key}) : super(key: key);

  @override
  JobsListState createState() => JobsListState();
}

class JobsListState extends State<JobsList>
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
          elevation: 0,
          centerTitle: true,
          leading:  IconButton(
      icon: SvgPicture.asset(Assets.drawerIcon_white),
      onPressed: () {
        if (!scaffoldKey.currentState!.isDrawerOpen) {
          //check if drawer is closed
          scaffoldKey.currentState!.openDrawer(); //open drawer
        }
      },
    ),
          // InkWell(
          //     onTap: () {
          //       Navigator.pop(context);
          //     },
          //     child: Icon(Icons.arrow_back)),
          backgroundColor: Colors.black,
          title: Text(
            'Job List',
            style: GoogleFonts.kadwa(
                fontSize: 20,  fontWeight: FontWeight.w700),
          ),
          actions: [
            Icon(
              Icons.share_outlined,
              size: 20,
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.05,
            )
          ],
          bottom: TabBar(
            controller: _tabController,
            indicatorColor: yellow,
            indicatorWeight: 3,
            unselectedLabelStyle:TextStyle(fontSize: 16) ,
            labelStyle: TextStyle(fontSize: 16),
            tabs: [Tab(text: "New Jobs (120)"), Tab(text: "Recent (12)")],
          ),
        ),
        backgroundColor: Colors.white,
        body: TabBarView(
          controller: _tabController,
          children: [
            SingleChildScrollView(
          child: Column(children: [
        Container(
          height: getVerticalSize(74),
          width: getHorizontalSize(432),
          color: KColors.greybg,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                height: getVerticalSize(40),
                width: getVerticalSize(100),
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.lightGrey),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(100)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SvgPicture.asset(Assets.filter),
                    const Text(
                      "Sort",
                      style: TextStyle(
                          color: KColors.textGrey,
                          fontSize: 14,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Container(
                  height: getVerticalSize(40),
                  width: getHorizontalSize(100),
                  decoration: BoxDecoration(
                      border: Border.all(color: KColors.lightGrey),
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(100)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SvgPicture.asset(Assets.filter),
                      const Text(
                        "Filter",
                        style: TextStyle(
                            color: KColors.textGrey,
                            fontSize: 14,
                            fontWeight: FontWeight.bold),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: InkWell(
            onTap: () {
              Get.to(JobProfileView());
            },
            child: Container(
                width: Get.width,
                decoration: BoxDecoration(
                    border: Border.all(color: KColors.greyLine),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(4)),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 8.0, right: 8.0, left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Sanjay Singh",
                                      style: GoogleFonts.kadwa(
                                          color: const Color(0xFF1A1D1E),
                                          fontSize: 18,
                                          fontWeight: FontWeight.w400),
                                    ),
                                    Text(
                                      'Carpenter (Certified)',
                                      style: TextStyle(
                                          fontSize: 12,
                                          color: const Color(0xFF6A6A6A)),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(top:4.0),
                                      child: Text(
                                        '1 hours ago',
                                        style: TextStyle(
                                            fontSize: 10,
                                            color: const Color(0xFF6A6A6A)),
                                      ),
                                    ),
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(
                                      top: 8.0, left: 10.0),
                                  child: Container(
                                    // height: getVerticalSize(21),
                                    width: getHorizontalSize(61),
                                    decoration: BoxDecoration(
                                        border:
                                            Border.all(color: KColors.green),
                                        color: KColors.green,
                                        borderRadius:
                                            BorderRadius.circular(100)),
                                    child:  Text(
                                      "New",textAlign: TextAlign.center,
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w100),
                                    ),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding:
                                  const EdgeInsets.only(left: 60.0,),
                              child: Stack(
                               alignment: AlignmentDirectional.center,
                                children: [
                                  SizedBox(
                                    width: 70,
                                    child: CircleProgressBar(
                                      foregroundColor: KColors.green,
                                      backgroundColor: Colors.black12,
                                      value: 0.8,
                                      // child: Text("80")
                                    ),),
                                    Text("80%\nMatch",textAlign: TextAlign.center,)
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Divider(
                          color: KColors.greyLine,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
                        child: Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(right: 40.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.location),
                                      Padding(
                                        padding: const EdgeInsets.only(left:8.0),
                                        child: Text(
                                          "Rorkee",
                                          style: GoogleFonts.kadwa(
                                              color: KColors.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.edu),
                                      Padding(
                                         padding: const EdgeInsets.only(left:8.0),
                                        child: Text(
                                          "Intermediate",
                                          style: GoogleFonts.kadwa(
                                              color: KColors.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Row(
                                    children: [
                                      SvgPicture.asset(Assets.speak),
                                      Padding(
                                         padding: const EdgeInsets.only(left:8.0),
                                        child: Text(
                                          "Good Hindi",
                                          style: GoogleFonts.kadwa(
                                              color: KColors.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.money),
                                    Padding(
                                     padding: const EdgeInsets.only(left:8.0),
                                      child: Text(
                                        "1800-2500/month",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.exp),
                                    Padding(
                                     padding: const EdgeInsets.only(left:8.0),
                                      child: Text(
                                        "3 Years Experience",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.mobile),
                                    Padding(
                                      padding: const EdgeInsets.only(left:8.0),
                                      child: Text(
                                        "+917878787891",
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top:8.0),
                        child: Container(
                            width: Get.width,
                            // height: getVerticalSize(80),
                            decoration: const BoxDecoration(
                                color: KColors.greybg,
                                borderRadius: BorderRadius.only(
                                    bottomLeft: Radius.circular(4),
                                    bottomRight: Radius.circular(4))),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        Padding(
                                          padding: const EdgeInsets.only(top: 3),
                                          child: SvgPicture.asset(
                                            Assets.call,
                                          ),
                                        ),
                                        Text(
                                          "Call",
                                          style: GoogleFonts.kadwa(
                                              color: KColors.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.only(top: 3.0),
                                    child: Column(
                                      mainAxisAlignment: MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(Assets.msg),
                                        Text(
                                          "SMS",
                                          style: GoogleFonts.kadwa(
                                              color: KColors.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  )
                                ],
                              ),
                            ),
                          ),
                      )
                    ])),
          ),
        )
      ])),

            RecentJob()

//             Column(crossAxisAlignment: CrossAxisAlignment.center,
//               children: [

//                 Padding(
//                   padding: const EdgeInsets.only(top: 25.0,),
//                   child: Container(height: MediaQuery.of(context).size.height*0.1,
//                     width: MediaQuery.of(context).size.width*0.4,
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(10),
//                       color: black,
                
//                     ),
//                     child: Center(
//                       child: Row(mainAxisAlignment: MainAxisAlignment.center,
//                       crossAxisAlignment: CrossAxisAlignment.end,
//                         children: [
//                          Padding(
//                                     padding: EdgeInsets.only(bottom: 17),child:SvgPicture.asset("assets/images/star.svg",height: 12,)),
                       
//                         Padding(
//                           padding: const EdgeInsets.only(left:5.0),
//                           child: Text('4.8/',style: TextStyle(color: whitedark,fontSize: 28,fontWeight: FontWeight.w700),),
//                         ),
//                        Padding(
//                                     padding: EdgeInsets.only(bottom: 2),child: Text('5.0',style: TextStyle(color: whitedark,fontSize: 14,fontWeight: FontWeight.w700),),
//                                       )],),
//                     ),
                
                
//                   ),
//                 ),

//  GestureDetector(onTap: (){
//   Navigator.push(context, MaterialPageRoute(builder: (context)=>))
//  },
//    child: Padding(
//      padding: const EdgeInsets.only(top:10,bottom: 15),
//      child: Text('234 user reviews',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: black, decoration: TextDecoration.underline,),),
//    ),
//  ),
// Column(crossAxisAlignment: CrossAxisAlignment.start,
//   children: [
// Padding(padding: EdgeInsets.only(top: 30,bottom: 10,left: 15,right: 15),child: Row(children: [
// Row(mainAxisAlignment: MainAxisAlignment.start,
//   children: [
//         Text('Overall rating',style: TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w700),),
//         SizedBox(width: 3,),
//   SvgPicture.asset("assets/images/star.svg",height: 14),
//   SvgPicture.asset("assets/images/star.svg",height: 14),
//   SvgPicture.asset("assets/images/star.svg",height: 14),
//   SvgPicture.asset("assets/images/whitestar.svg",height: 14),
//   ],
// ),

//                 ],)
//                 ),

//                Padding(
//                  padding: const EdgeInsets.only(top:10.0,left: 15,right: 15,bottom: 5),
//                  child: Text('Tell us more about experience',style: TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w700) ,),
//                ),
//                Padding(
//                  padding: const EdgeInsets.all(15.0),
//                  child: DescriptionLong(
                
//                   hintText:"Type your message here",
//                  ),
//                ),

//                 // SizedBox(
//                 //       height: MediaQuery.of(context).size.height * 0.03,
//                 //     ),
//                     Padding(
//                       padding: const EdgeInsets.all(15.0),
//                       child: Material(
//                           borderRadius: BorderRadius.circular(10.0),
//                           color: yellow,
//                           child: MaterialButton(
//                               minWidth: MediaQuery.of(context).size.width,
//                               onPressed: () {
//                                 //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ()));
//                               },
//                               child: Center(
//                                 child: Text(
//                                   'Submit',
//                                   style: TextStyle(
//                                       color: black,
//                                       fontSize: 18,
//                                       fontFamily: 'Kadwa',
//                                       fontWeight: FontWeight.w700),
//                                 ),
//                               ))),
//                     )

// ],),
 
                
//               ],)

          ],
        ),
      ),
    );
  }
}
