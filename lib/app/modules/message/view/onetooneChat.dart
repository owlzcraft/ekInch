import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../../custom_widget/font_size.dart';
import '../../../generated/assets.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class OneToOneChat extends StatelessWidget {
  String photo;
  String name;
  String profession;
  OneToOneChat(
      {super.key,
      required this.photo,
      required this.name,
      required this.profession});

  @override
  Widget build(BuildContext context) {
    GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

    return Scaffold(
      backgroundColor: Colors.white,
      key: notDrawerKey, drawer: const SettingsView(),
      appBar: AppBar(
        // bottom: PreferredSize(child:  Container(
        //       color: Colors.black,
        //       child: Padding(
        //         padding: const EdgeInsets.symmetric(vertical: 8.0,horizontal: 16.0),
        //         child: Row(
        //           children: [
        //             SizedBox(
        //               height: getVerticalSize(75),
        //               width: getHorizontalSize(75),
        //               child: Stack(
        //                 clipBehavior: Clip.none,
        //                 fit: StackFit.expand,
        //                 children: [
        //                   CircleAvatar(
        //                     radius: 50.sp,
        //                     backgroundColor: Color(0xFFE0E0E0),
        //                     child: CircleAvatar(
        //                       radius: 42.sp,
        //                       backgroundImage: AssetImage(photo),
        //                     ),
        //                   ),
        //                 ],
        //               ),
        //             ),
        //             Padding(
        //               padding: const EdgeInsets.only(left:8.0),
        //               child: Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Text(
        //                     name,
        //                     style: GoogleFonts.kadwa(color: Colors.white,fontWeight:FontWeight.w700,fontSize: F22())
        //                   ),Text(
        //                     profession,

        //                     style: GoogleFonts.kadwa(color: Colors.white,height: 1.2,fontWeight:FontWeight.w100,fontSize: F16())
        //                   )
        //                 ],
        //               ),
        //             )
        //           ],
        //         ),
        //       ),
        //     ), preferredSize: Size.fromHeight(120)),
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () => {}, icon: SvgPicture.asset(Assets.search_icon)),
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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              color: Colors.black,
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
                child: Row(
                  children: [
                    SizedBox(
                      height: getVerticalSize(75),
                      width: getHorizontalSize(75),
                      child: Stack(
                        clipBehavior: Clip.none,
                        fit: StackFit.expand,
                        children: [
                          CircleAvatar(
                            radius: 50.sp,
                            backgroundColor: Color(0xFFE0E0E0),
                            child: CircleAvatar(
                              radius: 42.sp,
                              backgroundImage: AssetImage(photo),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(name,
                              style: GoogleFonts.kadwa(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                  fontSize: F22())),
                          Text(profession,
                              style: GoogleFonts.kadwa(
                                  color: Colors.white,
                                  height: 1.2,
                                  fontWeight: FontWeight.w100,
                                  fontSize: F16()))
                        ],
                      ),
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),

      bottomNavigationBar: BottomTabView(2),

      // bottomNavigationBar: MyNavigator(),
    );
  }
}
