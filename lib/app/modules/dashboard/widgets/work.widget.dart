import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class work extends StatelessWidget {
  final String image;
  final String view;
  final String text;
  work(
      {required this.image ,
      required this.view ,
      required this.text });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 6.0, vertical: 5.0),
      child: Stack(
        children: [
          Container(
            width: (MediaQuery.of(context).size.width / 3.2).sp,
            height: (MediaQuery.of(context).size.height / 4.04809009283).sp,
            decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(20.sp)),
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
              bottom: 60.sp,
              right: 40.sp,
              top: 60.sp,
              child: Image.asset(
                "assets/images/vplay.png",
                scale: 1.2,
              )),
          Positioned(
              top: 8.sp,
              right: 8.sp,
              child: Container(
                  width: 13.5.sp,
                  height: 13.5.sp,
                  decoration: BoxDecoration(
                    color: const Color(0xffFEBA0F),
                    borderRadius: BorderRadius.circular(25.sp),
                  ),
                  child: Icon(Icons.share, size: 8.sp))),
          Positioned(
              left: 15.sp,
              bottom: 8.sp,
              child: Column(
                // mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    text,
                    style: const TextStyle(color: Colors.white),
                  ),
                  Row(children: [
                    Icon(
                      Icons.remove_red_eye_outlined,
                      size: 8.sp,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0,right: 10.0),
                      child: Text(view,
                          style:
                              TextStyle(fontSize: 9.5.sp, color: Colors.white)),
                    ),
                    Icon(
                      Icons.thumb_up_off_alt_outlined,
                      size: 10.sp,
                      color: Colors.white,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 4.0,right: 10.0),
                      child: Text(view,
                          style:
                              TextStyle(fontSize: 10.5.sp, color: Colors.white)),
                    )
                  ])
                ],
              )),
        ],
      ),
    );
  }
}
