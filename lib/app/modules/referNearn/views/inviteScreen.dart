import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_00/app/custom_widget/color.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_application_00/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter_application_00/app/modules/referNearn/controllers/refer_nearn_controller.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

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
                      ),Text(
                        "3. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: GoogleFonts.kadwa(
                            color: KColors.textGrey, fontSize: 14),
                      ),
                      Text(
                        "4. Lorem Ipsum is simply dummy text of the printing and typesetting industry.",
                        style: GoogleFonts.kadwa(
                            color: KColors.textGrey, fontSize: 14),
                      ),Text(
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
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Text(
                "Invite your friends",
                style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
              ),
            ),
            Text(
              "and get 250 point each",
              style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "Share the code below or ask them  to enter it",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
              ),
            ),
            Text(
              "during they signup. Earn wehn they",
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 8.0),
              child: Text(
                "signup groovey app",
                style: TextStyle(
                    fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: getVerticalSize(50), bottom: 20),
              child: DynamicButton("Start Refering", true, () {
                showModalBottomSheet(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    backgroundColor: Colors.white,
                    context: context,
                    builder: ((context) => Column(
                          children: [
                            Text(
                              "Share to your friend by using these",
                              style: GoogleFonts.poppins(
                                  fontSize: 12, color: Color(0xFF4E4E4E)),
                            ),
                            Expanded(
                                child: GridView.count(
                                    physics: NeverScrollableScrollPhysics(),
                                    scrollDirection: Axis.vertical,
                                    // scrollDirection: Axis.,
                                    shrinkWrap: true,
                                    crossAxisCount: 3,
                                    childAspectRatio: 0.9,
                                    crossAxisSpacing: 2,
                                    mainAxisSpacing: 5,
                                    children: controller.referalIcons
                                        .map((e) => Column(
                                              children: [
                                                Image.asset(
                                                  e['asset'].toString(),
                                                  scale: 2,
                                                ),
                                                Text(e['title'].toString())
                                              ],
                                            ))
                                        .toList()))
                          ],
                        )));
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
