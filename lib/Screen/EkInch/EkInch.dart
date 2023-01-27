import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../Others/entryfield.dart';
import '../Style/Style.dart';
import '../UltraTech/UltraTech.dart';

class EkInch extends StatefulWidget {
  const EkInch({Key? key}) : super(key: key);

  @override
  _EkInchState createState() => _EkInchState();
}

class _EkInchState extends State<EkInch> {
  TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        centerTitle: true,
        elevation: 0,
        leading:
        Image.asset('assets/images/menu.png',cacheHeight: 18,),
        title:  Text('Ek Inch',style: TextStyle(fontSize: 18,fontFamily: 'Kadwa',fontWeight: FontWeight.w700),),
        actions: [
          SvgPicture.asset("assets/images/heart.svg",height: 20,),
          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
          Icon(Icons.notifications_none,),
          SizedBox(width: MediaQuery.of(context).size.width*0.03,)
        ],

      ),
      body: SingleChildScrollView(
        child: Column(
          //crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          Container(height: 100,color: black,
          child: Padding(
            padding:  EdgeInsets.only(left: 15.0,right: 10,top: 10,bottom: 10),
            child: Row(mainAxisAlignment: MainAxisAlignment.start,
              children: [

              Expanded(
                child: TextFeildWhite(
                  controller: _searchcontroller,
                  hintText: 'Job, location and other',
                ),
              ),
              SizedBox(width: MediaQuery.of(context).size.width*0.05,),
              Container(
                width: 50,
                  height:50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(color: whitedark,width: 0.5)
                  ),
                  child: Padding(
                    padding:  EdgeInsets.all(15.0),
                    child: SvgPicture.asset("assets/images/shape.svg",),
                  ),),

            ],),
          ),),
            Container(
              color: whitedark,
               height:80,
              child: Column(crossAxisAlignment: CrossAxisAlignment.start,

                children: [
                  Padding(
                    padding:  EdgeInsets.all(15.0),
                    child:   Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        OutlinedButton(
                            style: OutlinedButton.styleFrom(
                              backgroundColor: yellow,
                              side: BorderSide.none,
                              fixedSize: Size(170,0),
                              shape: StadiumBorder(),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [

                                Text(
                                  'Upload Resume',
                                  style: TextStyle(
                                      color: black, fontSize: 14,fontFamily: "Kadwa",fontWeight: FontWeight.w700),
                                ),
                                SizedBox(
                                  width:
                                  MediaQuery.of(context).size.width *
                                      0.03,
                                ),
                                SvgPicture.asset('assets/images/upload.svg',height: 15,),

                              ],
                            )),
                        Text(
                          '35 Jobs',
                          style: TextStyle(
                              color: black, fontSize: 16,fontFamily: "Kadwa",fontWeight: FontWeight.w400),
                        ),
                      ],
                    ),
                  ),
                  // Expanded(child: ()),
                ],
              ),
            ),
            Padding(
              padding:  EdgeInsets.only(left: 10.0,right: 15,top: 15,bottom: 20),
              child: Column(
                children: [
                  Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                    Expanded(child: Dropdownshort(
                  dropdownvalue:'Full-time job',
                    items: [
                      'Full-time job',
                      'Part-time job',
                    ],
                  ),
                    ),

                  SizedBox(width: MediaQuery.of(context).size.width*0.4,),
                      Positioned(right:0,child: SvgPicture.asset("assets/images/refresh.svg",color: grey,))
                  ],),
                  GestureDetector(onTap: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>UltraTech()));
                  },
                    child: Container(height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Card(elevation: 1,color: whitedark,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 15.0,right: 10,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                    Padding(
                                      padding:  EdgeInsets.only(top: 5.0),
                                      child: Image.asset('assets/images/ultra1.png'),
                                    ),

                                Padding(
                                  padding:  EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [


                                            Row(mainAxisAlignment: MainAxisAlignment.start,
                                              children: [
                                                Column(crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [
                                                  Text('Plumber Engineer',style: TextStyle(fontSize: 16,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                                    Text('UltraTech Cement, India',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),

                                                ],),
                                                SizedBox(width: 5,),
                                                Column(crossAxisAlignment: CrossAxisAlignment.end,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: [

                                                    Icon(Icons.share_outlined,color:greylightdark,size: 18),
                                                    SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                                    Text('2 days ago',style: TextStyle(fontSize: 12,color: greylightdark,
                                                        fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),

                                                  ],),
                                              ],
                                            ),



                                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                        SvgPicture.asset('assets/images/grad.svg'),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                        Text('10th Pass - 2 years  experience',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                      ],),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          SvgPicture.asset('assets/images/money.svg'),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                          Text('1800-2500/month',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                       SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                                          Row(children: [
  SvgPicture.asset('assets/images/location.svg'),
  Text('Rorkee',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),

],)
                                        ],),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          SvgPicture.asset('assets/images/seak.svg'),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          Text('Good speak hindi and write',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),


                                        ],),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                            Divider(color: Boxborder,thickness: 0.5,),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                              Row(
                                children: [
                                  Image.asset("assets/images/group.png"),
                               SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                                    Text('200 views',style: TextStyle(fontSize: 12,color: greylight,fontWeight: FontWeight.w400,fontFamily: "Kadwa"),),
                                ],
                              )
,


                                OutlinedButton(
                                    style: OutlinedButton.styleFrom(

                                      side: BorderSide(color: black,width: 1),
                                      fixedSize: Size(130,0),
                                      shape: StadiumBorder(),
                                    ),
                                    onPressed: () {},
                                    child: Text(
                                          'Read More',
                                          style: TextStyle(
                                              color: black, fontSize: 14,fontFamily: "Kadwa",fontWeight: FontWeight.w400),
                                        ),

                                    ),
                              ],)


//                         CircleAvatar(
// backgroundColor: whitedark,
//                           child:  Stack(
//                             alignment: Alignment(1, 1),
//                             children: <Widget>[
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png")
//
//
//
//                             ],
//                           ),
//                         ),
                          ],
                        ),


                      ),



                    ),),
                  ),
                  SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                  Container(height: MediaQuery.of(context).size.height*0.4,
                    width: MediaQuery.of(context).size.width,
                    child: Card(elevation: 1,color: whitedark,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding:  EdgeInsets.only(left: 15.0,right: 10,top: 15,bottom: 15),
                        child: Column(
                          children: [
                            Row(mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Padding(
                                  padding:  EdgeInsets.only(top: 5.0),
                                  child: Image.asset('assets/images/ultra1.png'),
                                ),

                                Padding(
                                  padding:  EdgeInsets.only(left: 5),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [


                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Column(crossAxisAlignment: CrossAxisAlignment.start,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [
                                              Text('Plumber Engineer',style: TextStyle(fontSize: 16,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                              Text('UltraTech Cement, India',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),

                                            ],),
                                          SizedBox(width: 5,),
                                          Column(crossAxisAlignment: CrossAxisAlignment.end,
                                            mainAxisAlignment: MainAxisAlignment.start,
                                            children: [

                                              Icon(Icons.share_outlined,color:greylightdark,size: 18),
                                              SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                              Text('2 days ago',style: TextStyle(fontSize: 12,color: greylightdark,
                                                  fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),

                                            ],),
                                        ],
                                      ),



                                      SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SvgPicture.asset('assets/images/grad.svg'),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          Text('10th Pass - 2 years  experience',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                        ],),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          SvgPicture.asset('assets/images/money.svg'),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.03,),
                                          Text('1800-2500/month',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),

                                          Row(children: [
                                            SvgPicture.asset('assets/images/location.svg'),
                                            Text('Rorkee',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),

                                          ],)
                                        ],),
                                      SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                      Row(mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          SvgPicture.asset('assets/images/seak.svg'),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.01,),
                                          Text('Good speak hindi and write',style: TextStyle(fontSize: 12,color: greylight,fontFamily: 'Kadwa',fontWeight: FontWeight.w400),),
                                          SizedBox(width: MediaQuery.of(context).size.width*0.02,),


                                        ],),


                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),

                            Divider(color: Boxborder,thickness: 0.5,),
                            SizedBox(height: MediaQuery.of(context).size.height*0.02,),
                            Row(mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [


                                Row(
                                  children: [
                                    Image.asset("assets/images/group.png"),
                                    SizedBox(width: MediaQuery.of(context).size.width*0.02,),
                                    Text('200 views',style: TextStyle(fontSize: 12,color: greylight,fontWeight: FontWeight.w400,fontFamily: "Kadwa"),),
                                  ],
                                )
                                ,


                                OutlinedButton(
                                  style: OutlinedButton.styleFrom(

                                    side: BorderSide(color: black,width: 1),
                                    fixedSize: Size(130,0),
                                    shape: StadiumBorder(),
                                  ),
                                  onPressed: () {},
                                  child: Text(
                                    'Read More',
                                    style: TextStyle(
                                        color: black, fontSize: 14,fontFamily: "Kadwa",fontWeight: FontWeight.w400),
                                  ),

                                ),
                              ],)


//                         CircleAvatar(
// backgroundColor: whitedark,
//                           child:  Stack(
//                             alignment: Alignment(1, 1),
//                             children: <Widget>[
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png"),
//                               Image.asset("assets/images/gilrs.png")
//
//
//
//                             ],
//                           ),
//                         ),
                          ],
                        ),


                      ),



                    ),)
                ],
              ),
            )

          ],),
      ),
    );
  }
}
