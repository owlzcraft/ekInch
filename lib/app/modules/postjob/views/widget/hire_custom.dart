import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/shortDropDown.dart';

class HireColumn extends StatelessWidget {
  TextEditingController professionController;
  TextEditingController numberController;
  TextEditingController salaryStController;
  TextEditingController salaryEndController;
  TextEditingController expController;
  TextEditingController locController;
  TextEditingController langController;
  TextEditingController qualification;
  TextEditingController gender;
  HireColumn(
      {super.key,
      required this.professionController,
      required this.numberController,
      required this.salaryStController,
      required this.salaryEndController,
      required this.expController,
      required this.locController,
      required this.langController,
      required this.qualification,
      required this.gender});

  @override
  Widget build(BuildContext context) {
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
                    hintText: "${professionController.text}",
                    // dropdownvalue: "${professionController.text}",
                    items: const [
                      "Labour",
                      "Plaster Mistri",
                      "Tiles Mistri",
                      "Plumber",
                      "Electrician",
                      "Painter",
                      "Carpenter",
                      "Welder",
                      "Bar bender",
                      "Contractor",
                      "Dukandar",
                      "Customer",
                      "Engineer",
                      "Architect",
                      "other"
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
                      items: const [
                        '1',
                        '2',
                        '3',
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                        "10"
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownFieldFull(
                    controller: salaryStController,
                    hintText: "Salary",
                    items: const [
                      '10000',
                      '12000',
                      '14000',
                    ],
                  ),
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    "To",
                    style: GoogleFonts.kadwa(
                        fontSize: F16(), fontWeight: FontWeight.w600),
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: DropdownFieldFull(
                    controller: salaryEndController,
                    hintText: "Salary",
                    items: const [
                      '12000',
                      '14000',
                      '16000',
                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DropdownFieldFull(
              controller: expController,
              hintText: "Enter Experience",
              items: const [
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
              items: const ['Roorkee', 'Talhedi', 'Laksar', "Noida", "Delhi"],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DropdownFieldFull(
              controller: langController,
              hintText: "Select Language",
              items: const ['Hindi', 'English', 'Gujrati', "Punjabi", "Tamil"],
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
              items: const ['8th Pass', '10th Pass', '12th Pass', 'Graduated'],
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
              items: const ['Male', 'Female', "Other"],
            ),
          ],
        ),
      ),
    );
  }
}
