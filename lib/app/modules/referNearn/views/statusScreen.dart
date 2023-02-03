import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_application_00/app/modules/referNearn/controllers/refer_nearn_controller.dart';
import 'package:flutter_application_00/app/modules/referNearn/views/statusWidget.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class StatusScreen extends StatelessWidget {
  StatusScreen({super.key});

  TextEditingController _searchcontroller = TextEditingController();
  ReferNearnController controller = Get.put(ReferNearnController());
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        color: Color(0xFFF1F1F1),
        child: Column(
          children: [
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 20.0, horizontal: 25),
              child: TextFeildWhite(
                controller: _searchcontroller,
                hintText: 'Job, location and other',
              ),
            ),
            Column(
              children: controller.statusData
                  .map((e) => StatusWidget(
                      e['image'].toString(),
                      e['name'].toString(),
                      e['sentOn'].toString(),
                      e['code'].toString(),
                      e['accepted'] == "true" ? true : false,
                      int.parse(e['points'].toString())))
                  .toList(),
            )
          ],
        ),
      ),
    );
  }
}
