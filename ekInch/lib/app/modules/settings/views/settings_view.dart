import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/profile/views/profile_view.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/settings_controller.dart';
import '../widgets/settings_list_item.dart';

class SettingsView extends GetView<SettingsController> {
  const SettingsView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var data_arr = [
      {
        "title": "My Profile",
        "img": "assets/images/profile_icon.png",
      },
      {
        "title": "My Videos (Reels)",
        "img": "assets/images/reels_icon.png",
      },
      {
        "title": "Notifications",
        "img": "assets/images/certificate_icon.png",
      },
      {
        "title": "My Certificate",
        "img": "assets/images/notification_icon.png",
      },
      {
        "title": "Share and Earn",
        "img": "assets/images/share_icon.png",
      },
      {
        "title": "Feedback",
        "img": "assets/images/feedback_icon.png",
      },
      {
        "title": "Settings",
        "img": "assets/images/settings_icon.png",
      },
      {
        "title": "Log Out",
        "img": "assets/images/logout_icon.png",
      },
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20),
                    child: CircleAvatar(
                      backgroundColor: Color(0xFFFEBA0F),
                      radius: 10,
                      child: Icon(
                        Icons.close,
                        size: 20,
                        color: Colors.black,
                      ),
                    ),
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black,
                        width: 2.0,
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      radius: 39,
                      backgroundColor: Color(0xFFE0E0E0),
                      child: CircleAvatar(
                        radius: 35,
                        backgroundImage:
                            AssetImage("assets/images/profile.jpg"),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.symmetric(horizontal: 15),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Sanjay Singh",
                            style: GoogleFonts.kadwa(
                                fontSize: 23,
                                fontWeight: FontWeight.w400,
                                color: Color.fromARGB(255, 63, 61, 61)),
                          ),
                          Text(
                            "Electrician Mechanic",
                            style: GoogleFonts.kadwa(
                                fontWeight: FontWeight.w400,
                                color: Color(0xFF6A6A6A)),
                          ),
                          Image.asset(
                            'assets/images/verified_icon.png',
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: Column(
                  children: data_arr
                      .map((e) => SettingListItem(
                              e['img'].toString(), e['title'].toString()))
                      .toList(),
                ),
              ),
              Container(
                padding: EdgeInsets.symmetric(vertical: 40),
                child: Text(
                  "V.7.8.33",
                  style: GoogleFonts.kadwa(color: Color(0xFF272727)),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
