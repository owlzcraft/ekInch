// ignore_for_file: file_names

import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/referNearn/controllers/refer_nearn_controller.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:share_plus/share_plus.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class InviteScreen extends StatefulWidget {
  const InviteScreen({super.key});

  @override
  State<InviteScreen> createState() => _InviteScreenState();
}

class _InviteScreenState extends State<InviteScreen> {
  ReferNearnController controller = Get.put(ReferNearnController());

  @override
  Widget build(BuildContext context) {
    showDataAlertWorking() {
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
                AppLocalizations.of(context)!.referWork,
                style: GoogleFonts.kadwa(
                    fontSize: 24.0, fontWeight: FontWeight.w400),
              ),
              content: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Text(
                      "1. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.kadwa(
                          color: KColors.textGrey, fontSize: 14),
                    ),
                    Text(
                      "2. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.kadwa(
                          color: KColors.textGrey, fontSize: 14),
                    ),
                    Text(
                      "3. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.kadwa(
                          color: KColors.textGrey, fontSize: 14),
                    ),
                    Text(
                      "4. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.kadwa(
                          color: KColors.textGrey, fontSize: 14),
                    ),
                    Text(
                      "5. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                      style: GoogleFonts.kadwa(
                          color: KColors.textGrey, fontSize: 14),
                    )
                  ],
                ),
              ),
            );
          });
    }

    return SingleChildScrollView(
      child: Container(
        decoration: const BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(Assets.referNearnBG),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
              child: Text(
                AppLocalizations.of(context)!.referT,
                textAlign: TextAlign.center,
                style: GoogleFonts.kadwa(
                    fontWeight: FontWeight.w600, fontSize: F20()),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Text(
                AppLocalizations.of(context)!.referS,
                textAlign: TextAlign.center,
                style: GoogleFonts.kadwa(
                    fontSize: F16(),
                    fontWeight: FontWeight.w400,
                    color: const Color(0xFF4E4E4E)),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 16.sp),
              child: DynamicButton(AppLocalizations.of(context)!.startRefering, true, () {
                final RenderBox box = context.findRenderObject() as RenderBox;
                Share.share(
                  'Check out this awesome app!',
                  subject: 'Download the app',
                  sharePositionOrigin:
                      box.localToGlobal(Offset.zero) & box.size,
                );
                // showModalBottomSheet(
                //     shape: RoundedRectangleBorder(
                //       borderRadius: BorderRadius.circular(10.0),
                //     ),
                //     backgroundColor: Colors.white,
                //     context: context,
                //     builder: ((context) => Column(
                //           children: [
                //             Text(
                //               "Share to your friend by using these",
                //               style: GoogleFonts.poppins(
                //                   fontSize: 12, color: Color(0xFF4E4E4E)),
                //             ),
                //             Expanded(
                //                 child: GridView.count(
                //                     physics: NeverScrollableScrollPhysics(),
                //                     scrollDirection: Axis.vertical,
                //                     // scrollDirection: Axis.,
                //                     shrinkWrap: true,
                //                     crossAxisCount: 3,
                //                     childAspectRatio: 0.9,
                //                     crossAxisSpacing: 2,
                //                     mainAxisSpacing: 5,
                //                     children: controller.referalIcons
                //                         .map((e) => Column(
                //                               children: [
                //                                 Image.asset(
                //                                   e['asset'].toString(),
                //                                   scale: 2,
                //                                 ),
                //                                 Text(e['title'].toString())
                //                               ],
                //                             ))
                //                         .toList()))
                //           ],
                //         )));
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InkWell(
                onTap: () {
                  showDataAlertWorking();
                },
                child: Text(
                  AppLocalizations.of(context)!.referWork,
                  style: GoogleFonts.poppins(
                      color: const Color(0xFF4F4F4F),
                      decoration: TextDecoration.underline),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
