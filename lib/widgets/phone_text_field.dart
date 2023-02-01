import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';

TextFormField MobileTextField(TextEditingController numberController) {
  return TextFormField(
    
    style: TextStyle(fontSize: getFontSize(22), color: Color(0xFF999898)),
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
        hintText: "    Enter your mobile",
        hintStyle: TextStyle(fontSize: 18, color: Color(0xFF999898)),
        prefixIcon: Container(
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
        border: const OutlineInputBorder(
            borderSide: BorderSide(color: Color(0xFFCDCDCD)))),
  );
}
