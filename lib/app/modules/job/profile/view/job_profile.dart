import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/message/view/message_chat.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/math_utils.dart';
import '../../../../custom_widget/color.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../notication/view/notification_view.dart';
import '../../../settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobProfileView extends StatefulWidget {
  final String photo;
  final String title;
  final String subTitle;
  final String location;
  final String schoolBoard;
  final String qualification;
  final String experience;
  final String language;
  final String contactNumber;
  final String dob;
  final String gender;
  final String skill;
  const JobProfileView(
      {super.key,
      required this.photo,
      required this.title,
      required this.subTitle,
      required this.location,
      required this.schoolBoard,
      required this.qualification,
      required this.experience,
      required this.language,
      required this.contactNumber,
      required this.dob,
      required this.gender,
      required this.skill});

  @override
  State<JobProfileView> createState() => _JobProfileViewState();
}

class _JobProfileViewState extends State<JobProfileView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: notDrawerKey,
      drawer: const SettingsView(),
      appBar: AppBar(
        leading: InkWell(
            onTap: () {
              Get.back();
            },
            child: const Icon(
              Icons.arrow_back,
              color: Colors.white,
              size: 30,
            )),
        actions: [
          IconButton(
              onPressed: () => {}, icon: SvgPicture.asset(Assets.share_white)),
          IconButton(
            padding: const EdgeInsetsDirectional.only(end: 9.11),
            onPressed: (() => {Get.to(() => NotificationView())}),
            icon: SvgPicture.asset(Assets.notification),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              height: 30,
              decoration: BoxDecoration(
                color: Colors.black,
                border: Border.all(color: Colors.black),
              ),
            ),
            Stack(children: [
              Container(
                height: getVerticalSize(90),
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black),
                ),
              ),
              Padding(
                padding: EdgeInsets.zero,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: getVerticalSize(115),
                        width: getHorizontalSize(115),
                        child: Stack(
                          clipBehavior: Clip.none,
                          fit: StackFit.expand,
                          children: [
                            CircleAvatar(
                              radius: 50.sp,
                              backgroundColor: const Color(0xFFE0E0E0),
                              child: CircleAvatar(
                                radius: 42.sp,
                                backgroundImage: NetworkImage(widget.photo),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Text(
                            widget.title,
                            style: GoogleFonts.kadwa(
                                color: const Color(0xFF1A1D1E),
                                fontSize: F28(),
                                fontWeight: FontWeight.w400),
                          ),
                          Text(
                            widget.subTitle,
                            style: GoogleFonts.kadwa(
                                height: 0.8,
                                fontSize: F18(),
                                color: const Color(0xFF6A6A6A)),
                          ),
                          Image.asset(
                            Assets.verified,
                            scale: 2.8,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ]),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 25.0, vertical: 16.0),
              child: Column(
                children: [
                  Container(
                    width: Get.width,
                    decoration: BoxDecoration(
                        border: Border.all(color: KColors.greyLine),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(4)),
                    child: Column(children: [
                      Padding(
                        padding: const EdgeInsets.only(
                            top: 16.0, right: 8.0, left: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              AppLocalizations.of(context)!.selfEmployee,
                              style: GoogleFonts.kadwa(
                                  color: const Color(0xFF1A1D1E),
                                  fontSize: F20(),
                                  fontWeight: FontWeight.w400),
                            ),
                            // Row(
                            //   mainAxisAlignment: MainAxisAlignment.start,
                            //   children: [
                            //     SvgPicture.asset(Assets.certified),
                            //     Padding(
                            //       padding: const EdgeInsets.symmetric(
                            //           horizontal: 6.0),
                            //       child: Text(
                            //         "View Certificate",
                            //         style: GoogleFonts.kadwa(
                            //             color: KColors.textGrey,
                            //             fontSize: F18(),
                            //             fontWeight: FontWeight.w400),
                            //       ),
                            //     ),
                            //   ],
                            // ),
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 4.0,
                        ),
                        child: Divider(
                          color: KColors.greyLine,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.location),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.location,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.edu),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.qualification,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.speak),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.language,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.birth),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 2.0),
                                      child: Text(
                                        widget.dob,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.money),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.schoolBoard,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.exp),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.experience,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    SvgPicture.asset(Assets.mobile),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.contactNumber,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.male_outlined,
                                      color: KColors.textGrey,
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.only(left: 8.0),
                                      child: Text(
                                        widget.gender,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: F16(),
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 18.0),
                        child: Expanded(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              SvgPicture.asset(Assets.suitcase),
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 5.0),
                                  child: Text(
                                    widget.skill,
                                    style: GoogleFonts.kadwa(
                                        height: 1.3,
                                        color: KColors.textGrey,
                                        fontSize: F16(),
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 12.0),
                        child: Container(
                          width: Get.width,
                          decoration: const BoxDecoration(
                              color: KColors.greybg,
                              borderRadius: BorderRadius.only(
                                  bottomLeft: Radius.circular(4),
                                  bottomRight: Radius.circular(4))),
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: const EdgeInsets.only(top: 3),
                                        child: SvgPicture.asset(
                                          Assets.call,
                                        ),
                                      ),
                                      Text(
                                        AppLocalizations.of(context)!.call,
                                        style: GoogleFonts.kadwa(
                                            color: KColors.textGrey,
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ],
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.only(top: 3.0),
                                  child: InkWell(
                                    onTap: () {
                                      Get.to(const MessageView());
                                    },
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        SvgPicture.asset(Assets.msg),
                                        Text(
                                          AppLocalizations.of(context)!.chat,
                                          style: GoogleFonts.kadwa(
                                              color: KColors.textGrey,
                                              fontSize: 14,
                                              fontWeight: FontWeight.w400),
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                      )
                    ]),
                  ),
                ],
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 25.0, horizontal: 20),
              child: GFButton(
                onPressed: () {
                  // check();
                },
                color: KColors.orange,
                fullWidthButton: true,
                size: 50.2,
                text: AppLocalizations.of(context)!.hire,
                textStyle: GoogleFonts.kadwa(
                  color: Colors.black,
                  fontWeight: FontWeight.w700,
                  fontSize: F24(),
                ),
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabView(2),
    );
  }
}
