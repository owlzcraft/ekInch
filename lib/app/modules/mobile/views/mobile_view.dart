import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/otp/views/otp_view.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_application_00/widgets/phone_text_field.dart';
import 'package:flutter_application_00/widgets/snack_bar.dart';

import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import '../../../custom_widget/color.dart';
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
//yamini
    // return Scaffold(
    //     appBar: AppBar(
    //       backgroundColor: Colors.white.withOpacity(0.0),
    //       elevation: 0.0,
    //       automaticallyImplyLeading: false,
    //     ),
    //     body: SingleChildScrollView(
    //       child: Padding(
    //         padding: const EdgeInsets.all(20.0),
    //         child: Column(
    //           mainAxisAlignment: MainAxisAlignment.start,
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           children: [
    //             const Text(
    //               "Welcome to EkInch",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.w700,
    //                   fontSize: 30,
    //                   color: Color(0xFF525252)),
    //             ),
    //             const SizedBox(
    //               height: 15,
    //             ),
    //             const Text(
    //               "Enter your mobile number, We will \nsend you confirmation code",
    //               style: TextStyle(
    //                   fontWeight: FontWeight.normal,
    //                   fontSize: 16,
    //                   color: Color(0xFF525252)),
    //             ),
    //             const SizedBox(
    //               height: 19,
    //             ),
    //             MobileTextField(numberController),
    //             const SizedBox(
    //               height: 15,
    //             ),
    //             Row(
    //               children: [
    //                 GestureDetector(
    //                   onTap: () {
    //                     setState(() {
    //                       checkButton();
    //                     });
    //                   },
    //                   child: Container(
    //                       child: (checked)
    //                           ? Icon(
    //                               Icons.check_box,
    //                               color: Color(0xFFFEBA0F),
    //                               size: 16,
    //                             )
    //                           : Container(),
    //                       width: 20,
    //                       height: 20,
    //                       decoration: BoxDecoration(
    //                         border: Border.all(
    //                             style: BorderStyle.solid,
    //                             color:
    //                                 (checked) ? Color(0xFF808080) : Colors.grey,
    //                             width: 2),
    //                       )),
    //                 ),
    //                 SizedBox(
    //                   height: 10,
    //                 ),
    //                 Text(
    //                   ' I agree to the Terms & Conditions',
    //                   style: TextStyle(
    //                       fontSize: 18,
    //                       color: Color(0xFF787878),
    //                       fontWeight: FontWeight.w400),
    //                 )
    //               ],
    //             ),
    //             SizedBox(
    //               height: 35,
    //             ),
    //             GFButton(
    //               onPressed: () {
    //                 (!checked)
    //                     ? createSnackBar(
    //                         "Please check the aggrement checkbox", context)
    //                     : (numberController.text.length != 10)
    //                         ? createSnackBar(
    //                             "Please enter a valid mobile number", context)
    //                         : Get.to(OtpView(
    //                             mobile_number: numberController.text,
    //                           ));
    //               },
    //               color: KColors.orange,
    //               fullWidthButton: true,
    //               size: 50.2,
    //               text: "Continue",
    //               textStyle: const TextStyle(
    //                   color: Colors.black,
    //                   fontWeight: FontWeight.bold,
    //                   fontSize: 18.0,
    //                   fontFamily: 'Kadwa'),
    //               // shape: GFButtonShape.standard,
    //             ),
    //           ],
    //         ),
    //       ),
    //     ));

    //old
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.2),
        elevation: 0.0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Welcome to EkInch",
                style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: 30,
                    color: Color(0xFF525252)),
              ),
              SizedBox(
                height: getVerticalSize(15),
              ),
              const Text(
                "Enter your mobile number, We will \nsend you confirmation code",
                style: TextStyle(
                    fontSize: 20, color: Color(0xFF525252), height: 1.4),
              ),
              SizedBox(
                height: getVerticalSize(15),
              ),
              MobileTextField(numberController),
              SizedBox(
                height: getVerticalSize(15),
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
              SizedBox(
                height: getVerticalSize(25),
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
