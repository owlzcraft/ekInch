import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:ekinch/app/modules/dashboard/widgets/work.widget.dart';

import 'package:get/get.dart';

import '../../dashboard/widgets/navigation.dart';
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
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700))),
        leading: IconButton(
          icon: Image.asset('assets/images/burger.png', width: 36, height: 36),
          onPressed: () {
            // Add your onPressed code here
          },
        ),
        // Image.asset("assets/images.menu.png"),
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(right: 15.0),
            child: SizedBox(
              // width: 150,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(Icons.share),
                  SizedBox(width: 10),
                  Stack(
                    children: [
                      Image.asset('assets/images/bell.png'),
                      Positioned(
                        top: 0,
                        right: 1.0,
                        child: Image.asset('assets/images/redDot.png'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],

        backgroundColor: Colors.black,
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(160),
          child: Column(children: [
            Container(
              // color: Colors.black,
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
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
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
                            fontSize: 18,
                            fontWeight: FontWeight.w700),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.all(10),
              color: Colors.white,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search...',
                    border: const OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCDCDCD)))),
                onChanged: (text) {
                  // Update search results based on text input
                },
              ),
            ),
          ]),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Today Videos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   // width: MediaQuery.of(context).size.width ,
            //   height: MediaQuery.of(context).size.height / 2,
            //   // color: Color.fromARGB(255, 14, 14, 14),
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     children: List.generate(3, (index) {
            //       return Padding(
            //           padding: EdgeInsets.only(left: 11, right: 11),
            //           child: work(image: 'assets/images/sample_thumb.jpg'));
            //     }),
            //   ),
            // ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 18),
                  child: Text(
                    "Today Videos",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
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
            // SizedBox(
            //   width: MediaQuery.of(context).size.width,
            //   // width: MediaQuery.of(context).size.width ,
            //   height: MediaQuery.of(context).size.height / 2.11842105263,
            //   // color: Color.fromARGB(255, 14, 14, 14),
            //   child: GridView.count(
            //     crossAxisCount: 2,
            //     children: List.generate(3, (index) {
            //       return Center(
            //         child: work(image: 'assets/images/sample_thumb.jpg'),
            //       );
            //     }),
            //   ),
            // ),
          ],
        ),
      ),
                    bottomNavigationBar: BottomTabView(1),

      // bottomNavigationBar: MyNavigator(),
    );
  }
}
