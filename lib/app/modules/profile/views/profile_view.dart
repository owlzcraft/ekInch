import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/profile/widgets/profile_image.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';
import 'package:flutter_application_00/widgets/phone_text_field.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/assets.dart';
import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  ProfileView({Key? key}) : super(key: key);
  @override
  ProfileController controller = Get.put(ProfileController());
  String dropdownvalue = 'Electrician Mechanic';

  // List of items in our dropdown menu
  var items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Column(
              children: [
                ProfileImage(),
                Text(
                  "Sanjay Singh",
                  style: GoogleFonts.kadwa(
                      color: Color(0xFF1A1D1E),
                      fontSize: getFontSize(28),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  'Electrician Mechanic',
                  style: GoogleFonts.kadwa(
                      fontSize: getFontSize(20), color: Color(0xFF6A6A6A)),
                ),
                Image.asset(
                  Assets.verified,
                  width: getHorizontalSize(114),
                  height: getVerticalSize(28),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    initialValue: "Sanjay Singh",
                    decoration: InputDecoration(
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color(0xFFFEBA0F))),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Image.asset(
                        'assets/images/name_text_icon.png',
                      ),
                    ),
                    style: GoogleFonts.kadwa(
                        fontSize: getFontSize(22), color: Color(0xFF636363)),
                  ),
                  MobileTextField(controller.numberController),
                  TextField(
                    decoration: InputDecoration(
                      hintText: 'J-124, Roorkee',
                      contentPadding: EdgeInsets.symmetric(vertical: 12),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide: BorderSide(color: Color(0xFFFEBA0F))),
                      border: OutlineInputBorder(
                        borderSide: BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Image.asset(
                        'assets/images/location_text_icon.png',
                      ),
                    ),
                    style: GoogleFonts.kadwa(
                        fontSize: getFontSize(22), color: Color(0xFF636363)),
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xFFCDCDCD))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10.0),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF999999),
                          ),
                        ),
                        value: dropdownvalue,
                        isExpanded: true,
                        focusColor: Color(0xFFFEBA0F),
                        items: controller.professionList.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/profession_text_icon.png'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        value,
                                        style: GoogleFonts.kadwa(
                                            fontSize: getFontSize(22),
                                            color: Color(0xFF636363)),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  Container(
                    width: Get.width,
                    padding: EdgeInsets.symmetric(vertical: 5),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(color: Color(0xFFCDCDCD))),
                    child: DropdownButtonHideUnderline(
                      child: DropdownButton<String>(
                        hint: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          child: Row(
                            children: [
                              Image.asset(
                                  "assets/images/experience_text_icon.png"),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Text(
                                  "Experience",
                                  style: GoogleFonts.kadwa(
                                      fontSize: getFontSize(22),
                                      color: Color(0xFF636363)),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon: Padding(
                          padding: const EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.keyboard_arrow_down,
                            color: Color(0xFF999999),
                          ),
                        ),
                        isExpanded: true,
                        focusColor: Color(0xFFFEBA0F),
                        items: controller.professionList.map((String value) {
                          return DropdownMenuItem<String>(
                              value: value,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  children: [
                                    Image.asset(
                                        'assets/images/experience_text_icon.png'),
                                    Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10.0),
                                      child: Text(
                                        value,
                                        style: GoogleFonts.kadwa(
                                            fontSize: getFontSize(22),
                                            color: Color(0xFF636363)),
                                      ),
                                    ),
                                  ],
                                ),
                              ));
                        }).toList(),
                        onChanged: (_) {},
                      ),
                    ),
                  ),
                  DynamicButton("Update", false, () {}),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logout_icon_profile.png',
                            width: 30, height: 50),
                        Text(
                          'Log Out',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )
          ]),
        ));
  }
}
