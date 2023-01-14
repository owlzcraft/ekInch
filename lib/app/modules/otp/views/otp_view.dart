import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/register/views/register.view.dart.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import '../../mobile/widget/yellow_button.dart';
import '../controllers/otp_controller.dart';

class OtpView extends GetView<OtpController> {
  final String mobile_number;
  OtpView({this.mobile_number = ""});
  var EnteredOTP = '';
  @override
  Widget build(BuildContext context) {
    Get.put(OtpController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
        ),
        actions: [
          Container(
            padding: const EdgeInsets.all(10),
            child: const Text(
              'Change Number',
              style: TextStyle(color: Color(0xFFE55425)),
            ),
          )
        ],
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        height: Get.height / 2,
        color: Colors.white,
        child:
            Column(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    child: const Text(
                  "Verify Mobile Number",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF525252)),
                )),
                Text(
                  "Enter OTP sent to your mobile number\n$mobile_number",
                  style: const TextStyle(
                      fontSize: 20, color: Color(0xFF767676), height: 1.4),
                ),
              ],
            ),
          ),
          OtpTextField(
            fieldWidth: Get.width / 5.5,
            margin: const EdgeInsets.symmetric(horizontal: 7),
            decoration: const InputDecoration(),
            styles: [
              const TextStyle(fontSize: 36),
              const TextStyle(fontSize: 36),
              const TextStyle(fontSize: 36),
              const TextStyle(fontSize: 36)
            ],
            numberOfFields: 4,
            borderColor: const Color(0xFFFEBA0F),
            cursorColor: const Color(0xFFFEBA0F),
            focusedBorderColor: const Color(0xFFFEBA0F),
            enabledBorderColor: const Color(0xFFCDCDCD),
            showFieldAsBox: true,
            onCodeChanged: (String code) {},
            onSubmit: (String verificationCode) {
              EnteredOTP = verificationCode;
            }, // end onSubmit
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "Resend OTP in ? ",
                style: TextStyle(
                    color: Color(0xFF898989),
                    fontWeight: FontWeight.w500,
                    fontSize: 20),
              ),
              Obx((() => Center(
                    child: Text(
                      '${controller.time.value}',
                      style: const TextStyle(
                          color: Color(0xFFFEBA0F),
                          fontWeight: FontWeight.w600,
                          fontSize: 20),
                    ),
                  ))),
            ],
          ),
          DynamicButton("Verify", true, () {
            Get.to(RegisterView());
          })
        ]),
      ),
    );
  }
}
