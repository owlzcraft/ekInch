import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/payment/controller/payment_controller.dart';
import 'package:ekinch/app/modules/payment/view/payment_status_view.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class QrCardView extends StatefulWidget {
  const QrCardView({super.key});

  @override
  State<QrCardView> createState() => QrCardViewState();
}

class QrCardViewState extends State<QrCardView> {
  GlobalKey<ScaffoldState> notDrawerKey =  GlobalKey<ScaffoldState>();

  PaymentController controller = Get.put(PaymentController());
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(190),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: const Size.fromHeight(90),
            child: Container(
              decoration: BoxDecoration(
                  color: Colors.black, border: Border.all(color: Colors.black)),
              width: Get.width,
              child: Column(children: [
                Text(
                  "INR 999.00",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.barlow(
                      fontSize: F48(),
                      color: Colors.white,
                      fontWeight: FontWeight.w600),
                ),
                Padding(
                  padding: const EdgeInsets.all(30),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 6.0),
                        child: Image.asset(
                          "assets/images/Icon.png",
                          scale: 1.5,
                        ),
                      ),
                      Text(
                        "You will get one year access in professional video",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.dmSans(
                            fontSize: F14(),
                            color: Colors.white,
                            fontWeight: FontWeight.w500),
                      ),
                    ],
                  ),
                ),
              ]),
            ),
          ),
          title: Text(
            "Payment",
            style: GoogleFonts.kadwa(
                color: Colors.white,
                fontWeight: FontWeight.w700,
                fontSize: F24()),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                notDrawerKey.currentState!.openDrawer(); //open drawer
              }
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/Qr.png",
                      scale: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "QR Code Payment",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.kadwa(
                            fontSize: F20(),
                            color: Colors.black,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                color: Colors.white,
                width: Get.width,
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical:16.0),
                  child: Column(
                    children: [
                      Text(
                        "Scan QR code with your\n mobile device",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: F24(),
                            color: Colors.black,
                            fontWeight: FontWeight.w500),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 8.0),
                        child: Container(
                          width: getHorizontalSize(216),
                          height: getVerticalSize(216),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(6),
                              color: KColors.orange),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Center(
                                child: Image.asset("assets/images/bQr.png")),
                          ),
                        ),
                      ),
                      Text(
                        "INR 999.00",
                        textAlign: TextAlign.center,
                        style: GoogleFonts.poppins(
                            fontSize: F28(),
                            color: Colors.black,
                            fontWeight: FontWeight.w600),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16.0, vertical: 40),
                        child: DynamicButton("Scan to Pay", true, () {
                          Get.to(const PaymentStatusView());
                        }),
                      )
                    ],
                  ),
                ),
              )
            ]),
      ),
      bottomNavigationBar: const BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
