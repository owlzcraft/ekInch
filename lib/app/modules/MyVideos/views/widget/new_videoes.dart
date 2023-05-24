import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/MyVideos/views/widget/reelCard.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class NewVideo extends StatelessWidget {
  final String videoU;
  final String videoV;

  const NewVideo({super.key, required this.videoU, required this.videoV});

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
                padding:
                    EdgeInsets.symmetric(horizontal: 18.sp, vertical: 10.sp),
                child: Text(
                  AppLocalizations.of(context)!.verifiedVideos,
                  style: GoogleFonts.kadwa(
                      fontSize: F20(), fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 12.sp),
                child: Text(
                  "$videoV ${AppLocalizations.of(context)!.videos}",
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
            // height: MediaQuery.of(context).size.height / 2,
            // color: Color.fromARGB(255, 14, 14, 14),
            child: GridView.count(
                physics: const ScrollPhysics(),
                reverse: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: const [
                  reelCard(
                    image: 'assets/images/splash_screen.png',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
                    image: 'assets/images/splash_screen.png',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
                    image: 'assets/images/sample_thumb.jpg',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
                    image: 'assets/images/sample_thumb.jpg',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
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
                padding: EdgeInsets.symmetric(horizontal: 18, vertical: 10.sp),
                child: Text(
                  AppLocalizations.of(context)!.unVerifiedVideos,
                  style: GoogleFonts.kadwa(
                      fontSize: F20(), fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12),
                child: Text(
                  "$videoU ${AppLocalizations.of(context)!.videos}",
                  style: GoogleFonts.kadwa(
                      fontSize: F16(),
                      fontWeight: FontWeight.w400,
                      color: Colors.grey),
                ),
              )
            ],
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width,
            // width: MediaQuery.of(context).size.width ,
            height: MediaQuery.of(context).size.height / 2,
            // color: Color.fromARGB(255, 14, 14, 14),
            child: GridView.count(
                physics: const ScrollPhysics(),
                reverse: false,
                shrinkWrap: true,
                crossAxisCount: 2,
                children: const [
                  reelCard(
                    image: 'assets/images/splash_screen.png',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
                    image: 'assets/images/splash_screen.png',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
                    image: 'assets/images/sample_thumb.jpg',
                    text: 'Hello',
                    view: '256',
                  ),
                  reelCard(
                    image: 'assets/images/sample_thumb.jpg',
                    text: 'Hello',
                    view: '256',
                  )
                ]),
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
          //         child: reelCard(image: 'assets/images/sample_thumb.jpg'),
          //       );
          //     }),
          //   ),
          // ),
        ],
      ),
    );
  }
}
