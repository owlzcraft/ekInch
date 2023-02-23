import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/profile/widgets/image_source_sheet.dart';
import 'package:flutter_application_00/app/modules/profile/widgets/profile_image.dart';
import 'package:flutter_application_00/app/utils/localStorage.dart';
import 'package:flutter_application_00/widgets/math_utils.dart';
import 'package:flutter_application_00/widgets/phone_text_field.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../generated/assets.dart';
import '../../dashboard/widgets/navigation.dart';
import '../controllers/profile_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

class ProfileView extends StatefulWidget {
  ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  ProfileController controller = Get.put(ProfileController());

  // List of items in our dropdown menu
  final List<String> professionList = [
    "Electrician",
    "Painter",
    "Labour",
    "Mechanic"
  ];

  final List<String> experienceList = [
    "0-6 Months",
    "1 Year",
    "2 Year",
    "3 Year"
  ];

  @override
  Widget build(BuildContext context) {
    showDataAlertProfile() {
      showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              insetPadding: EdgeInsets.all(10),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Text(
                "Select Profile Pic",
                style: GoogleFonts.kadwa(
                    fontSize: 24.0, fontWeight: FontWeight.w700),
              ),
              content: Container(
                child: SingleChildScrollView(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      InkWell(
                        onTap: () {
                          controller.pickProfileCamera();
                        },
                        child: Column(
                          children: [
                            Icon(
                              Icons.camera_alt_outlined,
                              size: 50,
                            ),
                            Text(
                              "Camera",
                              style: GoogleFonts.kadwa(
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickProfileGallery();
                        },
                        child: Column(
                          children: [
                            Icon(Icons.filter, size: 50),
                            Text(
                              "Gallery",
                              style:
                                  GoogleFonts.kadwa(fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              ),
            );
          });
    }

    String? selectedValue;
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30,
            ),
          ),
        ),
        bottomNavigationBar: BottomTabView(4),
        body: Container(
          color: Colors.white,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(children: [
            Column(
              children: [
                InkWell(
                  onTap: () {
                    // controller.pickProfile();
                    showDataAlertProfile();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileImage(
                        "${LocalStorage.shared.getUserData()?.userData?.photo}"),
                  ),
                ),
                Text(
                    "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                    style: TextStyle(
                        color: const Color(0xFF1A1D1E),
                        fontSize: getFontSize(28),
                        fontWeight: FontWeight.w400),
                  
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.profession}",
                  style: TextStyle(
                      fontSize: getFontSize(20),
                      color: const Color(0xFF6A6A6A)),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Image.asset(
                    Assets.verified,
                    width: getHorizontalSize(114),
                    height: getVerticalSize(28),
                  ),
                ),
              ],
            ),
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  TextFormField(
                    onChanged: (value) {
                      controller.name.text = value as String;
                    },
                    initialValue:
                        "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                    decoration: InputDecoration(
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xFFFEBA0F))),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 8.0),
                        child: Image.asset(
                          'assets/images/name_text_icon.png',
                        ),
                      ),
                    ),
                    style: GoogleFonts.kadwa(
                        fontSize: getFontSize(22),
                        color: const Color(0xFF636363)),
                  ),
                  MobileTextFieldEdit(context, true, controller.mobileNumber,
                      "Edit", "${LocalStorage.shared.getUserData()?.userId}"),
                  TextField(
                    onChanged: (value) {
                      controller.address.text = value as String;
                    },
                    decoration: InputDecoration(
                      hintText: LocalStorage.shared
                                  .getUserData()
                                  ?.userData
                                  ?.address ==
                              null
                          ? "Enter Your Address"
                          : "${LocalStorage.shared.getUserData()?.userData?.address}",
                      contentPadding: const EdgeInsets.symmetric(vertical: 12),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(5),
                          borderSide:
                              const BorderSide(color: Color(0xFFFEBA0F))),
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(right: 18.0, left: 8.0),
                        child: Image.asset(
                          'assets/images/location_text_icon.png',
                        ),
                      ),
                    ),
                    style: GoogleFonts.kadwa(
                        fontSize: getFontSize(22),
                        color: const Color(0xFF636363)),
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                            'assets/images/profession_text_icon.png'),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    isExpanded: false,
                    hint: Text(
                      "${LocalStorage.shared.getUserData()!.userData!.profession}",
                      style: GoogleFonts.kadwa(
                          fontSize: getFontSize(22),
                          color: const Color(0xFF636363)),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black45,
                      ),
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    items: professionList
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: const Color(0xFF636363)),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Profession';
                      }
                    },
                    onChanged: (value) {
                      controller.profession.text = value as String;
                    },
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      prefixIcon: Padding(
                        padding: const EdgeInsets.only(left: 8.0),
                        child: Image.asset(
                            'assets/images/experience_text_icon.png'),
                      ),
                      isDense: true,
                      contentPadding: EdgeInsets.zero,
                      border: OutlineInputBorder(
                        borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    isExpanded: false,
                    hint: Text(
                      LocalStorage.shared.getUserData()!.userData?.years == null
                          ? "Your Experience"
                          : "${LocalStorage.shared.getUserData()!.userData?.years}",
                      style: GoogleFonts.kadwa(
                          fontSize: getFontSize(22),
                          color: const Color(0xFF636363)),
                    ),
                    icon: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.black45,
                      ),
                    ),
                    iconSize: 30,
                    buttonHeight: 60,
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    items: experienceList
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: GoogleFonts.kadwa(
                                    fontSize: getFontSize(22),
                                    color: const Color(0xFF636363)),
                              ),
                            ))
                        .toList(),
                    validator: (value) {
                      if (value == null) {
                        return 'Please Select Experience';
                      }
                    },
                    onChanged: (value) {
                      controller.experience.text = value as String;
                    },
                  ),
                  DynamicButton("Update", true, () {
                    controller.updateProfile();
                  }),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logout_icon_profile.png',
                            width: 30, height: 50),
                        const Text(
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
