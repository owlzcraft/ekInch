import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/postjob/views/CompanyDetails.dart';
import 'package:flutter_application_00/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:get/get.dart';

class JobDescriptions extends StatefulWidget {
  const JobDescriptions({Key? key}) : super(key: key);

  @override
  _JobDescriptionsState createState() => _JobDescriptionsState();
}

class _JobDescriptionsState extends State<JobDescriptions> {
  TextEditingController _descriptioncontroller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitedark,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          //    mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Qualification',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            Dropdownprefix(
              dropdownvalue: '10th',
              items: [
                '10th',
                '11th',
                '12th',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Experience',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            DropdownFieldFull(
              dropdownvalue: '1-2 Years',
              items: [
                '1-2 Years',
                '2-3 Years',
                '3-4 Years',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Gender',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            DropdownFieldFull(
              dropdownvalue: 'Male',
              items: [
                'Female',
                'Male',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Language Speaking',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            DropdownFieldFull(
              dropdownvalue: 'Good in Hindi',
              items: [
                'Good in Hindi',
                'Good in English',
                'Good in Marathi',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Must Have Skilss for the Job',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            DropdownFieldFull(
              dropdownvalue: 'Electric Work',
              items: [
                'Electric Work',
                'HR Work',
                'Mechanical Work',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Describe the Job Role',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            Description(
              controller: _descriptioncontroller,
              hintText: 'Please Describe here',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Job Timing',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            DropdownTime(
              hintText: '10:00 am - 7:00 pm',
              dropdownvalue: 'Mon to Sat',
              items: [
                'Mon to Sat',
                'Sun to Fri',
                'Tue to Sun',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Interview Timing',
              style: TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w700,
                  color: black,
                  fontFamily: 'Kadwa'),
            ),
            SizedBox(
              height: 5,
            ),
            DropdownTime(
              hintText: '10:00 am - 7:00 pm',
              dropdownvalue: 'Mon to Sat',
              items: [
                'Mon to Sat',
                'Sun to Fri',
                'Tue to Sun',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Material(
                borderRadius: BorderRadius.circular(10.0),
                color: yellow,
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Get.to(CompanyDetails());
                    },
                    child: Center(
                      child: Text(
                        'Next',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontFamily: 'Kadwa',
                            fontWeight: FontWeight.w700),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
