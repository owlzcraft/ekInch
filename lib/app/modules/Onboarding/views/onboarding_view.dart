// ignore_for_file: avoid_types_as_parameter_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ekinch/app/modules/Onboarding/controllers/onboarding_controller.dart';
import 'package:ekinch/app/modules/Onboarding/widgets/onboardingcontent.dart';
import 'package:ekinch/app/modules/mobile/views/mobile_view.dart';
import 'package:ekinch/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class OnboardingView extends GetView<OnboardingController> {
  @override
  final OnboardingController controller = Get.put(OnboardingController());
  final pageController = PageController();

  OnboardingView({super.key});
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
                  controller.saveWalkthrough();
                  Get.toNamed(Routes.MOBILE);
                },
                child: Text('${AppLocalizations.of(context)!.skip} >>',
                    style: GoogleFonts.kadwa(
                        fontSize: F20(), color: const Color(0xFFE55425))),
              )),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Container(
        color: Colors.black,
        child: Container(
          height: (Get.height / 1.44).sp,
          decoration: const BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40))),
          child: PageView(
            controller: pageController,
            children: [
              onBoradingContent(
                  AppLocalizations.of(context)!.onboardingTitleOne,
                  AppLocalizations.of(context)!.onboardingSubtitleOne,
                  "assets/images/onboarding1.png"),
              onBoradingContent(
                  AppLocalizations.of(context)!.onboardingTitleTwo,
                  AppLocalizations.of(context)!.onboardingSTwo,
                  "assets/images/onboarding2.png"),
              onBoradingContent(
                  AppLocalizations.of(context)!.onboardingTThree,
                  AppLocalizations.of(context)!.onboardingSThree,
                  "assets/images/onboarding3.png"),
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
                (pageController.page == 2.0)
                    ? Get.to(
                        const MobileView(),
                        transition: Transition.leftToRight,
                      )
                    : pageController.nextPage(
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
