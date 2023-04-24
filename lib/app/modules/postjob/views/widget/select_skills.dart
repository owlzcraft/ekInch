import 'package:ekinch/app/modules/listpostjob/controller/post_job_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../custom_widget/font_size.dart';
import '../../controllers/postjob_controller.dart';

class SelectSkillCard extends StatefulWidget {
  String title;
  SelectSkillCard({super.key, required this.title});

  @override
  State<SelectSkillCard> createState() => _SelectSkillCardState();
}

class _SelectSkillCardState extends State<SelectSkillCard> {
  PostjobController controller=Get.put(PostjobController());
  Color containerColor = Colors.white;

  Color onTapColor = const Color.fromARGB(255, 209, 207, 207);
  bool isSelected = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0, vertical: 6),
      child: InkWell(
        onTap: () {
          setState(() {
            if (isSelected) {
              controller.selectedSKills.remove(widget.title);
              print(controller.selectedSKills);
              setState(() {
                isSelected = false;
                containerColor = Colors.white;
              });
            } else {
              controller.selectedSKills.add(widget.title);
              print(controller.selectedSKills);
              setState(() {
                isSelected = true;
                containerColor = onTapColor;
              });
            }
          });
        },
        child: Container(
          decoration: BoxDecoration(
              border:
                  Border.all(color: const Color.fromARGB(255, 209, 207, 207)),
              color: containerColor,
              borderRadius: BorderRadius.circular(20)),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 2),
            child: Text(
              widget.title,
              style: GoogleFonts.kadwa(
                  fontSize: F14(),
                  color: const Color.fromARGB(255, 91, 90, 90)),
            ),
          ),
        ),
      ),
    );
  }
}
