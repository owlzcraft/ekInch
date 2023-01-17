import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/widgets/Upperbar.dart';

import 'package:get/get.dart';

import '../controllers/records_controller.dart';

class RecordsView extends GetView<RecordsController> {
  List imageList = [
    {"id": 1, "image_path": 'assets/images/ayushman.png'},
    {"id": 2, "image_path": 'assets/images/ex1.jpg'},
    {"id": 3, "image_path": 'assets/images/ex2.jpg'}
  ];
  final CarouselController carouselController = CarouselController();
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("data")),
      bottomSheet: Column(children: [
        Stack(
          children: [
            InkWell(
              onTap: () {
                print(currentIndex);
              },
              child: Container(
                padding: const EdgeInsets.all(35),
                color: Colors.black,
                child: CarouselSlider(
                  items: imageList
                      .map(
                        (item) => ClipRRect(
                          borderRadius: BorderRadius.all(Radius.circular(10)),
                          child: Image.asset(
                            item['image_path'],
                            fit: BoxFit.cover,
                            width: double.infinity,
                          ),
                        ),
                      )
                      .toList(),
                  carouselController: carouselController,
                  options: CarouselOptions(
                    scrollPhysics: const BouncingScrollPhysics(),
                    autoPlay: true,
                    aspectRatio: 2,
                    viewportFraction: 1,
                    onPageChanged: (index, reason) {
                      // setState(() {
                      //   currentIndex = index;
                      // });
                    },
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 20,
              left: 0,
              right: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: imageList.asMap().entries.map((entry) {
                  return GestureDetector(
                    onTap: () => carouselController.animateToPage(entry.key),
                    child: Container(
                      width: currentIndex == entry.key ? 20 : 10,
                      height: 10.0,
                      margin: const EdgeInsets.symmetric(
                        horizontal: 3.0,
                      ),
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: currentIndex == entry.key
                              ? const Color(0xfffEBA0F)
                              : Colors.black,
                          border:
                              Border.all(color: Color(0xffB4B4B4), width: 1)),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        ),
      ]),
      bottomNavigationBar: MyNavigator(),
    );
  }
}
