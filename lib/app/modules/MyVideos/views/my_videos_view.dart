import 'dart:developer';

import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/MyVideos/views/widget/new_videoes.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/work.widget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/assets.dart';
import '../../dashboard/widgets/navigation.dart';
import '../controllers/my_videos_controller.dart';

class MyVideosView extends StatefulWidget {
  MyVideosView({Key? key}) : super(key: key);
 

  @override
  State<MyVideosView> createState() => _MyVideosViewState();
  
}

class _MyVideosViewState extends State<MyVideosView> with TickerProviderStateMixin {
  TabController? _tabController;
   @override
  void initState() { 
    super.initState();
        _tabController = new TabController(length: 2, vsync: this);

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('MyVideosView'),
        centerTitle: true,

        title: Text("My Reels",
            style: GoogleFonts.kadwa(
                fontSize: F24(), fontWeight: FontWeight.w700)),
        leading: IconButton(
          icon: Image.asset('assets/images/burger.png', width: 30.sp, height: 30.sp),
          onPressed: () {
            // Add your onPressed code here
          },
        ),
        // Image.asset("assets/images.menu.png"),
        actions: <Widget>[
          SvgPicture.asset(Assets.share_white),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.sp),
            child: SvgPicture.asset(Assets.notification),
          ),
        ],

        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(50),
          child: Padding(
            padding: const EdgeInsets.only(top: 8.0),
            child: TabBar(
              controller: _tabController,
              indicatorColor: KColors.orange,
              indicatorWeight: 3,
              unselectedLabelStyle: GoogleFonts.kadwa(fontSize: F18()),
              labelStyle: GoogleFonts.kadwa(fontSize: F18()),
              tabs: [Tab(text: "New Videoes "), Tab(text: "All Videoes")],
            ),
          ),
          // Container(
          //   padding: EdgeInsets.all(10),
          //   color: Colors.white,
          //   child: TextField(
          //     decoration: InputDecoration(
          //         prefixIcon: Icon(Icons.search),
          //         hintText: 'Search...',
          //         border: const OutlineInputBorder(
          //             borderSide: BorderSide(color: Color(0xFFCDCDCD)))),
          //     onChanged: (text) {
          //       // Update search results based on text input
          //     },
          //   ),
          // ),
        ),
      ),
      body: TabBarView(
          controller: _tabController,
          children: [
           NewVideo(videoV: "4", videoU: '6',),
           NewVideo(videoU: '', videoV: '',)
            // RequestList(noData: noData),
          ],
        ),
      
      bottomNavigationBar: BottomTabView(1),

      // bottomNavigationBar: MyNavigator(),
    );
  }
}
