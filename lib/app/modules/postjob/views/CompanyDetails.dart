import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/views/PostJobProfile.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';

class CompanyDetails extends StatefulWidget {
  const CompanyDetails({Key? key}) : super(key: key);

  @override
  _CompanyDetailsState createState() => _CompanyDetailsState();
}

class _CompanyDetailsState extends State<CompanyDetails> {
  TextEditingController _companynamecontroller = TextEditingController();
  TextEditingController _namecontroller = TextEditingController();
  TextEditingController _emailcontroller = TextEditingController();
  TextEditingController _numbercontroller = TextEditingController();
  TextEditingController _addresscontroller = TextEditingController();

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
                'Name of Company',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: black,
                    fontFamily: 'Kadwa'),
              ),
              SizedBox(
                height: 5,
              ),
              TextFeild(
                controller: _companynamecontroller,
                hintText: 'Company Name ',
                keyboardtype: TextInputType.name,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Contact Person/Recruiter Name',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: black,
                    fontFamily: 'Kadwa'),
              ),
              SizedBox(
                height: 5,
              ),
              TextFeild(
                  controller: _namecontroller,
                  hintText: 'Person Name',
                  keyboardtype: TextInputType.name,
                  inputFormatter:
                      FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Email Id',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: black,
                    fontFamily: 'Kadwa'),
              ),
              SizedBox(
                height: 5,
              ),
              TextFeild(
                controller: _emailcontroller,
                hintText: 'Email ID',
                keyboardtype: TextInputType.emailAddress,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Phone Number',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: black,
                    fontFamily: 'Kadwa'),
              ),
              SizedBox(
                height: 5,
              ),
              TextFeildNumber(
                controller: _numbercontroller,
                hintText: 'Mobile Number',
                dropdownvalue: '+91',
                items: ['+91', '+1', '+44'],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.02,
              ),
              Text(
                'Company Address',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: black,
                    fontFamily: 'Kadwa'),
              ),
              SizedBox(
                height: 5,
              ),
              TextFeild(
                controller: _addresscontroller,
                hintText: 'Company Address',
                keyboardtype: TextInputType.streetAddress,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.height * 0.03,
              ),
              // Material(
              //     borderRadius: BorderRadius.circular(10.0),
              //     color: yellow,
              //     child: MaterialButton(
              //         minWidth: MediaQuery.of(context).size.width,
              //         onPressed: () {
              //           Navigator.push(
              //               context,
              //               MaterialPageRoute(
              //                   builder: (context) => PostJobProfile(
              //                         companyname: _companynamecontroller.text,
              //                         name: _namecontroller.text,
              //                         email: _emailcontroller.text,
              //                         number: _numbercontroller.text,
              //                         address: _addresscontroller.text,
              //                       )));
              //         },
              //         child: Center(
              //           child: Text(
              //             'Done',
              //             style: TextStyle(
              //                 color: black,
              //                 fontSize: 18,
              //                 fontFamily: 'Kadwa',
              //                 fontWeight: FontWeight.w700),
              //           ),
              //         ))),
            ],
          ),
        ),
      ),
    );
  }
}
