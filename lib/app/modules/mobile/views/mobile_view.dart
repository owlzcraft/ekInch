import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../custom_widget/color.dart';
import '../controllers/mobile_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class MobileView extends StatefulWidget {
  const MobileView({super.key});
  @override
  State<MobileView> createState() => _MobileViewState();
}

class _MobileViewState extends State<MobileView> {
  MobileController signInController = Get.put(MobileController());
  var checked = false;

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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        automaticallyImplyLeading: false,
      ),
      body: GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          FocusScope.of(context).requestFocus(FocusNode());
        },
        child: SingleChildScrollView(
            child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                AppLocalizations.of(context)!.welcome,
                style: GoogleFonts.kadwa(
                    fontWeight: FontWeight.w700,
                    fontSize: F32(),
                    color: const Color(0xFF525252)),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Text(
                  AppLocalizations.of(context)!.welcomeDesc,
                  style: GoogleFonts.kadwa(
                      fontWeight: FontWeight.normal,
                      fontSize: F22(),
                      height: 1.7,
                      color: const Color(0xFF525252)),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    border: Border.all(
                        color: const Color.fromARGB(255, 191, 189, 189)),
                    shape: BoxShape.rectangle,
                    borderRadius: const BorderRadius.all(Radius.circular(6))),
                child: InternationalPhoneNumberInput(
                  textFieldController: signInController.mobileNumber,
                  autoFocus: true,
                  spaceBetweenSelectorAndTextField: 0,
                  initialValue: number,
                  maxLength: 10,
                  hintText: AppLocalizations.of(context)!.enterPhoneNumber,
                  onInputChanged: (PhoneNumber number) {},
                  onInputValidated: (bool value) {},
                  selectorConfig: const SelectorConfig(
                    selectorType: PhoneInputSelectorType.DROPDOWN,
                  ),
                  ignoreBlank: false,
                  autoValidateMode: AutovalidateMode.onUserInteraction,
                  selectorTextStyle: const TextStyle(color: Colors.black),
                  formatInput: false,
                  keyboardType: const TextInputType.numberWithOptions(
                      signed: true, decimal: true),
                  inputBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.grey),
                      borderRadius: BorderRadius.only(
                          topRight: Radius.circular(6),
                          bottomRight: Radius.circular(6))),
                  onSaved: (PhoneNumber number) {},
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                    child: Text(
                  AppLocalizations.of(context)!.oR,
                  style: GoogleFonts.kadwa(
                      fontSize: F18(),
                      fontWeight: FontWeight.w400,
                      color: KColors.textGrey),
                )),
              ),
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: const Color.fromARGB(255, 191, 189, 189)),
                      shape: BoxShape.rectangle,
                      borderRadius: const BorderRadius.all(Radius.circular(6))),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Image.asset(
                          "assets/images/whatsapp.png",
                          scale: 1.8,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 8.0),
                          child: Text(
                            AppLocalizations.of(context)!.sign,
                            style: GoogleFonts.kadwa(
                                fontSize: F20(),
                                fontWeight: FontWeight.w400,
                                color: KColors.textGrey),
                          ),
                        )
                      ],
                    ),
                  )),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: Row(
                  children: [
                    GestureDetector(
                      onTap: () {
                        setState(() {
                          checkButton();
                        });
                      },
                      child: Container(
                          // ignore: sort_child_properties_last
                          child: (checked)
                              ? const Icon(
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
                                color: (checked)
                                    ? const Color(0xFF808080)
                                    : Colors.grey,
                                width: 2),
                          )),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(4.0),
                      child: Text(
                        AppLocalizations.of(context)!.term,
                        style: GoogleFonts.kadwa(
                            fontSize: F20(),
                            color: const Color(0xFF787878),
                            fontWeight: FontWeight.w400),
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15.0),
                child: GFButton(
                  onPressed: () {
                    (!checked)
                        ? errorSnackbar(AppLocalizations.of(context)!
                            .pleasechecktheaggrementcheckbox)
                        : signInController.signInWithmobile();
                  },
                  color: KColors.orange,
                  fullWidthButton: true,
                  size: 50.2,
                  text: AppLocalizations.of(context)!.continueWord,
                  textStyle: GoogleFonts.kadwa(
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                    fontSize: F24(),
                  ),
                  // shape: GFButtonShape.standard,
                ),
              ),
            ],
          ),
        )),
      ),
    );

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
