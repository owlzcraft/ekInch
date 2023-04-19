import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';

import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../custom_widget/color.dart';
import '../../../utils/localStorage.dart';
import '../../../utils/math_utils.dart';
import '../../mobile/views/mobile_view.dart';
import '../../mobile/widget/yellow_button.dart';
import '../../profile/controllers/profile_controller.dart';
import '../controllers/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends StatefulWidget {
  OtpView();

  @override
  State<OtpView> createState() => _OtpViewState();
}

class _OtpViewState extends State<OtpView> {
  OtpController controller = Get.put(OtpController());
  ProfileController profileController = Get.put(ProfileController());

  @override
  var state;
  void initState() {
    super.initState();
    setState(() {
      if (Get.arguments[1] == "Update") {
        print(Get.arguments);
        state = false;
      } else {
        state = true;
      }
    });
  }

  final _globalKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          state
              ? Padding(
                  padding: const EdgeInsets.only(
                    left: 16.0,
                    right: 16.0,
                    top: 25.0,
                  ),
                  child: InkWell(
                    onTap: (() {
                      Get.to(MobileView());
                    }),
                    child: Text(
                      'Change Number',
                      style: GoogleFonts.poppins(
                          color: Color(0xFFE55425), fontSize: F20()),
                    ),
                  ),
                )
              : Text(""),
        ],
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Verify Mobile Number",
                style: GoogleFonts.kadwa(
                    fontWeight: FontWeight.w700,
                    fontSize: F32(),
                    color: Color(0xFF525252)),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                "Enter OTP sent to your mobile number \n ${Get.arguments[0]}",
                style: GoogleFonts.kadwa(
                    fontSize: F20(), color: Color(0xFF767676), height: 1.4),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Form(
                  key: _globalKey,
                  child: PinCodeTextField(
                    enablePinAutofill: true,
                    autoDismissKeyboard: true,
                    keyboardType: TextInputType.number,
                    textStyle: TextStyle(fontSize: 30),
                    autoDisposeControllers: false,
                    // autovalidateMode: AutovalidateMode.always,
                    autoFocus: true,
                    validator: ((value) {
                      if (value!.isEmpty) {
                        return "Please Enter Valid Otp";
                      } else {
                        return null;
                      }
                    }),
                    pinTheme: PinTheme.defaults(
                        selectedColor: KColors.orange,
                        inactiveFillColor: KColors.lightGrey,
                        inactiveColor: KColors.lightGrey,
                        shape: PinCodeFieldShape.box,
                        borderRadius: BorderRadius.circular(5),
                        fieldHeight: getVerticalSize(90),
                        fieldWidth: Get.width / 5.5),
                    // controller: otpController.otp,
                    length: 4,
                    onChanged: (value) {
                      if (Get.arguments[1]=="Update") {
                        profileController.otp.text = value;
                      }
                      else {controller.otp.value = value;}
                    },
                    appContext: (context),
                  ),
                ),
              ),

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Resend OTP in ? ",
                    style: GoogleFonts.kadwa(
                        color: Color(0xFF898989),
                        fontWeight: FontWeight.w500,
                        fontSize: F22()),
                  ),
                  Obx((() => Center(
                        child: controller.time.value == '00:01'
                            ? InkWell(
                                onTap: () {
                                  controller.resendOtp(
                                      Get.arguments[0], Get.arguments[1]);
                                  controller.startTimer(60);
                                },
                                child: Text(
                                  "Send",
                                  style: GoogleFonts.kadwa(
                                      color: Color(0xFFFEBA0F),
                                      fontWeight: FontWeight.w500,
                                      fontSize: F22()),
                                ),
                              )
                            : Text(
                                '${controller.time.value}',
                                style: GoogleFonts.poppins(
                                    color: Color(0xFFFEBA0F),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 20),
                              ),
                      ))),
                ],
              ),
              SizedBox(
                height: getVerticalSize(40),
              ),
              GFButton(
                onPressed: () {
                  check();
                },
                color: KColors.orange,
                fullWidthButton: true,
                size: 50.2,
                text: "Verify",
                textStyle: GoogleFonts.kadwa(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: F20()),
                // shape: GFButtonShape.standard,
              ),
              // DynamicButton("Verify", true, () {
              //   Get.to(RegisterView());
              // })
            ]),
      ),
    );
  }

  void check() {
    final _isValid = _globalKey.currentState!.validate();
    if (_isValid == true) {
      if (Get.arguments[1]=="Update") {
        profileController.VerifyPhoneNumber(Get.arguments[0]);
      } else {
        controller.verifyOtp();
      }
    } else {
      errorSnackbar("Please Enter OTP ");
    }
  }
}
