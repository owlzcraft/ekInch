import 'package:clipboard/clipboard.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
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
            Text(
              "Share the code below or ask them  to enter it",
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
            ),
            Text(
              "during they signup. Earn wehn they",
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
            ),
            Text(
              "signup groovey app",
              style: TextStyle(
                  fontWeight: FontWeight.w400, color: Color(0xFF4E4E4E)),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Text(
                "Your Referal Code",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w700,
                    fontSize: 15,
                    color: Color(0xFF4E4E4E)),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: 20.0, vertical: 10),
              child: DottedBorder(
                  borderType: BorderType.RRect,
                  radius: Radius.circular(5),
                  dashPattern: [5, 5],
                  strokeWidth: 1.5,
                  color: Color(0xFF048FF4),
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    color: Color(0xFFFFFFFF),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(controller.referalCode,
                              style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 22,
                                  color: Color(0xFFFEBA0F))),
                          Obx(() => (!controller.copied.value)
                              ? GestureDetector(
                                  onTap: () {
                                    controller.copied.value = true;
                                    FlutterClipboard.copy(
                                            controller.referalCode)
                                        .then((value) => {});
                                  },
                                  child: RichText(
                                    text: TextSpan(
                                      style: GoogleFonts.poppins(
                                        fontWeight: FontWeight.w500,
                                        color: Color(0xFF000B48),
                                      ),
                                      children: [
                                        WidgetSpan(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 5.0),
                                            child: Icon(
                                              Icons.copy,
                                              size: 16,
                                              color: Color(0xFF000B48),
                                            ),
                                          ),
                                        ),
                                        TextSpan(
                                          text: "Copy Code",
                                        ),
                                      ],
                                    ),
                                  ),
                                )
                              : RichText(
                                  text: TextSpan(
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      color: Color(0xFF000B48),
                                    ),
                                    children: [
                                      TextSpan(
                                        text: "Copied",
                                      ),
                                      WidgetSpan(
                                        child: Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          child: Icon(
                                            Icons.done,
                                            size: 16,
                                            color: Colors.green,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ))
                        ]),
                  )),
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
                                                SvgPicture.asset(
                                                    e['asset'].toString()),
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
              child: Text(
                "How does it work?",
                style: GoogleFonts.poppins(
                    color: Color(0xFF4F4F4F),
                    decoration: TextDecoration.underline),
              ),
            )
          ],
        ),
      ),
    );
  }
}
