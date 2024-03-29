import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/company/view/textwithIcon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/phone_text_field.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../mobile/widget/yellow_button.dart';
import '../../profile/widgets/profile_image.dart';
import '../contoller/company_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class CompanyView extends StatefulWidget {
  final String companyName;
  final String email;
  final String contact;
  final String address;
  final String photo;
  final bool oldUser;

  const CompanyView(
      {super.key,
      required this.companyName,
      required this.address,
      required this.email,
      required this.oldUser,
      required this.contact,
      required this.photo});

  @override
  State<CompanyView> createState() => _CompanyViewState();
}

class _CompanyViewState extends State<CompanyView> {
  CompanyController controller = Get.put(CompanyController());
  DashboardController dashboardController = Get.put(DashboardController());
  @override
  void initState() {
    super.initState();
    if (widget.oldUser) {
      controller.companyName.text = widget.companyName;
      controller.companyAddress.text = widget.address;
      controller.companyEmail.text = widget.email;
      controller.contact.text = widget.contact;
    }
  }
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
              insetPadding: const EdgeInsets.all(10),
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(
                    4.0,
                  ),
                ),
              ),
              title: Text(
                AppLocalizations.of(context)!.selectCompanyProfilePic,
                style: GoogleFonts.kadwa(
                    fontSize: F24(), fontWeight: FontWeight.w700),
              ),
              content: SingleChildScrollView(
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
                            AppLocalizations.of(context)!.camera,
                            style:
                                GoogleFonts.kadwa(fontWeight: FontWeight.w400),
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
                            AppLocalizations.of(context)!.gallery,
                            style:
                                GoogleFonts.kadwa(fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            );
          });
    }

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
        bottomNavigationBar: const BottomTabView(9),
        body: SingleChildScrollView(
            child: Column(children: [
          InkWell(
            onTap: () {
              showDataAlertProfile();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileImage(widget.photo),
            ),
          ),
          Text(
            widget.companyName,
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
                      widget.companyName,
                      'assets/images/name_text_icon.png',
                      controller.companyName),
                ),
                TextFieldWithIcon(
                    widget.email,
                    'assets/images/name_text_icon.png',
                    controller.companyEmail),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                  child: MobileTextFieldEdit(
                    context,
                    false,
                    widget.contact,
                    controller.contact,
                    "",
                    widget.contact,
                  ),
                ),
                TextFieldWithIcon(
                    widget.address,
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
                  child: DynamicButton(AppLocalizations.of(context)!.update, true, () {
                    controller.updateCompanyProfile();
                  }),
                ),
              ],
            ),
          )
        ])));
  }
}
