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
  // TextEditingController locController;
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
      // required this.locController,
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
                        '5000',
                        '6000',
                        '7000',
                        '8000',
                        '9000',
                        '10000',
                        '11000',
                        '12000',
                        '13000',
                        '14000',
                        '15000',
                        '16000',
                        '17000',
                        '18000',
                        '19000',
                        '20000',
                        '21000',
                        '22000',
                        '23000',
                        '24000',
                        '25000',
                        '26000',
                        '27000',
                        '28000',
                        '29000',
                        '30000',
                        '31000',
                        '32000',
                        '33000',
                        '34000',
                        '35000',
                        '36000',
                        '37000',
                        '38000',
                        '39000',
                        '40000',
                        '41000',
                        '42000',
                        '43000',
                        '44000',
                        '45000',
                        '46000',
                        '47000',
                        '48000',
                        '49000',
                        '50000'
                      ]),
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
                        '5000',
                        '6000',
                        '7000',
                        '8000',
                        '9000',
                        '10000',
                        '11000',
                        '12000',
                        '13000',
                        '14000',
                        '15000',
                        '16000',
                        '17000',
                        '18000',
                        '19000',
                        '20000',
                        '21000',
                        '22000',
                        '23000',
                        '24000',
                        '25000',
                        '26000',
                        '27000',
                        '28000',
                        '29000',
                        '30000',
                        '31000',
                        '32000',
                        '33000',
                        '34000',
                        '35000',
                        '36000',
                        '37000',
                        '38000',
                        '39000',
                        '40000',
                        '41000',
                        '42000',
                        '43000',
                        '44000',
                        '45000',
                        '46000',
                        '47000',
                        '48000',
                        '49000',
                        '50000'
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DropdownFieldFull(
              controller: expController,
              hintText: "Enter Experience in Years",
              items: const [
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12',
                '13',
                '14',
                '15',
                '16',
                '17',
                '18',
                '19',
                '20',
                '21',
                '22',
                '23',
                '24',
                '25',
                '26',
                '27',
                '28',
                '29',
                '30',
                '31',
                '32',
                '33',
                '34',
                '35',
                '36',
                '37',
                '38',
                '39',
                '40',
                '41',
                '42',
                '43',
                '44',
                '45',
                '46',
                '47',
                '48',
                '49',
                '50'
              ],
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            // DropdownFieldFull(
            //   controller: locController,
            //   hintText: "Select Location",
            //   items: const ['Roorkee', 'Talhedi', 'Laksar', "Noida", "Delhi"],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DropdownFieldFull(
              controller: langController,
              hintText: "Select Language",
              items: const [
                'Hindi',
                'English',
                'Bengali',
                'Telugu',
                'Marathi',
                'Tamil',
                'Gujarati',
                'Urdu',
                'Kannada',
                'Odia',
                'Punjabi',
                'Malayalam',
                'Assamese',
                'Kashmiri',
                'Sindhi',
                'Sanskrit'
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
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            DropdownFieldFull(
              controller: qualification,
              hintText: "Enter Graduation",
              items: const [
                '8th Pass',
                '10th Pass',
                '12th Pass',
                "B.A",
                "B.Tech",
                "B.Com",
                "BCA",
                "BBA",
                "Diploma",
                "Other"
              ],
            ),
            // Dropdownprefix(
            //   controller: qualification,
            //   hintText: "Enter Graduation",
            //   // dropdownvalue: '10th',
            //   items: const ['8th Pass', '10th Pass', '12th Pass', 'Graduated'],
            // ),
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
              items: const ['Male', 'Female', "Others"],
            ),
          ],
        ),
      ),
    );
  }
}
