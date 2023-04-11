import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/widget/notifcation_card.dart';
import 'package:ekinch/app/modules/payment/controller/payment_controller.dart';
import 'package:ekinch/app/modules/payment/view/card.dart';
import 'package:ekinch/app/modules/payment/view/debit_card_view.dart';
import 'package:ekinch/app/modules/payment/view/qr_view.dart';
import 'package:ekinch/app/modules/payment/view/widget/textField.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../referNearn/views/refer_nearn_view.dart';
import '../../settings/views/settings_view.dart';

class PaymentView extends StatefulWidget {
  PaymentView({super.key});

  @override
  State<PaymentView> createState() => _PaymentViewState();
}

class _PaymentViewState extends State<PaymentView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  PaymentController controller = Get.put(PaymentController());
  bool status = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer: SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(190),
        child: AppBar(
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(90),
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
              padding: EdgeInsetsDirectional.only(end: 9.11),
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
                child: Text(
                  "Select Your Method",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kadwa(
                      fontSize: F18(),
                      color: Colors.black,
                      fontWeight: FontWeight.w400),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Column(
                  children: controller.PaymentList.map((e) {
                    int index = controller.PaymentList.indexOf(e);
                    return Obx(() => GestureDetector(
                          onTap: () {
                            controller.activeCategory.value = index;
                            print(controller.activeCategory.value);
                          },
                          child: PaymentCard(
                              data: e,
                              active: index == controller.activeCategory.value
                                  ? true
                                  : false),
                        ));
                  }).toList(),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 16.0, vertical: 30),
                child: DynamicButton("Proceed", true, () {
                  if (controller.activeCategory.value == 0) {
                    Get.to(DebitCardView());
                  } else {
                    if (controller.activeCategory.value == 1) {
                      Get.to(QrCardView());
                    } else {
                      print("pending route");
                    }
                  }
                }),
              ),
            ]),
      ),
      bottomNavigationBar: BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
