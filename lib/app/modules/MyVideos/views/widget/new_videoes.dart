import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../dashboard/widgets/work.widget.dart';

class NewVideo extends StatelessWidget {
  String videoU;
  String videoV;

  NewVideo({super.key, required this.videoU, required this.videoV});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18.sp),
                child: Text(
                  "Verified Videos",
                  style: GoogleFonts.kadwa(
                      fontSize: F20(), fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.sp),
                child: Text(
                  "${videoV} videos",
                  style: GoogleFonts.kadwa(
                      fontSize: F16(),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              )
            ],
          ),
          // Wrap(
          //   verticalDirection: VerticalDirection.down,
          //   crossAxisAlignment: WrapCrossAlignment.start,
          //   direction: Axis.horizontal,
          //   children: [
          //     work(
          //       image: 'assets/images/sample_thumb.jpg',
          //       text: 'Hello',
          //       view: '256',
          //     ), work(
          //       image: 'assets/images/sample_thumb.jpg',
          //       text: 'Hello',
          //       view: '256',
          //     ), work(
          //       image: 'assets/images/sample_thumb.jpg',
          //       text: 'Hello',
          //       view: '256',
          //     ), work(
          //       image: 'assets/images/sample_thumb.jpg',
          //       text: 'Hello',
          //       view: '256',
          //     ), work(
          //       image: 'assets/images/sample_thumb.jpg',
          //       text: 'Hello',
          //       view: '256',
          //     ), work(
          //       image: 'assets/images/sample_thumb.jpg',
          //       text: 'Hello',
          //       view: '256',
          //     ),
          //   ],
          //   // children: (verifiedList),
          // ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            // width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height / 2,
            // color: Color.fromARGB(255, 14, 14, 14),
            child: GridView.count(
              crossAxisCount: 2,
              children: [ work(
                image: 'assets/images/sample_thumb.jpg',
                text: 'Hello',
                view: '256',
              ),work(
                image: 'assets/images/sample_thumb.jpg',
                text: 'Hello',
                view: '256',
              ),work(
                image: 'assets/images/sample_thumb.jpg',
                text: 'Hello',
                view: '256',
              ),work(
                image: 'assets/images/sample_thumb.jpg',
                text: 'Hello',
                view: '256',
              )
        ]),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 18),
                child: Text(
                  "Unverified Videos",
                  style: GoogleFonts.kadwa(
                      fontSize: F20(), fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12),
                child: Text(
                  "${videoU} videos",
                  style: GoogleFonts.kadwa(
                      fontSize: F16(),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              )
            ],
          ),

          // SizedBox(
          //   width: MediaQuery.of(context).size.width,
          //   // width: MediaQuery.of(context).size.width ,
          //   height: MediaQuery.of(context).size.height / 2.11842105263,
          //   // color: Color.fromARGB(255, 14, 14, 14),
          //   child: GridView.count(
          //     crossAxisCount: 2,
          //     children: List.generate(3, (index) {
          //       return Center(
          //         child: work(image: 'assets/images/sample_thumb.jpg'),
          //       );
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
