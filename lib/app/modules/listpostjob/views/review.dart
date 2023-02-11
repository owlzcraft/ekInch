import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../postjob/widgets/shortDropDown.dart';

class Review extends StatefulWidget {
  const Review({Key? key}) : super(key: key);

  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
                children: [
      
                  Padding(
                    padding: const EdgeInsets.only(top: 25.0,),
                    child: Container(height: MediaQuery.of(context).size.height*0.1,
                      width: MediaQuery.of(context).size.width*0.4,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: black,
                  
                      ),
                      child: Center(
                        child: Row(mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                           Padding(
                                      padding: EdgeInsets.only(bottom: 17),child:SvgPicture.asset("assets/images/star.svg",height: 12,)),
                         
                          Padding(
                            padding: const EdgeInsets.only(left:5.0),
                            child: Text('4.8/',style: TextStyle(color: whitedark,fontSize: 28,fontWeight: FontWeight.w700),),
                          ),
                         Padding(
                                      padding: EdgeInsets.only(bottom: 2),child: Text('5.0',style: TextStyle(color: whitedark,fontSize: 14,fontWeight: FontWeight.w700),),
                                        )],),
                      ),
                  
                  
                    ),
                  ),
      
       GestureDetector(onTap: (){
       // Navigator.push(context, MaterialPageRoute(builder: (context)=>))
       },
         child: Padding(
           padding: const EdgeInsets.only(top:10,bottom: 15),
           child: Text('234 user reviews',style: TextStyle(fontSize: 18,fontWeight: FontWeight.w400,color: black, decoration: TextDecoration.underline,),),
         ),
       ),
      Column(crossAxisAlignment: CrossAxisAlignment.start,
        children: [
      Padding(padding: EdgeInsets.only(top: 30,bottom: 10,left: 15,right: 15),child: Row(children: [
      Row(mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('Overall rating',style: TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w700),),
          SizedBox(width: 3,),
        SvgPicture.asset("assets/images/star.svg",height: 14),
        SvgPicture.asset("assets/images/star.svg",height: 14),
        SvgPicture.asset("assets/images/star.svg",height: 14),
        SvgPicture.asset("assets/images/whitestar.svg",height: 14),
        ],
      ),
      
                  ],)
                  ),
      
                 Padding(
                   padding: const EdgeInsets.only(top:10.0,left: 15,right: 15,bottom: 5),
                   child: Text('Tell us more about experience',style: TextStyle(color: black,fontSize: 14,fontWeight: FontWeight.w700) ,),
                 ),
                 Padding(
                   padding: const EdgeInsets.all(15.0),
                   child: DescriptionLong(
                  
                    hintText:"Type your message here",
                   ),
                 ),
      
                  // SizedBox(
                  //       height: MediaQuery.of(context).size.height * 0.03,
                  //     ),
                      Padding(
                        padding: const EdgeInsets.all(15.0),
                        child: Material(
                            borderRadius: BorderRadius.circular(10.0),
                            color: yellow,
                            child: MaterialButton(
                                minWidth: MediaQuery.of(context).size.width,
                                onPressed: () {
                                  //  Navigator.push(context, MaterialPageRoute(builder: (context)=> ()));
                                },
                                child: Center(
                                  child: Text(
                                    'Submit',
                                    style: TextStyle(
                                        color: black,
                                        fontSize: 18,
                                        fontFamily: 'Kadwa',
                                        fontWeight: FontWeight.w700),
                                  ),
                                ))),
                      )
      
      ],),
       
                  
                ],),
      )


    );
  }
}
