import 'package:ekinch/Screen/PostJob/PostJobProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../Others/entryfield.dart';
import '../Style/Style.dart';

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
      body:

      SingleChildScrollView(
        child: Padding(
          padding:  EdgeInsets.all(15.0),
          child: Column(crossAxisAlignment: CrossAxisAlignment.start,
            //    mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text('Name of Company',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: black,fontFamily: 'Kadwa'),),
              SizedBox(height: 5,),
              TextFeild(
                controller: _companynamecontroller,
                hintText: 'Ekinch Pvt. Ltd.',
                keyboardtype:TextInputType.name ,
              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
              Text('Contact Person/Recruiter Name',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: black,fontFamily: 'Kadwa'),),
              SizedBox(height: 5,),
              TextFeild(
                controller: _namecontroller,
                hintText: 'Sanjay Pal',
                  keyboardtype:TextInputType.name ,
                inputFormatter:
                  FilteringTextInputFormatter.allow(RegExp(r'[a-zA-Z ]'))
                        ),

              SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
              Text('Email Id',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: black,fontFamily: 'Kadwa'),),
              SizedBox(height: 5,),
              TextFeild(
                controller: _emailcontroller,
                hintText: 'info@ekinch.com',
                keyboardtype:TextInputType.emailAddress ,

              ),

              SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
              Text('Phone Number',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: black,fontFamily: 'Kadwa'),),
              SizedBox(height: 5,),

              TextFeildNumber(
                controller: _numbercontroller,
                hintText: '989898989812',
                dropdownvalue:'+91',
                items: [

                  '+91',
                  '+1',
                  '+44'
                ],


              ),
              SizedBox(height:MediaQuery.of(context).size.height*0.02 ,),
              Text('Company Address',style: TextStyle(fontSize: 14,fontWeight: FontWeight.w700,color: black,fontFamily: 'Kadwa'),),
              SizedBox(height: 5,),
              TextFeild(
                controller: _addresscontroller,
                hintText: 'F-123, 2nd Floor, Roorkee',
                keyboardtype:TextInputType.streetAddress ,

              ),

              SizedBox(height:MediaQuery.of(context).size.height*0.03 ,),

              Material(
                  borderRadius: BorderRadius.circular(10.0),
                  color: yellow,
                  child: MaterialButton(
                      minWidth: MediaQuery.of(context).size.width,

                      onPressed: () {
Navigator.push(context, MaterialPageRoute(builder: (context)=> PostJobProfile(
  companyname: _companynamecontroller.text,
  name: _namecontroller.text,
  email: _emailcontroller.text,
  number: _numbercontroller.text,
  address: _addresscontroller.text,


)));
                      },
                      child: Center(
                        child: Text(
                          'Done',
                          style: TextStyle(
                              color: black,
                              fontSize: 18,fontFamily: 'Kadwa',fontWeight: FontWeight.w700),
                        ),
                      ))),




















            ],
          ),
        ),
      ),


    );
  }
}
