import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/postjob/widgets/shortDropDown.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({
    Key? key,
  }) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitedark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            //    mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'I want to Hire A',
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
                dropdownvalue: 'Electrician',
                items: [
                  'Electrician',
                  'Engineer',
                  'Builder',
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'In The City',
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
                dropdownvalue: 'Roorkee',
                items: [
                  'Roorkee',
                  'Talhedi',
                  'Laksar',
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'From The Locality',
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
                dropdownvalue: 'Haridwar',
                items: [
                  'Haridwar',
                  'Indore',
                  'Mumbai',
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'I Will Pay a Monthly Salary of',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: black,
                    fontFamily: 'Kadwa'),
              ),
              SizedBox(
                height: 5,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    child: DropdownFieldFull(
                      dropdownvalue: '12,000/pm',
                      items: [
                        '12,000/pm',
                        'Indore',
                        'Mumbai',
                      ],
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Text(
                    'To',
                    style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: black,
                        fontFamily: 'Kadwa'),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.02,
                  ),
                  Expanded(
                    child: DropdownFieldFull(
                      dropdownvalue: '12,000/pm',
                      items: [
                        '12,000/pm',
                        'Indore',
                        'Mumbai',
                      ],
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'No. of Mechanic I Need Is',
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
                dropdownvalue: '2',
                items: ['1', '2', '3', '4', '5', '6', '7', '8', '9', '10'],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: yellow,
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,
                      onPressed: () {},
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
      ),
    );
  }
}
