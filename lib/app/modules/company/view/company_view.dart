import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/company/view/textwithIcon.dart';
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
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../mobile/widget/yellow_button.dart';
import 'package:dropdown_button2/dropdown_button2.dart';

import '../../profile/controllers/profile_controller.dart';
import '../../profile/widgets/profile_image.dart';
import '../contoller/company_controller.dart';

class CompanyView extends StatefulWidget {
  CompanyView({Key? key}) : super(key: key);

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  CompanyController controller = Get.put(CompanyController());
  DashboardController dashboardController = Get.put(DashboardController());

  // List of items in our dropdown menu
  // final List<String> companyList = [
  //   "Cement Company",
  //   "Electric Company",
  //   "B Company",
  //   "D Company",
  //   "E Company",
  //   "A Company",
  // ];

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
                "Select Company Profile Pic",
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
              dashboardController.GetDashboard();
            },
            child: Icon(
              Icons.arrow_back,
              color: Colors.black,
              size: 30.sp,
            ),
          ),
        ),
        bottomNavigationBar: BottomTabView(9),
        body: SingleChildScrollView(
            child: Column(children: [
          InkWell(
            onTap: () {
              showDataAlertProfile();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: LocalStorage.shared.getComapanyLogo() == " "
                  ? ProfileImage("assets/images/profile_icon.png")
                  : ProfileImage("${LocalStorage.shared.getComapanyLogo()}"),
            ),
          ),
          Text(
            // LocalStorage.shared.getCompanyData()?.data?.name == null
            //     ?
            "Company Name",
            // : "${LocalStorage.shared.getCompanyData()!.data?.name}",
            style: GoogleFonts.kadwa(
                color: const Color(0xFF1A1D1E),
                height: 1.2,
                fontSize: F28(),
                fontWeight: FontWeight.w400),
          ),
          // Text(
          //   "Company Type",
          //   style: GoogleFonts.kadwa(
          //       height: 1.2, fontSize: F18(), color: const Color(0xFF6A6A6A)),
          // ),
          Padding(
            padding: const EdgeInsets.all(4.0),
            child: Image.asset(
              "assets/images/active_logo.png",
              scale: 2.0,
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                  child: TextFieldWithIcon(
                      // LocalStorage.shared.getCompanyData()?.data?.name == null
                      //     ?
                      "Company Name",
                      // : "${LocalStorage.shared.getCompanyData()!.data?.name}",
                      'assets/images/name_text_icon.png',
                      controller.companyName),
                ),
                TextFieldWithIcon(
                    // LocalStorage.shared.getCompanyData()?.data?.email == null
                    //     ?
                    "Company Email",
                    // : "${LocalStorage.shared.getCompanyData()!.data?.email}",
                    'assets/images/name_text_icon.png',
                    controller.companyEmail),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                  child: MobileTextFieldEdit(
                    context,
                    false,
                    controller.mobileNumber,
                    "",
                    // LocalStorage.shared.getCompanyData()?.data?.contact == null
                    // ?
                    "Company Contact",
                    // : "${LocalStorage.shared.getCompanyData()!.data?.contact}",
                  ),
                ),
                TextFieldWithIcon(
                    // LocalStorage.shared.getCompanyData()?.data?.address == null
                    // ?
                    "Company Address",
                    // : "${LocalStorage.shared.getCompanyData()!.data?.address}",
                    'assets/images/location_text_icon.png',
                    controller.companyAddress),
                // Padding(
                //   padding: EdgeInsets.symmetric(vertical: 12.sp),
                //   child: DropdownButtonFormField2(
                //     decoration: InputDecoration(
                //       prefixIcon: Padding(
                //         padding: const EdgeInsets.only(left: 8.0),
                //         child: Image.asset(
                //             'assets/images/profession_text_icon.png'),
                //       ),
                //       isDense: true,
                //       contentPadding: EdgeInsets.zero,
                //       border: OutlineInputBorder(
                //         borderSide: const BorderSide(color: Color(0xFFCDCDCD)),
                //         borderRadius: BorderRadius.circular(5),
                //       ),
                //     ),
                //     isExpanded: false,
                //     hint: Text(
                //       "Select Company",
                //       style: GoogleFonts.kadwa(
                //           fontSize: getFontSize(22),
                //           color: const Color(0xFF636363)),
                //     ),
                //     icon: const Padding(
                //       padding: EdgeInsets.all(8.0),
                //       child: Icon(
                //         Icons.keyboard_arrow_down,
                //         color: Colors.black45,
                //       ),
                //     ),
                //     iconSize: 30,
                //     buttonHeight: 60,
                //     dropdownDecoration: BoxDecoration(
                //       borderRadius: BorderRadius.circular(5),
                //     ),
                //     items: companyList
                //         .map((item) => DropdownMenuItem<String>(
                //               value: item,
                //               child: Text(
                //                 item,
                //                 style: GoogleFonts.kadwa(
                //                     fontSize: getFontSize(22),
                //                     color: const Color(0xFF636363)),
                //               ),
                //             ))
                //         .toList(),
                //     validator: (value) {
                //       if (value == null) {
                //         return 'Please Select Company';
                //       }
                //     },
                //     onChanged: (value) {
                //       controller.companyType.text = value as String;
                //       // controller.companytype.text = value as String;
                //     },
                //   ),
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 20.sp,
                  ),
                  child: DynamicButton("Update", true, () {
                    controller.updateCompanyProfile();
                  }),
                ),
              ],
            ),
          )
        ])));
  }
}
