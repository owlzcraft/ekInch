import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/otp/views/otp_view.dart';
import 'package:flutter_application_00/widgets/snack_bar.dart';

import 'package:get/get.dart';
import '../controllers/mobile_controller.dart';

// import '../widget/country_code_picker.dart';
class MobileView extends StatefulWidget {
  const MobileView({super.key});

  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  var checked = false;
  TextEditingController numberController = TextEditingController();
  checkButton() {
    if (checked) {
      checked = false;
    } else {
      checked = true;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: Get.height / 1.8,
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                margin: EdgeInsets.only(top: Get.height / 12),
                child: const Text(
                  "Welcome to EkInch",
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 30,
                      color: Color(0xFF525252)),
                ),
              ),
              const Text(
                "Enter your mobile number, We will \nsend you confirmation code",
                style: TextStyle(
                    fontSize: 20, color: Color(0xFF525252), height: 1.4),
              ),
              TextFormField(
                style: TextStyle(fontSize: 18, color: Color(0xFF999898)),
                scrollPadding: EdgeInsets.symmetric(horizontal: 10),
                keyboardType: TextInputType.number,
                controller: numberController,
                maxLength: 10,
                decoration: InputDecoration(
                    counterText: "",
                    isDense: true,
                    contentPadding: EdgeInsets.symmetric(horizontal: 20),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFFEBA0F))),
                    hintText: " Enter your mobile",
                    hintStyle:
                        TextStyle(fontSize: 18, color: Color(0xFF999898)),
                    prefixIcon: Container(
                      decoration: const BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  width: 1, color: Color(0xFFCDCDCD)))),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          CountryCodePicker(
                            onChanged: print,
                            initialSelection: 'IN',
                            favorite: ['+39', 'FR'],
                            showCountryOnly: false,
                            showOnlyCountryWhenClosed: false,
                            alignLeft: false,
                          ),
                        ],
                      ),
                    ),
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCDCDCD)))),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        checkButton();
                      });
                    },
                    child: Container(
                        child: (checked)
                            ? Icon(
                                Icons.check,
                                color: Color(0xFFFEBA0F),
                                size: 16,
                              )
                            : Container(),
                        width: 20,
                        height: 20,
                        decoration: BoxDecoration(
                          border: Border.all(
                              style: BorderStyle.solid,
                              color:
                                  (checked) ? Color(0xFF808080) : Colors.blue,
                              width: 2),
                        )),
                  ),
                  Text(
                    ' I agree to the Terms & Conditions',
                    style: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF787878),
                        fontWeight: FontWeight.w400),
                  )
                ],
              ),
              DynamicButton("Continue", true, () {
                (!checked)
                    ? createSnackBar(
                        "Please check the aggrement checkbox", context)
                    : (numberController.text.length != 10)
                        ? createSnackBar(
                            "Please enter a valid mobile number", context)
                        : Get.to(OtpView(
                            mobile_number: numberController.text,
                          ));
              })
            ]),
      ),
    );
  }
}
