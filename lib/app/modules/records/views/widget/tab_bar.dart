import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../../widgets/math_utils.dart';
import '../../../../custom_widget/color.dart';
import '../../../../custom_widget/font_size.dart';
import '../../../../generated/assets.dart';

class SectionCard extends StatelessWidget {
  final String title;
  final String subtitle;
  final String views;
  final String time;
  final String videoImage;
  const SectionCard(
      {super.key,
      required this.videoImage,
      required this.subtitle,
      required this.views,
      required this.time,
      required this.title});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              width: getHorizontalSize(74),
              height: getVerticalSize(74),
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: NetworkImage(videoImage), fit: BoxFit.cover),
                  color: KColors.greybg,
                  shape: BoxShape.rectangle),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: GoogleFonts.kadwa(
                        fontSize: F16(),
                        color: Colors.black,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    subtitle,
                    style: GoogleFonts.kadwa(
                      fontSize: F12(),
                      height: 1.2,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.remove_red_eye_outlined,
                          size: 18.sp,
                          color: Colors.grey,
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          child: Text(
                            views,
                            style: GoogleFonts.kadwa(
                                fontSize: F14(), color: Colors.grey),
                          ),
                        ),
                        Padding(
                          padding:
                              const EdgeInsets.symmetric(horizontal: 4.0),
                          child: SvgPicture.asset(Assets.watch,
                              color: Colors.grey),
                        ),
                        Text(
                          time,
                          style: GoogleFonts.kadwa(
                              fontSize: F14(), color: Colors.grey),
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        Positioned(
            top: 20.sp,
            bottom: 40.sp,
            right: 20.0,
            child: const Icon(Icons.check_circle_outline))
      ],
    );
  }
}
