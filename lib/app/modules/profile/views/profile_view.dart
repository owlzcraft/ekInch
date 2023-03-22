import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/views/dashboard_view.dart';
import 'package:ekinch/app/modules/mobile/views/mobile_view.dart';
import 'package:ekinch/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../../widgets/phone_text_field.dart';
import '../../../generated/assets.dart';
import '../../../utils/localStorage.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../mobile/widget/yellow_button.dart';
import '../controllers/profile_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../widgets/profile_image.dart';

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

  final List experienceList = [
    "0",
    "1",
    "2",
    "3",
    "4",
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
                    fontSize: F24(), fontWeight: FontWeight.w700),
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
                              size: 50.sp,
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
                            Icon(Icons.filter, size: 50.sp),
                            Text(
                              "Gallery",
                              style: GoogleFonts.kadwa(
                                  fontWeight: FontWeight.w400),
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
      backgroundColor: Colors.white,
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          leading: InkWell(
            onTap: () {
              Get.to(DashboardView());
            },
            child:  Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30.sp,
            ),
          ),
        ),
        bottomNavigationBar: BottomTabView(4),
        body: SingleChildScrollView(
          child: 
            Column(
              children: [
                InkWell(
                  onTap: () {
                    showDataAlertProfile();
                  },
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ProfileImage("${LocalStorage.shared.getProfile()}"),
                  ),
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                  style: TextStyle(
                      color: const Color(0xFF1A1D1E),
                      fontSize: F28(),
                      fontWeight: FontWeight.w400),
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.profession}",
                  style: TextStyle(
                      fontSize: F18(),
                      color: const Color(0xFF6A6A6A)),
                ),
                Image.asset(
                  Assets.verified,
                scale: 3.2,
                ),
            Padding(
              padding: EdgeInsets.symmetric(vertical:8.sp,horizontal: 16.sp),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:12.sp),
                    child: MobileTextFieldEdit(context, true, controller.mobileNumber,
                        "Edit", "${LocalStorage.shared.getUserData()?.userId}"),
                  ),
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
                      contentPadding: EdgeInsets.symmetric(vertical: 8.sp),
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
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:12.sp),
                    child: DropdownButtonFormField2(
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
                  ),
                  DropdownButtonFormField2(
                    decoration: InputDecoration(
                      suffix: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 40.0),
                        child: Text(
                          "Years",
                          style: GoogleFonts.kadwa(
                              fontSize: getFontSize(22),
                              color: const Color(0xFF636363)),
                        ),
                      ),
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
                  Padding(
                    padding:  EdgeInsets.symmetric(vertical:12.sp),
                    child: DynamicButton("Update", true, () {
                      controller.updateProfile();
                    }),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: InkWell(
                      onTap: () {
                        Get.until((route) => route.isFirst);
                        Get.off(MobileView());
                      },
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
                    ),
                  )
                ],
              ),
            )
          
        ])));
  }
}
