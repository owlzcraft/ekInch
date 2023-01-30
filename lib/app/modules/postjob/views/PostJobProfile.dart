import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';

import 'Confirmationjob.dart';

class PostJobProfile extends StatefulWidget {
  PostJobProfile(
      {Key? key,
      this.companyname,
      this.name,
      this.address,
      this.email,
      this.number})
      : super(key: key);
  String? companyname;
  String? name;
  String? email;
  String? number;
  String? address;

  @override
  _PostJobProfileState createState() => _PostJobProfileState();
}

class _PostJobProfileState extends State<PostJobProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: Icon(Icons.arrow_back)),
        //Icon(Icons.menu),
        title: Text(
          'Post Job',
          style: TextStyle(
              fontSize: 18, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
        ),
        actions: [
          Icon(
            Icons.share_outlined,
            size: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Electrician Engineer',
                          style: TextStyle(
                              fontSize: 16,
                              fontFamily: 'Kadwa',
                              fontWeight: FontWeight.w400)),
                      Text('UltraTech Cement, India',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Kadwa',
                              fontWeight: FontWeight.w400,
                              color: greylight))
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.location_on_outlined,
                        color: grey,
                      ),
                      Text('Rorkee, India',
                          style: TextStyle(
                              fontSize: 14,
                              fontFamily: 'Kadwa',
                              fontWeight: FontWeight.w400,
                              color: greylight))
                    ],
                  )
                ],
              ),
              Container(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15, top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Job Title',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              'Plumber Engineer',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'In Hand Salary',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              '15000-20000',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Qualification',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              '10th Pass',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Language',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              'Hindi',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Required',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              'Plumbing and Pump Fitting',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Job Info',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              'Good in Plumbing and home basic work of plumbing',
                              textAlign: TextAlign.start,
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Experience',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              '1-2 Years',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Other Details',
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: black, fontSize: 14),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15, top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Job Timing',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              '10am to 6pm | Mon to Sat',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Interview Timing ',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              '10am to 6pm | Friday',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Company Address',
                style: TextStyle(
                    fontWeight: FontWeight.w700, color: black, fontSize: 14),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.01,
              ),
              Container(
                child: Card(
                  elevation: 2,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5)),
                  child: Padding(
                    padding: EdgeInsets.only(
                        left: 15.0, right: 15, top: 15, bottom: 15),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            SizedBox(
                                width: MediaQuery.of(context).size.width * 0.3,
                                child: Text(
                                  'Address',
                                  style: TextStyle(
                                      fontSize: 12,
                                      fontFamily: 'Kadwa',
                                      fontWeight: FontWeight.w400),
                                )),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.03,
                              child: Text(
                                ":",
                                style: TextStyle(color: greylight),
                              ),
                            ),
                            Text(
                              widget.address ?? '',
                              style: TextStyle(
                                  color: greylight,
                                  fontSize: 12,
                                  fontFamily: 'Kadwa',
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
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
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => Confirmationjob()));
                      },
                      child: Center(
                        child: Text(
                          'Post Job',
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
