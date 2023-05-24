import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/mobile/views/mobile_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/math_utils.dart';
import '../../../../widgets/phone_text_field.dart';
import '../../../generated/assets.dart';
import '../../../utils/localStorage.dart';
import '../../dashboard/controllers/dashboard_controller.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../mobile/widget/yellow_button.dart';
import '../controllers/profile_controller.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import '../widgets/profile_image.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ProfileView extends StatefulWidget {
  const ProfileView({Key? key}) : super(key: key);

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  ProfileController controller = Get.put(ProfileController());
  DashboardController dashboardController = Get.put(DashboardController());


  final List experienceList = [
    '1',
    '2',
    '3',
    '4',
    '5',
    '6',
    '7',
    '8',
    '9',
    '10',
    '11',
    '12',
    '13',
    '14',
    '15',
    '16',
    '17',
    '18',
    '19',
    '20',
    '21',
    '22',
    '23',
    '24',
    '25',
    '26',
    '27',
    '28',
    '29',
    '30',
    '31',
    '32',
    '33',
    '34',
    '35',
    '36',
    '37',
    '38',
    '39',
    '40',
    '41',
    '42',
    '43',
    '44',
    '45',
    '46',
    '47',
    '48',
    '49',
    '50'
  ];

  @override
  Widget build(BuildContext context) {
    final List<String> professionList = [
    AppLocalizations.of(context)!.labour,
    AppLocalizations.of(context)!.plastermistri,
    AppLocalizations.of(context)!.tilesmistri,
    AppLocalizations.of(context)!.plumber,
    AppLocalizations.of(context)!.electrician,
    AppLocalizations.of(context)!.painter,
    AppLocalizations.of(context)!.carpenter,
    AppLocalizations.of(context)!.welder,
    AppLocalizations.of(context)!.barbender,
    AppLocalizations.of(context)!.contractor,
    AppLocalizations.of(context)!.dukandar,
    AppLocalizations.of(context)!.customer,
    AppLocalizations.of(context)!.engineer,
    AppLocalizations.of(context)!.architect,
    AppLocalizations.of(context)!.other
  ];
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
                 AppLocalizations.of(context)!.selectProfilePic,
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
                             AppLocalizations.of(context)!.gallery,
                            style: GoogleFonts.kadwa(
                                fontWeight: FontWeight.w400),
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
        bottomNavigationBar: const BottomTabView(4),
        body: SingleChildScrollView(
            child: Column(children: [
          InkWell(
            onTap: () {
              showDataAlertProfile();
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ProfileImage(LocalStorage.shared.getProfile().toString()),
            ),
          ),
          Text(
            "${LocalStorage.shared.getUserData()?.userData?.firstName}",
            style: GoogleFonts.kadwa(
                color: const Color(0xFF1A1D1E),
                fontSize: F28(),
                height: 1.2,
                fontWeight: FontWeight.w400),
          ),
          Text(
            "${LocalStorage.shared.getUserData()?.userData?.profession}",
            style: GoogleFonts.kadwa(
                fontSize: F18(), height: 1.2, color: const Color(0xFF6A6A6A)),
          ),
          Image.asset(
            Assets.verified,
            scale: 3.2,
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8.sp, horizontal: 16.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextFormField(
                  onChanged: (value) {
                    controller.name.text = value;
                  },
                  initialValue:
                      "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                  decoration: InputDecoration(
                    contentPadding: const EdgeInsets.symmetric(vertical: 12),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFFEBA0F))),
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
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                  child: MobileTextFieldEdit(
                      context,
                      true,
                      LocalStorage.shared.getnumber(),
                      controller.mobileNumber,
                       AppLocalizations.of(context)!.edit,
                      "${LocalStorage.shared.getUserData()?.userId}"),
                ),
                TextFormField(
                  onChanged: (value) {
                    controller.address.text = value;
                  },
                  initialValue: LocalStorage.shared
                              .getUserData()
                              ?.userData
                              ?.address ==
                          null
                      ?  AppLocalizations.of(context)!.enteryourAddress
                      : "${LocalStorage.shared.getUserData()?.userData?.address}",
                  decoration: InputDecoration(
                    hintText: LocalStorage.shared
                                .getUserData()
                                ?.userData
                                ?.address ==
                            null
                        ?  AppLocalizations.of(context)!.enteryourAddress
                        : "${LocalStorage.shared.getUserData()?.userData?.address}",
                    contentPadding: EdgeInsets.symmetric(vertical: 8.sp),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Color(0xFFFEBA0F))),
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
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
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
                      return null;
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
                         AppLocalizations.of(context)!.years,
                        style: GoogleFonts.kadwa(
                            fontSize: getFontSize(22),
                            color: const Color(0xFF636363)),
                      ),
                    ),
                    prefixIcon: Padding(
                      padding: const EdgeInsets.only(left: 8.0),
                      child:
                          Image.asset('assets/images/experience_text_icon.png'),
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
                        ?  AppLocalizations.of(context)!.yourExperience
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
                    return null;
                  },
                  onChanged: (value) {
                    controller.experience.text = value as String;
                  },
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 12.sp),
                  child: DynamicButton( AppLocalizations.of(context)!.update, true, () {
                    controller.updateProfile();
                  }),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 10),
                  child: InkWell(
                    onTap: () {
                      Get.until((route) => route.isFirst);
                      Get.off(const MobileView());
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/images/logout_icon_profile.png',
                            width: 30, height: 50),
                        Text(
                           AppLocalizations.of(context)!.logOut,
                          style: GoogleFonts.kadwa(
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
