
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/mobile/views/mobile_view.dart';
import 'package:flutter_application_00/app/modules/register/views/register.view.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../custom_widget/color.dart';
import '../../mobile/widget/yellow_button.dart';
import '../controllers/otp_controller.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpView extends GetView<OtpController> {
  final String mobile_number;
  OtpView({this.mobile_number = ""});
  var EnteredOTP = '';
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());
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
            Padding(
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
                  style: GoogleFonts.poppins(color: Color(0xFFE55425), fontSize: 18),
                ),
              ),
            ),
          ],
          elevation: 0,
        ),
        body: Padding(
          padding: const EdgeInsets.all(25.0),
          child: 
             Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Verify Mobile Number",
                    style: GoogleFonts.kadwa(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Color(0xFF525252)),
                  ),
                  SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Enter OTP sent to your mobile number \n 86453656272",
                    style: GoogleFonts.kadwa(
                        fontSize: 18, color: Color(0xFF767676), height: 1.4),
                  ),
                  
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Form(
                       key: _globalKey,
                      child: PinCodeTextField(
                        keyboardType: TextInputType.number,
                        textStyle: TextStyle(fontSize: 30),
                        autoDisposeControllers: false,
                        autovalidateMode: AutovalidateMode.always,
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
                        // controller: verifyOtpController.otpCode,
                        length: 4,
                        onChanged: (value) {
                          // controller.otpCode.value = value;
                        },
                        appContext: (context),
                      ),
                    ),
                  ),
                  // OtpTextField(
                  //   fieldWidth: Get.width / 5.5,
                  //   margin: const EdgeInsets.symmetric(horizontal: 7),
                  //   decoration: const InputDecoration(),
                  //   styles: [
                  //     const TextStyle(fontSize: 36),
                  //     const TextStyle(fontSize: 36),
                  //     const TextStyle(fontSize: 36),
                  //     const TextStyle(fontSize: 36)
                  //   ],
                  //   numberOfFields: 4,
                  //   borderColor: const Color(0xFFFEBA0F),
                  //   cursorColor: const Color(0xFFFEBA0F),
                  //   focusedBorderColor: const Color(0xFFFEBA0F),
                  //   enabledBorderColor: const Color(0xFFCDCDCD),
                  //   showFieldAsBox: true,
                  //   onCodeChanged: (String code) {},
                  //   onSubmit: (String verificationCode) {
                  //     EnteredOTP = verificationCode;
                  //   }, // end onSubmit
                  // ),
                  // SizedBox(
                  //   height: getVerticalSize(10),
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                     Text(
                        "Resend OTP in ? ",
                        style: GoogleFonts.kadwa(
                            color: Color(0xFF898989),
                            fontWeight: FontWeight.w500,
                            fontSize: 20),
                      ),
                      Obx((() => Center(
                            child: Text(
                              '${controller.time.value}',
                              style:  GoogleFonts.poppins(
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
                  fontSize: 18.0),
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
    print(_isValid);
    if (_isValid) {
      Get.to(RegisterView());
    } else {
      errorSnackbar("Please Enter OTP ");
    }
  }
}
