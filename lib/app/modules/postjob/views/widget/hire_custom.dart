import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/shortDropDown.dart';

HireColumn(
  BuildContext context,
  // key,
  TextEditingController professionController,
  TextEditingController numberController,
  TextEditingController salaryController,
  TextEditingController expController,
  TextEditingController locController,
  TextEditingController langController,
  TextEditingController qualification,
  TextEditingController gender,
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 8.0),
    child: Form(
      // key: key,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        //    mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text(
            'I want to Hire A',
            style: GoogleFonts.kadwa(
              fontSize: F18(),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: DropdownFieldFull(
                  controller: professionController,
                  hintText: "Select Profession",
                  // dropdownvalue: 'Electrician',
                  items: [
                    'Electrician',
                    'Engineer',
                    'Builder',
                  ],
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.only(left: 12.sp),
                  child: DropdownFieldFull(
                    controller: numberController,
                    hintText: "1",
                    // dropdownvalue: '1',
                    items: [
                      '1',
                      '2',
                      '3',
                    ],
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DropdownFieldFull(
            controller: salaryController,
            hintText: "Enter Salary",
            items: [
              '10000',
              '12000',
              '14000',
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DropdownFieldFull(
            controller: expController,
            hintText: "Enter Experience",
            items: [
              '1 Year',
              '2 Year',
              '3 Year',
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DropdownFieldFull(
            controller: locController,
            hintText: "Select Location",
            items: [
              'Roorkee',
              'Talhedi',
              'Laksar',
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.02,
          ),
          DropdownFieldFull(
            controller: locController,
            hintText: "Select Location",
            items: [
              'Hindi',
              'English',
              'Gujrati',
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            'Qualification',
            style: GoogleFonts.kadwa(
              fontSize: F18(),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.002,
          ),
          Dropdownprefix(
            controller: qualification,
            hintText: "Enter Graduation",
            // dropdownvalue: '10th',
            items: [
              '10th',
              '11th',
              '12th',
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.01,
          ),
          Text(
            'Gender',
            style: GoogleFonts.kadwa(
              fontSize: F18(),
              fontWeight: FontWeight.w700,
              color: Colors.black,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.002,
          ),
          DropdownFieldFull(
            controller: gender,
            hintText: "Select Gender",
            items: [
              'Male',
              'Female',
            ],
          ),
        ],
      ),
    ),
  );
}
