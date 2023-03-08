import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/listpostjob/views/review.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/assets.dart';
import '../../settings/views/settings_view.dart';

class JobDescription extends StatefulWidget {
  const JobDescription({Key? key}) : super(key: key);

  @override
  JobDescriptionState createState() => JobDescriptionState();
}

class JobDescriptionState extends State<JobDescription>
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
            'UltraTech',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
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
            unselectedLabelStyle:TextStyle(fontSize: 14) ,
            labelStyle: TextStyle(fontSize: 14),
            tabs: [Tab(text: "Details"), Tab(text: "Reviews")],
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
                  children: [
                    Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text('Plumber Engineer',
                                style: TextStyle(
                                    fontSize: 16,
                                    fontFamily: 'Kadwa',
                                    fontWeight: FontWeight.w400)),
                            Text('UltraTech Cement, India',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Kadwa',
                                    fontWeight: FontWeight.w400,
                                    color: greylight))
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.location_on_outlined,
                              color: grey,
                            ),
                            Text('Rorkee, India',
                                style: TextStyle(
                                    fontSize: 14,
                                    fontFamily: 'Kadwa',
                                    fontWeight: FontWeight.w400,
                                    color: greylight))
                          ],
                        )
                      ],
                    ),
                    Container(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.all(
                             15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Job Title',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    'Plumber Engineer',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'In Hand Salary',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    '15000-20000',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Qualification',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    '10th Pass',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Language',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    'Hindi',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Required',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    'Plumbing and Pump Fitting',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Job Info',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    'Good in Plumbing and home \n basic work of plumbing',
                                    textAlign: TextAlign.start,
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Experience',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    '1-2 Years',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Other Details',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: black,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Job Timing',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    '10am to 6pm | Mon to Sat',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Interview Timing ',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    '10am to 6pm | Friday',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      'Company Address',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          color: black,
                          fontSize: 14),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      child: Card(
                        elevation: 2,
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5)),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.0, right: 15, top: 15, bottom: 15),
                          child: Column(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.3,
                                      child: Text(
                                        'Address',
                                        style: TextStyle(
                                            fontSize: 12,
                                            fontFamily: 'Kadwa',
                                            fontWeight: FontWeight.w400),
                                      )),
                                  SizedBox(
                                    width: MediaQuery.of(context).size.width *
                                        0.03,
                                    child: Text(
                                      ":",
                                      style: TextStyle(color: greylight),
                                    ),
                                  ),
                                  Text(
                                    'Rorkee, Uttrakhand',
                                    style: TextStyle(
                                        color: greylight,
                                        fontSize: 12,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w400),
                                  )
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.03,
                    ),
                    Material(
                        borderRadius: BorderRadius.circular(10.0),
                        color: yellow,
                        child: MaterialButton(
                            minWidth: MediaQuery.of(context).size.width,
                            onPressed: () {
                              //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ()));
                            },
                            child: Center(
                              child: Text(
                                'Apply Now',
                                style: TextStyle(
                                    color: black,
                                    fontSize: 18,
                                    fontFamily: 'Kadwa',
                                    fontWeight: FontWeight.w700),
                              ),
                            ))),
                  ],
                ),
              ),
            ),

            Review()

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
