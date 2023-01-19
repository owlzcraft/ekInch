import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/work.widget.dart';

import 'package:get/get.dart';

import '../controllers/my_videos_controller.dart';

class MyVideosView extends GetView<MyVideosController> {
  const MyVideosView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // title: const Text('MyVideosView'),
        centerTitle: true,

          title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("My Videos",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700)
                  )
                ),
        leading: Icon(Icons.menu_sharp),
        // Image.asset("assets/images.menu.png"),
        actions: [
          Container(
              margin:const EdgeInsets.only(right: 10), 
              child:Row(children: [
                Icon(Icons.share_outlined),
                Icon(Icons.notification_add_outlined)
              ],)
              )
        ],

         backgroundColor: Colors.black,

      ),
      body:  SingleChildScrollView(
        child: Column(
          children: [
 Container(
              color: Colors.black,
              // padding: EdgeInsets.all(14),
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    margin: EdgeInsets.symmetric(horizontal: 15),
                    width: 200,
                     decoration: const BoxDecoration(
                    border:
                        Border(bottom: BorderSide(color: Color(0xFFFEBA0F))),
                        
                        ),
                    child: Padding(
                      padding: EdgeInsets.all(24),
                      child: Text(
                        "New Videos",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                 Container(
                   margin: EdgeInsets.symmetric(vertical: 10),
                    //  width: 200,
                    child: Padding(
                      padding: const EdgeInsets.all(24),
                      child: Text(
                        "All Videos",
                        style: TextStyle(
                          color: Colors.white,
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
   TextField(
  decoration: InputDecoration(
    prefixIcon: Icon(Icons.search),
    hintText: 'Search...',
  ),
  onChanged: (text) {
    // Update search results based on text input
  },
),
Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 18),
                    child: Text(
                      "Today Videos",
                      style: TextStyle(
                          fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 12),
                    child: Text(
                      "6 videos",
                      style: TextStyle(
                          fontSize: 15,
                          fontWeight: FontWeight.w400,
                          color: Colors.grey),
                    ),
                  )
                ],
              ),
            Container(
            width: MediaQuery.of(context).size.width ,
            // width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height/1.21842105263,
           // color: Color.fromARGB(255, 14, 14, 14),
            child: GridView.count(
          crossAxisCount: 2,
          children: List.generate(3, (index) {
            return Center(
              child: work()
                
                ,
            );
          }
          ),
        ),
      
          ),
          ],
        ),
      ),
          bottomNavigationBar: MyNavigator(),
    );
  }
}
