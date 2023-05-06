import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/referNearn/controllers/refer_nearn_controller.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class InviteScreen extends StatelessWidget {
  InviteScreen({super.key});
  ReferNearnController controller = Get.put(ReferNearnController());
  @override
  Widget build(BuildContext context) {
    showDataAlertWorking() {
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
                "How it works",
                style: GoogleFonts.kadwa(
                    fontSize: 24.0, fontWeight: FontWeight.w400),
              ),
              content: Container(
                child: SingleChildScrollView(
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
              ),
            );
          });
    }

    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Colors.white),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: Image.asset(Assets.referNearnBG),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 5.0, horizontal: 20),
              child: Expanded(
                child: Text(
                  "Invite your friends",textAlign: TextAlign.center,
                  style: GoogleFonts.kadwa(
                      fontWeight: FontWeight.w600, fontSize: F20()),
                ),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20.0),
              child: Expanded(
                child: Text(
                  "Share the code below or ask them  to enter it during they signup. Earn wehn they signup groovey app",
                  textAlign: TextAlign.center,
                  style: GoogleFonts.kadwa(
                      fontSize: F16(),
                      fontWeight: FontWeight.w400,
                      color: Color(0xFF4E4E4E)),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 30.sp, horizontal: 16.sp),
              child: DynamicButton("Start Refering", true, () {
                // final RenderBox box = context.findRenderObject() as RenderBox;
                // Share.share(
                //   'Check out this awesome app!',
                //   subject: 'Download the app',
                //   sharePositionOrigin:
                //       box.localToGlobal(Offset.zero) & box.size,
                // );
                //   showModalBottomSheet(
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(10.0),
                //       ),
                //       backgroundColor: Colors.white,
                //       context: context,
                //       builder: ((context) => Column(
                //             children: [
                //               Text(
                //                 "Share to your friend by using these",
                //                 style: GoogleFonts.poppins(
                //                     fontSize: 12, color: Color(0xFF4E4E4E)),
                //               ),
                //               Expanded(
                //                   child: GridView.count(
                //                       physics: NeverScrollableScrollPhysics(),
                //                       scrollDirection: Axis.vertical,
                //                       // scrollDirection: Axis.,
                //                       shrinkWrap: true,
                //                       crossAxisCount: 3,
                //                       childAspectRatio: 0.9,
                //                       crossAxisSpacing: 2,
                //                       mainAxisSpacing: 5,
                //                       children: controller.referalIcons
                //                           .map((e) => Column(
                //                                 children: [
                //                                   Image.asset(
                //                                     e['asset'].toString(),
                //                                     scale: 2,
                //                                   ),
                //                                   Text(e['title'].toString())
                //                                 ],
                //                               ))
                //                           .toList()))
                //             ],
                //           )));
              }),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10.0),
              child: InkWell(
                onTap: () {
                  showDataAlertWorking();
                },
                child: Text(
                  "How does it work?",
                  style: GoogleFonts.poppins(
                      color: Color(0xFF4F4F4F),
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
