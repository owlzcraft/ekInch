import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/job_list/widget/job_card.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/job/job_list/widget/recentJob.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/math_utils.dart';
import '../../../../custom_widget/color.dart';
import '../../../../models/myJobModel.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobsList extends StatefulWidget {
  const JobsList({super.key, required this.userList});
  final List<Data> userList;
  @override
  JobsListState createState() => JobsListState();
}

class JobsListState extends State<JobsList> with TickerProviderStateMixin {
  TabController? _tabController;
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    _tabController = TabController(length: 2, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        bottomNavigationBar: const BottomTabView(2),
        key: scaffoldKey,
        drawer: const SettingsView(),
        appBar: AppBar(
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!scaffoldKey.currentState!.isDrawerOpen) {
                scaffoldKey.currentState!.openDrawer();
              }
            },
          ),
          backgroundColor: Colors.black,
          title: Text(
            AppLocalizations.of(context)!.hireMechanic,
            style:
                GoogleFonts.kadwa(fontSize: F20(), fontWeight: FontWeight.w700),
          ),
          actions: [
            const Icon(
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
            unselectedLabelStyle: GoogleFonts.kadwa(fontSize: F18()),
            labelStyle: GoogleFonts.kadwa(fontSize: F18()),
            tabs: [
              Tab(text: AppLocalizations.of(context)!.availableUsers),
              Tab(text: AppLocalizations.of(context)!.recent)
            ],
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
                          Text(
                            AppLocalizations.of(context)!.sort,
                            style: GoogleFonts.kadwa(
                                color: KColors.textGrey,
                                fontSize: F16(),
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
                            Text(
                              AppLocalizations.of(context)!.filter,
                              style: GoogleFonts.kadwa(
                                  color: KColors.textGrey,
                                  fontSize: F16(),
                                  fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Column(
                children: (widget.userList)
                    .map((e) => JobCardWidget(
                        photo: e.photo.toString(),
                        contactNumber: e.phoneNumber.toString(),
                        dob:
                            "${e.info!.ageDt}/${e.info!.ageMn}/${e.info!.ageYr}",
                        experience:
                            "${e.info!.expYr} ${AppLocalizations.of(context)!.yearsExperience}",
                        gender: e.info!.gender.toString(),
                        language: e.info!.engProfi.toString(),
                        location: e.address.toString(),
                        name: e.firstName.toString(),
                        profession: e.info!.interest.toString(),
                        qualification: e.info!.qualification.toString(),
                        schoolBoard: e.info!.scMed.toString(),
                        skills: e.info!.skillsLst!.join(',')))
                    .toList(),
              )
            ])),

            const RecentJob()

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
