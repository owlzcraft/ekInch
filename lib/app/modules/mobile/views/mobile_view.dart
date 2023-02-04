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
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
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

  String initialCountry = 'IN';
  PhoneNumber number = PhoneNumber(isoCode: 'IN');
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
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
          automaticallyImplyLeading: false,
        ),
        body: GestureDetector(
          behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(new FocusNode());
        },
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Welcome to EkInch",
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 30,
                        color: Color(0xFF525252)),
                  ),
                  
                  Padding(
                    padding: const EdgeInsets.only(top:16.0,bottom: 8.0),
                    child: const Text(
                      "Enter your mobile number, We will ",
                      style: TextStyle(
                          fontWeight: FontWeight.normal,
                          fontSize: 20,
                          color: Color(0xFF525252)),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom:16.0),
                    child: Text(
                        "send you confirmation code",
                        style: TextStyle(
                            fontWeight: FontWeight.normal,
                            fontSize: 20,
                            color: Color(0xFF525252)),
                      ),
                  ),
        
                  Container(
                    decoration: BoxDecoration(
                        border:
                            Border.all(color: Color.fromARGB(255, 191, 189, 189)),
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.all(Radius.circular(6))),
                    child: InternationalPhoneNumberInput(
                    keyboardAction: TextInputAction.go,
                      autoFocus: true,
                      spaceBetweenSelectorAndTextField: 0,
                      initialValue: number,
                      maxLength: 12,
                      
                      hintText: "Enter your mobile",
                      onInputChanged: (PhoneNumber number) {
                        print(number.phoneNumber);
                      },
                      onInputValidated: (bool value) {
                        print(value);
                      },
                      selectorConfig: SelectorConfig(
                        selectorType: PhoneInputSelectorType.DROPDOWN,
                      ),
                      ignoreBlank: false,
                      autoValidateMode: AutovalidateMode.disabled,
                      selectorTextStyle: TextStyle(color: Colors.black),
        
                      // textFieldController: controller,
                      formatInput: true,
                      keyboardType: TextInputType.numberWithOptions(
                          signed: true, decimal: true),
                      
                      inputBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.grey),
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(6),
                              bottomRight: Radius.circular(6))),
                      onSaved: (PhoneNumber number) {
                        print('On Saved: $number');
                      },
                    ),
                  ),
                  
                  // MobileTextField(numberController),
                  
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Row(
                      
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
                                      Icons.check_box,
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
                                        (checked) ? Color(0xFF808080) : Colors.grey,
                                    width: 2),
                              )),
                        ),
                        
                        Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(
                            ' I agree to the Terms & Conditions',
                            style: TextStyle(
                                fontSize: 18,
                                color: Color(0xFF787878),
                                fontWeight: FontWeight.w400),
                          ),
                        )
                      ],
                    ),
                  ),
                  
                  GFButton(
                    onPressed: () {
                      (!checked)
                          ? errorSnackbar(
                              "Please check the aggrement checkbox")
                              : Get.to(OtpView(
                                  mobile_number: numberController.text,
                                ));
                    },
                    color: KColors.orange,
                    fullWidthButton: true,
                    size: 50.2,
                    text: "Continue",
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                        fontSize: 24.0,
                        fontFamily: 'Kadwa'),
                    // shape: GFButtonShape.standard,
                  ),
                ],
              ),
            ),
          ),
        ));

    //old
    // return Scaffold(
    //   appBar: AppBar(
    //     backgroundColor: Colors.white.withOpacity(0.2),
    //     elevation: 0.0,
    //   ),
    //   body: Padding(
    //     padding: const EdgeInsets.all(16.0),
    //     child: Column(
    //         mainAxisAlignment: MainAxisAlignment.start,
    //         crossAxisAlignment: CrossAxisAlignment.start,
    //         children: [
    //           Text(
    //             "Welcome to EkInch",
    //             style: TextStyle(
    //                 fontWeight: FontWeight.w700,
    //                 fontSize: 30,
    //                 color: Color(0xFF525252)),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           const Text(
    //             "Enter your mobile number, We will \nsend you confirmation code",
    //             style: TextStyle(
    //                 fontSize: 20, color: Color(0xFF525252), height: 1.4),
    //           ),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           MobileTextField(numberController),
    //           SizedBox(
    //             height: 15,
    //           ),
    //           Row(
    //             children: [
    //               GestureDetector(
    //                 onTap: () {
    //                   setState(() {
    //                     checkButton();
    //                   });
    //                 },
    //                 child: Container(
    //                     child: (checked)
    //                         ? Icon(
    //                             Icons.check,
    //                             color: Color(0xFFFEBA0F),
    //                             size: 16,
    //                           )
    //                         : Container(),
    //                     width: 20,
    //                     height: 20,
    //                     decoration: BoxDecoration(
    //                       border: Border.all(
    //                           style: BorderStyle.solid,
    //                           color:
    //                               (checked) ? Color(0xFF808080) : Colors.blue,
    //                           width: 2),
    //                     )),
    //               ),
    //               Text(
    //                 ' I agree to the Terms & Conditions',
    //                 style: TextStyle(
    //                     fontSize: 18,
    //                     color: Color(0xFF787878),
    //                     fontWeight: FontWeight.w400),
    //               )
    //             ],
    //           ),
    //           SizedBox(
    //             height: 25,
    //           ),
    //           DynamicButton("Continue", true, () {
    //             (!checked)
    //                 ? createSnackBar(
    //                     "Please check the aggrement checkbox", context)
    //                 : (numberController.text.length != 10)
    //                     ? createSnackBar(
    //                         "Please enter a valid mobile number", context)
    //                     : Get.to(OtpView(
    //                         mobile_number: numberController.text,
    //                       ));
    //           })
    //         ]),
    //   ),
    // );
  }
}
