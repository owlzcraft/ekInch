import 'package:flutter/material.dart';

PreferredSizeWidget UpperBar(String title, String pageName, bool notification,bool bell) {
  return PreferredSize(
      child: Container(padding: EdgeInsets.symmetric(vertical: 40),
        decoration: BoxDecoration(color: Colors.black,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/burger.png"),
                Text(title,style: TextStyle(color: Colors.white,fontSize: 24),),
                Row(
                  children: [
                    Visibility(
                      visible: pageName=="Records",
                      child: Image.asset("assets/images/Share.png"),
                    ),  Visibility(
                      visible: pageName=="ReferNearn",
                      child: Image.asset("assets/images/whiteback.png"),
                    ),
                    SizedBox(width: 10),
                    Stack(
                      children: [
                        Visibility(visible: bell,child: 
                        Image.asset("assets/images/bell.png"),
                        ),
                        notification
                            ? Positioned(
                                top: 1,
                                right: 0,
                                child: Image.asset("assets/images/redDot.png"),
                              )
                            : Container(),
                            Visibility(visible: pageName=="ReferNearn",child: Positioned(
                                top: 10,
                                right: 20,
                                child: Image.asset("assets/images/crown.png"),
                              )
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
      preferredSize: Size(double.infinity, 90));
}
