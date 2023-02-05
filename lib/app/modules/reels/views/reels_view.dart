import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/work.widget.dart';
import 'package:flutter_application_00/app/modules/reels/views/video.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class ReelsView extends StatefulWidget {
  const ReelsView({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}

class _VideoAppState extends State<ReelsView> {
  // const ReelsView({Key? key}) : super(key: key);
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
    @override
    _VideoAppState createState() => _VideoAppState();
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
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const VideoWidget(
                  "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: Container(
                        width: 80,
                        height: 20,
                        decoration: BoxDecoration(
                            color: const Color(0xFFFEBA0F),
                            borderRadius: BorderRadius.circular(20)),
                        child: const Center(
                          child: Text(
                            "Civil Work",
                            style: TextStyle(
                                fontWeight: FontWeight.w500, fontSize: 12),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          "Cement Mortar",
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 25),
                        ),
                        IntrinsicHeight(
                          child: Row(
                            children: [
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 5.0),
                                child: SvgPicture.asset(Assets.like_icon),
                              ),
                              const Text(
                                "4.2k",
                                style: TextStyle(color: Color(0xFF767676)),
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
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.0),
                                child: Text(
                                  "125 ",
                                  style: TextStyle(color: Color(0xFF767676)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    const Padding(
                      padding: EdgeInsets.symmetric(vertical: 5.0),
                      child: Text(
                        "12,765 views",
                        style: TextStyle(color: Color(0xFF767676)),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10.0),
                      child: IntrinsicHeight(
                        child: Row(
                          children: [
                            const CircleAvatar(
                              radius: 34,
                              backgroundColor: Color(0xFFE0E0E0),
                              child: CircleAvatar(
                                radius: 30,
                                backgroundImage:
                                    AssetImage("assets/images/profile.jpg"),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Sanjay Singh",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(
                                      top: 5.0,
                                    ),
                                    child: Text(
                                      "Electrician Mechanic",
                                      style:
                                          TextStyle(color: Color(0xFF6A6A6A)),
                                    ),
                                  )
                                ],
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: VerticalDivider(
                                color: Color(0xFF767676),
                                width: 3,
                                thickness: 1,
                              ),
                            ),
                            SvgPicture.asset(Assets.calender_icon),
                            const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 5.0),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "22-10-2022",
                                    style: TextStyle(fontSize: 20),
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(top: 5.0),
                                    child: Text(
                                      "Last Update",
                                      style:
                                          TextStyle(color: Color(0xFF6A6A6A)),
                                    ),
                                  )
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
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 10.0),
                child: Divider(
                  color: KColors.greyLine,
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
               Container(
                padding: EdgeInsets.all(10.0.sp),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Plaster',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      '6 videos',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0.sp),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Concrete Wrok',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      '7 videos',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(10.0.sp),
                margin: EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'Chokhat',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                    const Text(
                      '4 videos',
                      style: TextStyle(
                          fontSize: 18,
                          color: Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.symmetric(horizontal: 10.sp),
                child: Row(
                  children: [
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg'),
                    work(image: 'assets/images/sample_thumb.jpg')
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavigator(),
    );
  }
}
