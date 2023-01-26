import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/widgets/Upperbar.dart';
import 'package:scaled_list/scaled_list.dart';
import 'package:get/get.dart';

import '../controllers/records_controller.dart';

class RecordsView extends GetView<RecordsController> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/civil.png'},
    {"id": 2, "image_path": 'assets/images/civil.png'},
    {"id": 3, "image_path": 'assets/images/civil.png'}
  ];
   
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
appBar: AppBar(
//  toolbarHeight: 70,
  centerTitle: true,
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("Records",
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
        flexibleSpace: Stack(children: [
          Container(
            
          )
        ]),
        backgroundColor: Colors.black,

),


               
      body: Container(
        height:250,
        // width: 300,
        color: Colors.black,
        child: ScaledList(
          // cardWidthRatio: 200,
                  itemCount: categories.length,
                  itemColor: (index) {
                    return kMixedColors[index % kMixedColors.length];
                  },
                  itemBuilder: (index, selectedIndex) {
                    final category = categories[index];
                    return Container(
                          height: selectedIndex == index ? 140 : 80,
                          // width: selectedIndex == index ? 100 : 60,
                          child: Image.asset(category.image,width: 200,
                          height:120 ,),
                        );
                  },
                ),
      ),
          

     
      bottomNavigationBar: MyNavigator(),
    );
  }

  


  final List<Color> kMixedColors = [
    Color.fromARGB(255, 102, 103, 103),
    Color.fromARGB(255, 76, 78, 78),
    Color.fromARGB(255, 42, 42, 41),
    Color.fromARGB(255, 38, 37, 37),
    Color.fromARGB(255, 21, 21, 21),
    Color.fromARGB(255, 15, 15, 15),
    Color(0xfffb8457),
  ];

  final List<Category> categories = [
    Category(image: "assets/images/ayushman.png", ),
    Category(image: "assets/images/ayushman.png", ),
    Category(image: "assets/images/ayushman.png", ),
    Category(image: "assets/images/ayushman.png", ),
    Category(image: "assets/images/ayushman.png",),
  ];
}

class Category {
  final String image;
  // final String name;

  Category({required this.image, });
}
