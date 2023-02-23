import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/modules/otp/views/otp_view.dart';
import 'package:flutter_application_00/app/utils/hide_keyboard.dart';
import 'package:flutter_application_00/app/utils/localStorage.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

TextFormField MobileTextFieldEdit(BuildContext context, bool static,
    TextEditingController numberController, String editText, String label) {
  showDataAlertEditPhoneNumber() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(10),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(
                  4.0,
                ),
              ),
            ),
            title: Text(
              "Update Mobile  No.",
              style: GoogleFonts.kadwa(
                  fontSize: 24.0, fontWeight: FontWeight.w400),
            ),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MobileTextFieldEdit(context, false, numberController, "",
                        "Enter Phone Number"),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 25.0),
                      child: GFButton(
                        onPressed: () {
                          Get.to(OtpView(), arguments: "Edit Phone");
                        },
                        color: KColors.orange,
                        fullWidthButton: true,
                        size: 50.2,
                        text: "Save & Update",
                        textStyle: GoogleFonts.kadwa(
                          color: Colors.black,
                          fontWeight: FontWeight.w700,
                          fontSize: 24.0,
                        ),
                        // shape: GFButtonShape.standard,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        });
  }

  return TextFormField(
    readOnly: static,
    initialValue: "${LocalStorage.shared.getUserData()!.userId}",
    textInputAction: TextInputAction.done,
// onTapOutside: hideKeyboard,
    style: TextStyle(fontSize: getFontSize(22), color: Color(0xFF999898)),
    scrollPadding: EdgeInsets.symmetric(horizontal: 10),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      numberController.text = value as String;
    },
    // controller: numberController,
    maxLength: 10,
    decoration: InputDecoration(
        counterText: "",
        isDense: false,
        contentPadding: EdgeInsets.symmetric(horizontal: 20),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFEBA0F))),
        hintText: label,
        hintStyle: TextStyle(fontSize: 18, color: Color(0xFF999898)),
        suffix: InkWell(
            onTap: () {
              showDataAlertEditPhoneNumber();
            },
            child: Text(
              editText,
              style: GoogleFonts.kadwa(
                  color: KColors.textGrey,
                  fontSize: 18,
                  fontWeight: FontWeight.w400),
            )),
        prefixIcon: Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: Container(
            decoration: const BoxDecoration(
                border: Border(
                    right: BorderSide(width: 1, color: Color(0xFFCDCDCD)))),
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
        ),
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDCDCD)))),
  );
}
