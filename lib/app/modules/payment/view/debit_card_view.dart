import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/payment/controller/payment_controller.dart';
import 'package:ekinch/app/modules/payment/view/payment_status_view.dart';
import 'package:ekinch/app/modules/payment/view/widget/textField.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../notication/view/notification_view.dart';
import '../../settings/views/settings_view.dart';

class DebitCardView extends StatefulWidget {
  const DebitCardView({super.key});

  @override
  State<DebitCardView> createState() => DebitCardViewState();
}

class DebitCardViewState extends State<DebitCardView> {
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
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    Image.asset(
                      "assets/images/bwallet.png",
                      scale: 2.0,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 8.0),
                      child: Text(
                        "Debit Card Details",
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
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 3.0),
                          child: Text(
                            "Enter your payment details",
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: F18(),
                                color: Colors.black,
                                fontWeight: FontWeight.w500),
                          ),
                        ),
                        TextFieldPayment(
                          "Card Holder Name",
                          "Enter card holder name",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 12.0),
                          child: TextFieldPayment(
                            "Card Number",
                            "xxxx -  xxxx -  xxxx - xxxx",
                          ),
                        ),
                        TextFieldPayment(
                          "Expiry Date",
                          "MM/YY",
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Save My Card Details",
                                textAlign: TextAlign.center,
                                style: GoogleFonts.lato(
                                    fontSize: F16(),
                                    color: KColors.textGrey,
                                    fontWeight: FontWeight.w500),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 100.0),
                                child: FlutterSwitch(
                                  width: getHorizontalSize(63),
                                  height: getVerticalSize(31),
                                  valueFontSize: 15.0,
                                  toggleSize: 25.0,
                                  value: status,
                                  borderRadius: 30.0,
                                  padding: 0.0,
                                  showOnOff: false,
                                  onToggle: (val) {
                                    setState(() {
                                      status = val;
                                    });
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(6),
                            color: Colors.white,
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: KColors.lightGrey,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                          ),
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
                            child: Row(
                              mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                              children: [
                                Text(
                                  "INR 999.00",
                                  textAlign: TextAlign.center,
                                  style: GoogleFonts.poppins(
                                      fontSize: F28(),
                                      color: Colors.black,
                                      fontWeight: FontWeight.w600),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(left: 12.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(const PaymentStatusView());
                                    },
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(6),
                                        color: KColors.orange,
                                      ),
                                      width: getHorizontalSize(162),
                                      height: getVerticalSize(52),
                                      child: Center(
                                        child: Text(
                                          "Pay Now",
                                          textAlign: TextAlign.center,
                                          style: GoogleFonts.kadwa(
                                              fontSize: F24(),
                                              color: Colors.black,
                                              fontWeight: FontWeight.w700),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        )
                      ]),
                ),
              ),
            ]),
      ),
      bottomNavigationBar: const BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
