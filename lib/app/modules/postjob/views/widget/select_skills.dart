import 'package:ekinch/app/modules/job/jobInterested/widget/card.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/font_size.dart';


  SelectSkill(BuildContext context,controller) {
    
    return Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              color: Colors.white,
              child: GridView.count(
                physics: NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                children: controller.jobCategory.map((e) {
                  int index = controller.jobCategory.indexOf(e);
                  return Obx(() => GestureDetector(
                        onTap: () {
                          // controller.activeCategory.value = index;
                        },
                        child: Text(controller.jobCategory.indexOf(e))
                      ));
                }).toList(),
              ),
            );
  }
