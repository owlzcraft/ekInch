import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/profile/views/profile_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../utils/localStorage.dart';
import '../widgets/settings_list_item.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({Key? key}) : super(key: key);

  @override
  State<SettingsView> createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  @override
  Widget build(BuildContext context) {
    var dataArr = [
      {
        "title": AppLocalizations.of(context)!.myProfile,
        "img": "assets/images/person.png",
      },
      {
        "title": AppLocalizations.of(context)!.myVideosReels,
        "img": "assets/images/video.png",
      },
      {
        "title": AppLocalizations.of(context)!.myCompany,
        "img": "assets/images/bell.png",
      },
      {
        "title": AppLocalizations.of(context)!.myJobAPplication,
        "img": "assets/images/bell.png",
      },
      {
        "title": AppLocalizations.of(context)!.myJobs,
        "img": "assets/images/message.png",
      },
      {
        "title": AppLocalizations.of(context)!.myResume,
        "img": "assets/images/person.png",
      },
      {
        "title": AppLocalizations.of(context)!.notifications,
        "img": "assets/images/bell.png",
      },
      {
        "title": AppLocalizations.of(context)!.share,
        "img": "assets/images/Share.png",
      },
      {
        "title": AppLocalizations.of(context)!.feedback,
        "img": "assets/images/message.png",
      },
      // {
      //   "title": AppLocalizations.of(context)!.settings,
      //   "img": "assets/images/settings.png",
      // },
      {
        "title": AppLocalizations.of(context)!.logOut,
        "img": "assets/images/logout.png",
      },
    ];
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.white.withOpacity(0.0),
          elevation: 0.0,
          actions: [
            Padding(
              padding: const EdgeInsets.only(top: 16.0, right: 30.0),
              child: InkWell(
                onTap: (() {
                  Get.back();
                }),
                child: CircleAvatar(
                    backgroundColor: KColors.orange,
                    radius: 10,
                    child: SvgPicture.asset(
                      Assets.cancel,
                    )),
              ),
            )
          ]),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    InkWell(
                        onTap: () => {Get.to(const ProfileView())},
                        child: CircleAvatar(
                          radius: 40.sp,
                          backgroundColor: const Color(0xFFE0E0E0),
                          child: Container(
                            height: 80.sp,
                            width: 80.sp,
                            decoration: BoxDecoration(
                              color: Colors.black,
                              shape: BoxShape.circle,
                              image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: LocalStorage.shared.getProfile() ==
                                          "https://d3nypwrzdy6f4k.cloudfront.net/"
                                      ? const AssetImage(
                                          'assets/images/profile_icon.png')
                                      : NetworkImage(
                                              LocalStorage.shared.getProfile())
                                          as ImageProvider),
                              border: Border.all(
                                  color: KColors.greyLine, width: 2.0),
                            ),
                          ),
                        )),
                    Padding(
                      padding: EdgeInsets.only(left: 12.sp),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                              direction: Axis.vertical,
                              // spacing: 8.0,
                              // runSpacing: 4.0,
                              children: [
                                Text(
                                  maxLines: 1,
                                  overflow: TextOverflow.fade,
                                  "${LocalStorage.shared.getUserData()!.userData!.firstName}",
                                  style: GoogleFonts.kadwa(
                                      fontSize: F22(),
                                      fontWeight: FontWeight.w400,
                                      color: const Color.fromARGB(255, 63, 61, 61)),
                                ),
                              ]),
                          Text(
                            "${LocalStorage.shared.getUserData()!.userData!.profession}",
                            style: GoogleFonts.kadwa(
                                height: 1.2,
                                fontSize: F18(),
                                fontWeight: FontWeight.w400,
                                color: const Color(0xFF6A6A6A)),
                          ),
                          Image.asset(
                            Assets.verified,
                            scale: 3.5,
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 12.sp),
                child: Column(
                  children: dataArr
                      .map((e) => SettingListItem(
                          e['img'].toString(), e['title'].toString()))
                      .toList(),
                ),
              ),
              
              SizedBox(
                height: 30.sp,
              ),
              Center(
                child: Text(
                  "V.7.8.33",
                  style: GoogleFonts.kadwa(color: const Color(0xFF272727)),
                ),
              ),
            
            ],
          ),
        ),
      ),
    );
  }
}
