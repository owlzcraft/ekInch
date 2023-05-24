import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../dashboard/widgets/navigation.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({Key? key}) : super(key: key);

  @override
  VideoAppState createState() => VideoAppState();
}

class VideoAppState extends State<ReelsView> {
  //  ReelsView({Key? key}) : super(key: key);
  @override
  // void initState() {
  //   super.initState();
  //   _controller = VideoPlayerController.network(
  //     'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
  //   )..initialize().then((_) {
  //       setState(() {});
  //     });
  // }
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   leading: Icon(Icons.arrow_back),
      //   actions: [
      //     Icon(
      //       Icons.share,
      //     ),
      //     Icon(Icons.notification_add_outlined)
      //   ],
      // ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: getVerticalSize(280),
              color: Colors.black,
            ),
            //  VideoWidget(
            //     "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: Container(
                      width: 80.sp,
                      height: 20.sp,
                      decoration: BoxDecoration(
                          color: const Color(0xFFFEBA0F),
                          borderRadius: BorderRadius.circular(20)),
                      child: Center(
                        child: Text(
                          "Civil Work",
                          style: GoogleFonts.kadwa(
                              fontWeight: FontWeight.w400, fontSize: F12()),
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Cement Mortar",
                            style: GoogleFonts.kadwa(
                                height: 1.1,
                                fontWeight: FontWeight.w700,
                                fontSize: F24()),
                          ),
                          Text(
                            "12,765 views",
                            style: GoogleFonts.kadwa(
                                fontSize: F14(),
                                color: const Color(0xFF767676)),
                          ),
                        ],
                      ),
                      IntrinsicHeight(
                        child: Row(
                          children: [
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 5.0),
                              child: SvgPicture.asset(Assets.like_icon),
                            ),
                            Text(
                              "4.2k",
                              style: GoogleFonts.kadwa(
                                  color: const Color(0xFF767676)),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: VerticalDivider(
                                color: Color(0xFF767676),
                                width: 5,
                                thickness: 1,
                              ),
                            ),
                            SvgPicture.asset(
                              Assets.dislike_icon,
                            ),
                            Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 3.0),
                              child: Text(
                                "125",
                                style: GoogleFonts.kadwa(
                                    color: const Color(0xFF767676)),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 10.0),
                    child: IntrinsicHeight(
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: CircleAvatar(
                              radius: 30.sp,
                              backgroundColor: const Color(0xFFE0E0E0),
                              child: CircleAvatar(
                                radius: 28.sp,
                                backgroundImage: const AssetImage(
                                    "assets/images/profile.jpg"),
                              ),
                            ),
                          ),
                          Expanded(
                            flex: 5,
                            child: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 8.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sanjay Singh",
                                    style: GoogleFonts.kadwa(
                                        fontSize: F16(), height: 1.2),
                                  ),
                                  Text(
                                    "Electrician Mechanic",
                                    style: GoogleFonts.kadwa(
                                        fontSize: 12,
                                        color: const Color(0xFF6A6A6A)),
                                  )
                                ],
                              ),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 3.0),
                            child: VerticalDivider(
                              color: Color.fromARGB(255, 167, 165, 165),
                              width: 1,
                              thickness: 1,
                            ),
                          ),
                          Expanded(
                              child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 4.0),
                            child: SvgPicture.asset(Assets.calender_icon),
                          )),
                          Expanded(
                            flex: 3,
                            child: Padding(
                              padding: const EdgeInsets.only(left: 8.0),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "22-10-2022",
                                    style: GoogleFonts.kadwa(
                                        height: 1.2, fontSize: F16()),
                                  ),
                                  Text(
                                    "Last Update",
                                    style: GoogleFonts.kadwa(
                                        fontSize: 12,
                                        color: const Color(0xFF6A6A6A)),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
            const Divider(
              color: KColors.greyLine,
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //   child: Row(
            //     children: [
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg')
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plaster',
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w700, fontSize: F18()),
                  ),
                  Text(
                    '6 videos',
                    style: GoogleFonts.kadwa(
                        fontSize: F18(),
                        color: const Color(0xFF767676),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //   child: Row(
            //     children: [
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg')
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plaster',
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w700, fontSize: F18()),
                  ),
                  Text(
                    '6 videos',
                    style: GoogleFonts.kadwa(
                        fontSize: F18(),
                        color: const Color(0xFF767676),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //   child: Row(
            //     children: [
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg')
            //     ],
            //   ),
            // ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Plaster',
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w700, fontSize: F18()),
                  ),
                  Text(
                    '6 videos',
                    style: GoogleFonts.kadwa(
                        fontSize: F18(),
                        color: const Color(0xFF767676),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
            ),
            // SingleChildScrollView(
            //   scrollDirection: Axis.horizontal,
            //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
            //   child: Row(
            //     children: [
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg'),
            //       work(image: 'assets/images/sample_thumb.jpg')
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabView(1),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
