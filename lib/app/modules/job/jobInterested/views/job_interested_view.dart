import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/job/jobInterested/widget/card.dart';

import 'package:get/get.dart';

import '../controllers/job_interested_controller.dart';

class JobInterestedView extends GetView<JobInterestedController> {
  const JobInterestedView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var videoCategoryData = [
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/PlasterMistri.png",
        "title": "PlasterMistri",
      },
      {
        "image": "assets/images/TilesMistri.png",
        "title": "TilesMistri",
      },
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/Electrician.png",
        "title": "Electrician",
      },
      {
        "image": "assets/images/Painter.png",
        "title": "Painter",
      },
      {
        "image": "assets/images/Carpenter.png",
        "title": "Carpenter",
      },
      {
        "image": "assets/images/TilesMistri.png",
        "title": "TilesMistri",
      },
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/Electrician.png",
        "title": "Electrician",
      },
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/Labour.png",
        "title": "Labour",
      },
      {
        "image": "assets/images/mores.png",
        "title": "More",
      },
    ];
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 70,
        title: const Padding(
            padding: EdgeInsets.symmetric(horizontal: 40),
            child: Text("I am Interested in",
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700))),
        leading: Icon(Icons.menu_sharp),
        // Image.asset("assets/images.menu.png"),
        actions: [
          Container(
              margin:const EdgeInsets.only(right: 10), 
              child:const Icon(Icons.search))
        ],
        backgroundColor: Colors.black,
      ),
      body:  GridView.count(
        crossAxisCount: 3,
        children: videoCategoryData.map((e) {
          return Padding(
            padding: const EdgeInsets.all(15.0),
            child: cards(
                imageUrl1:e["image"].toString(),
                textB: e["title"].toString()),
          );
        }).toList(),
      ),
      bottomNavigationBar: MyNavigator(),
    );
  }
}


