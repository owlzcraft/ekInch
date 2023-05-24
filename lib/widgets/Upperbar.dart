// ignore_for_file: non_constant_identifier_names, file_names

import 'package:flutter/material.dart';

PreferredSizeWidget UpperBar(String title, String pageName, bool notification,bool bell) {
  return PreferredSize(
      preferredSize: const Size(double.infinity, 90),
      child: Container(padding: const EdgeInsets.symmetric(vertical: 40),
        decoration: const BoxDecoration(color: Colors.black,),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Image.asset("assets/images/burger.png"),
                Text(title,style: const TextStyle(color: Colors.white,fontSize: 24),),
                Row(
                  children: [
                    Visibility(
                      visible: pageName=="Records",
                      child: Image.asset("assets/images/Share.png"),
                    ),  Visibility(
                      visible: pageName=="ReferNearn",
                      child: Image.asset("assets/images/whiteback.png"),
                    ),
                    const SizedBox(width: 10),
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
      ));
}
