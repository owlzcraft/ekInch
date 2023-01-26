// import 'dart:html';

import 'package:flutter/material.dart';

class cards extends StatelessWidget {
  final String imageUrl1;
  
  final String textB;

  // ignore: use_key_in_widget_constructors
  const cards({this.imageUrl1 = "", this.textB = ""});

  @override
  Widget build(BuildContext context) {
    return  
    
     
Container(
  width: 116,height: 140,

decoration: BoxDecoration(
boxShadow: [
  
                BoxShadow(
                  color: Colors.grey.shade300,
                  blurRadius: 1,
                  spreadRadius: 5,
                  offset: Offset(0, 0),
                ),
              ],
        border: Border.all(
        
          width: 0,
          color: Colors.grey,
        ),
      
        borderRadius: const BorderRadius.all(Radius.circular(7.5)
        ),
color: Colors.white,
      ),
      
child: Center(child: Column(
children: [

  Image.asset(
            imageUrl1,
            width: 40.0,
            height: 40.0,
            // scale: 1,
          ),
          Text(textB,style:TextStyle(fontSize:16,color: Colors.black )),
],

)),
);

  
  
  }
}
// onTap: () => Get.to(JobInterestedView()),