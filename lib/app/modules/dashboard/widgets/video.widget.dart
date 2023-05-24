import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class Video extends StatelessWidget {
  final String image;
  final int view;
  final String text;
  final Function() onTap;
  const Video(
      {super.key,
      required this.image,
      required this.view,
      required this.text,
      required this.onTap});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: [
          GestureDetector(
            onTap: () {
              // Get.to(ReelsPageFullScreen);
            },
            child: Container(
              width: (MediaQuery.of(context).size.width / 3.5).sp,
              height: (MediaQuery.of(context).size.height / 4.04809009283).sp,
              decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                  borderRadius: BorderRadius.circular(20.sp)),
            ),
          ),
          Positioned(
              child: Container(
            decoration: BoxDecoration(
                gradient: const LinearGradient(
                  begin: Alignment.bottomCenter,
                  end: Alignment.topCenter,
                  colors: [
                    Color.fromARGB(0, 0, 0, 1),
                    Color.fromARGB(255, 74, 73, 73)
                  ],
                ),
                borderRadius: BorderRadius.circular(20.sp)),
          )),
          Positioned(
              left: 40.sp,
              right: 40.sp,
              top: 60.sp,
              bottom: 60.sp,
              child: Image.asset("assets/images/vplay.png", scale: 1.5)),
          Positioned(
              top: 6.sp,
              right: 8.sp,
              child: Container(
                  width: 34.5.sp,
                  height: 13.5.sp,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Row(
                    // crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Icon(Icons.remove_red_eye_outlined, size: 12.sp),
                      Text(
                        "$view",
                        style: GoogleFonts.kadwa(
                            color: Colors.black, fontSize: F10()),
                      )
                    ],
                  ))),
          Positioned(
            left: 10.sp,
            bottom: 12.sp,
            child: RichText(
              overflow: TextOverflow.ellipsis,
              strutStyle: StrutStyle(fontSize: F16()),
              text: TextSpan(
                  style: GoogleFonts.kadwa(
                      color: Colors.white,
                      fontSize: F16(),
                      fontWeight: FontWeight.w400),
                  text: text),
            ),
          ),
        ],
      ),
    );
  }
}
