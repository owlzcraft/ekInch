import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/widget/notifcation_card.dart';
import 'package:ekinch/app/modules/payment/controller/payment_controller.dart';
import 'package:ekinch/app/modules/payment/view/card.dart';
import 'package:ekinch/app/modules/payment/view/widget/stepperData.dart';
import 'package:ekinch/app/modules/payment/view/widget/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../referNearn/views/refer_nearn_view.dart';
import '../../settings/views/settings_view.dart';
import 'package:another_stepper/another_stepper.dart';

class PaymentStatusView extends StatefulWidget {
  PaymentStatusView({super.key});

  @override
  State<PaymentStatusView> createState() => PaymentStatusViewState();
}

class PaymentStatusViewState extends State<PaymentStatusView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  DashboardController dashboardController = Get.put(DashboardController());

  bool status = false;
  List<StepperData> stepperData = [
    StepperDataCard("Plan Name", "Starter Plan"),
    StepperDataCard("Payment Transferred ", "INR 999"),
    StepperDataCard("Subscribe Date", "30 March, 2023"),
    StepperDataCard("Expire Date", "29 March, 2024")
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(260),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(120),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, border: Border.all(color: Colors.black)),
              width: Get.width,
              child: Column(children: [
                SvgPicture.asset(
                  "assets/icons/gcheck.svg",
                  width: 58.sp,
                  height: 58.sp,
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10.0, bottom: 2.0),
                  child: Text(
                    "Payment Successful",
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: F30(),
                        color: Colors.white,
                        fontWeight: FontWeight.w600),
                  ),
                ),
                Text(
                  "Payment has been successfully done your transaction id: #GHDK2345",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      height: 1.2,
                      fontSize: F18(),
                      color: Colors.white,
                      fontWeight: FontWeight.w400),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                )
              ]),
            ),
          ),
          title: Text(
            "",
            style: GoogleFonts.kadwa(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: F24()),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_sharp,
              size: 30.sp,
            ),
            onPressed: () {
              Get.back();
            },
          ),
          actions: [
            IconButton(
              padding: const EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            ),
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),

      backgroundColor: KColors.lightbg,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal:16.0),
                  child: AnotherStepper(
                    iconHeight: 10.sp,
                    iconWidth: 10.sp,
                    stepperList: stepperData,
                    stepperDirection: Axis.vertical,
                    // dotWidget: Container(
                    // padding: EdgeInsets.all(8),
                    // decoration: BoxDecoration(
                    // color: Colors.red,
                    // borderRadius: BorderRadius.all(Radius.circular(30))
                    // ),
                    // child: Icon(Icons.fastfood, color: Colors.white),
                    // ),
                    activeBarColor: Colors.grey,
                    inActiveBarColor: Colors.grey,
                    activeIndex: 3,
                    barThickness: 4,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical:30.0),
                  child: DynamicButton("Back to Dashboard", true, () {
                    dashboardController.GetDashboard();
                  }),
                )
              ]),
        ),
      ),
      bottomNavigationBar: BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
