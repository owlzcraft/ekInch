import 'package:country_code_picker/country_code_picker.dart';
import 'package:ekinch/app/modules/profile/controllers/profile_controller.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/modules/otp/views/otp_view.dart';
import 'package:ekinch/app/utils/hide_keyboard.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:ekinch/widgets/math_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:getwidget/getwidget.dart';
import 'package:google_fonts/google_fonts.dart';

import '../app/custom_widget/font_size.dart';

TextFormField MobileTextFieldEdit(BuildContext context, bool static, String initialValue,
    TextEditingController mobile, String editText, String label) {
  var profileController = Get.put(ProfileController());
  showDataAlertEditPhoneNumber() {
    showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            insetPadding: EdgeInsets.all(8.sp),
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
                  fontSize: F24(), fontWeight: FontWeight.w400),
            ),
            content: Container(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    MobileTextFieldEdit(context, false,"${LocalStorage.shared.getnumber()}", mobile, "",
                        "Enter Phone Number"),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 20.sp),
                      child: GFButton(
                        onPressed: () {
                          profileController.SendOtpNewPhoneNumber();
                        },
                        color: KColors.orange,
                        fullWidthButton: true,
                        size: 50.2,
                        text: "Save & Update",
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
              ),
            ),
          );
        });
  }

  return TextFormField(
    readOnly: static,
    
    initialValue: "$initialValue",
    textInputAction: TextInputAction.done,
// onTapOutside: hideKeyboard,
    style: GoogleFonts.kadwa(fontSize: F22(), color: Color(0xFF636363)),
    scrollPadding: EdgeInsets.symmetric(horizontal: 10.sp),
    keyboardType: TextInputType.number,
    onChanged: (value) {
      mobile.text = value as String;
    },
    // controller: numberController,
    maxLength: 10,
    decoration: InputDecoration(
        counterText: "",
        isDense: false,
        contentPadding:
            EdgeInsets.symmetric(horizontal: 20.sp, vertical: 10.sp),
        focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFFEBA0F))),
        hintText: label,
        hintStyle: GoogleFonts.kadwa(fontSize: F18(), color: Colors.black),
        suffix: InkWell(
            onTap: () {
              showDataAlertEditPhoneNumber();
            },
            child: Text(
              editText,
              style: GoogleFonts.kadwa(
                  color: KColors.textGrey,
                  fontSize: F18(),
                  fontWeight: FontWeight.w400),
            )),
        prefixIcon: Padding(
          padding: EdgeInsets.only(right: 8.sp),
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
