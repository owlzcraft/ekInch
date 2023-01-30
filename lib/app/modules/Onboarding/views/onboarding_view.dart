import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_00/app/modules/Onboarding/controllers/onboarding_controller.dart';
import 'package:flutter_application_00/app/modules/Onboarding/widgets/onboardingcontent.dart';
import 'package:flutter_application_00/app/modules/mobile/views/mobile_view.dart';
import 'package:flutter_application_00/app/modules/register/views/register.view.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class OnboardingView extends GetView<OnboardingController> {
  OnboardingController controller = Get.put(OnboardingController());
  final pageController = PageController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        systemOverlayStyle: const SystemUiOverlayStyle(
          statusBarIconBrightness: Brightness.dark,
        ),
        actions: [
          Padding(
              padding: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 10.sp),
              child: GestureDetector(
                onTap: () {
                  Get.to(MobileView());
                },
                child: Text('Skip >>',
                    style: TextStyle(fontSize: 18, color: Color(0xFFE55425))),
              )),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black,
        child: Container(
          height: (Get.height / 1.44).sp,
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: PageView(
            controller: pageController,
            children: [
              onBoradingContent(
                  controller.onBoardingData[0]['text_1'].toString(),
                  controller.onBoardingData[0]['text_2'].toString(),
                  controller.onBoardingData[0]['text_3'].toString(),
                  controller.onBoardingData[0]['text_4'].toString(),
                  controller.onBoardingData[0]['image'].toString()),
              onBoradingContent(
                  controller.onBoardingData[1]['text_1'].toString(),
                  controller.onBoardingData[1]['text_2'].toString(),
                  controller.onBoardingData[1]['text_3'].toString(),
                  controller.onBoardingData[1]['text_4'].toString(),
                  controller.onBoardingData[1]['image'].toString()),
              onBoradingContent(
                  controller.onBoardingData[2]['text_1'].toString(),
                  controller.onBoardingData[2]['text_2'].toString(),
                  controller.onBoardingData[2]['text_3'].toString(),
                  controller.onBoardingData[2]['text_4'].toString(),
                  controller.onBoardingData[2]['image'].toString()),
            ],
          ),
        ),
      ),
      bottomSheet: Container(
        padding: EdgeInsets.symmetric(
            horizontal: 30.sp, vertical: (Get.height / 15.2).sp),
        decoration: const BoxDecoration(color: Colors.black),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            SmoothPageIndicator(
              effect: const SlideEffect(
                  activeDotColor: Color(0xFFFEBA0F),
                  paintStyle: PaintingStyle.stroke,
                  dotColor: Color(0xFFFEBA0F)),
              onDotClicked: (int) {
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              controller: pageController,
              count: 3,
            ),
            GestureDetector(
              onTap: () {
                (pageController.page == 2.0) ? Get.to(MobileView()) :
                pageController.nextPage(
                    duration: const Duration(milliseconds: 500),
                    curve: Curves.easeInOut);
              },
              child: CircleAvatar(
                backgroundColor: const Color(0xFFFEBA0F),
                radius: 35.sp,
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35.sp,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
