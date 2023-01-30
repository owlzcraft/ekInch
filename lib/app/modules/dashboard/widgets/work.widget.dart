import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class work extends StatelessWidget {
  final String image;
  final String view;
  final String text;
  work(
      {this.image = "assets/image/work.png",
      this.view = "33",
      this.text = "Building work"});

  @override
  Widget build(BuildContext context) {
    print(MediaQuery.of(context).size.height);
    return Container(
      width: (MediaQuery.of(context).size.width / 3.1).sp,
      height: (MediaQuery.of(context).size.height / 4.04809009283).sp,
      margin: EdgeInsets.symmetric(horizontal: 10.sp, vertical: 5.sp),
      decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(image),
            fit: BoxFit.cover,
          ),
          borderRadius: BorderRadius.circular(20.sp)),
      child: Stack(children: [
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
        Center(
            child: Icon(
          Icons.play_circle_outline,
          size: 30.sp,
          color: Colors.white,
        )),
        Positioned(
            top: 5.sp,
            left: 108.sp,
            child: Container(
                width: 13.5.sp,
                height: 13.5.sp,
                decoration: BoxDecoration(
                  color: const Color(0xffFEBA0F),
                  borderRadius: BorderRadius.circular(25.sp),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Icon(Icons.share, size: 7.sp),
                  ],
                ))),
        Positioned(
            left: 15.sp,
            bottom: 20.sp,
            child: Center(
                child: Text(
              text,
              style: const TextStyle(color: Colors.white),
            ))),
        Positioned(
            left: 5.sp,
            bottom: 09.sp,
            child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                      margin: const EdgeInsets.symmetric(horizontal: 10),
                      width: 30.sp,
                      height: 10.sp,
                      decoration: const BoxDecoration(
                        color: Colors.transparent,
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.remove_red_eye_outlined,
                            size: 8.sp,
                            color: Colors.white,
                          ),
                          Text(view,
                              style: TextStyle(
                                  fontSize: 9.5.sp, color: Colors.white))
                        ],
                      )),
                  Container(
                      width: 30.sp,
                      height: 10.sp,
                      decoration: BoxDecoration(
                        color: Colors.transparent,
                        borderRadius: BorderRadius.circular(25.sp),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Icon(
                            Icons.thumb_up_off_alt_outlined,
                            size: 10.sp,
                            color: Colors.white,
                          ),
                          Text(view,
                              style: TextStyle(
                                  fontSize: 10.5.sp, color: Colors.white))
                        ],
                      ))
                ]))
      ]),
    );
  }
}
