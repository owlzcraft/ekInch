import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../../custom_widget/font_size.dart';
import '../../../generated/assets.dart';
import '../../settings/views/settings_view.dart';

class CertificateView extends StatelessWidget {
  CertificateView({super.key});
  GlobalKey<ScaffoldState> notDrawerKey =  GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: notDrawerKey,
        drawer: const SettingsView(),
        backgroundColor: Colors.white,
        appBar: AppBar(
          centerTitle: true,
          actions: [
            IconButton(
              padding: const EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {
                //empty
              }),
              icon: SvgPicture.asset(Assets.share_white),
            ),
          ],
          title: Text(
            "My Certificate",
            style: GoogleFonts.kadwa(
                color: Colors.white, fontSize: 24, fontWeight: FontWeight.w700),
          ),
          backgroundColor: Colors.black,
          elevation: 0.0,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                notDrawerKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
        ),
        bottomNavigationBar: BottomTabView(9),
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black),
                ),
              ),
              Stack(
                children: [
                  Container(
                    height: 30,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      border: Border.all(color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                        left: 16.0, right: 16.0, bottom: 0.0),
                    child: Container(
                        width: getHorizontalSize(460),
                        height: getVerticalSize(300),
                        decoration: BoxDecoration(
                            boxShadow: const <BoxShadow>[
                              BoxShadow(
                                  color: Colors.black54,
                                  blurRadius: 5.0,
                                  offset: Offset(0.0, 0.75))
                            ],
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(6)),
                        child: Image.asset(
                          "assets/images/certificate.png",
                          fit: BoxFit.fill,
                        )),
                  ),
                ],
              ),
              SizedBox(height:getVerticalSize(30) ,),
              Center(
                child: Text(
                  "Certificate Name",
                  style: GoogleFonts.poppins(
                      fontSize: F30(), fontWeight: FontWeight.w700),
                ),
              ),
              SizedBox(height:getVerticalSize(15) ),
              Center(
                child: Text(
                  "Lorem Ipsum is simply dummy text of the printing \nand type setting industry.",textAlign: TextAlign.center,
                  style: GoogleFonts.poppins(
                      fontSize: F14(), fontWeight: FontWeight.w400,color:KColors.textGrey),
                ),
              ),
              SizedBox(height:getVerticalSize(10) ),

               Padding(
                 padding: const EdgeInsets.all(16.0),
                 child: GFButton(
                  onPressed: () {
                   
                  },
                  color: KColors.orange,
                  fullWidthButton: true,
                  size: 50.2,
                  text: "Download",
                  textStyle: GoogleFonts.kadwa(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: F18()),
                  // shape: GFButtonShape.standard,
                             ),
               ),

               Container(
                padding: EdgeInsets.all(10.0.sp),
                margin: const EdgeInsets.only(top: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        padding: EdgeInsets.symmetric(horizontal: 10.sp),
                        child: Text(
                          'My Videoes',
                          style: TextStyle(
                              fontWeight: FontWeight.w700, fontSize: 18.sp),
                        )),
                     Text(
                      '12 videos',
                      style: TextStyle(
                          fontSize: F18(),
                          color: const Color(0xFF767676),
                          fontWeight: FontWeight.w400),
                    )
                  ],
                ),
              ),
              // SingleChildScrollView(
              //   scrollDirection: Axis.horizontal,
              //   padding: EdgeInsets.symmetric(horizontal: 10.sp),
              //   child: Row(
              //     children: [
              //       work(image: 'assets/images/sample_thumb.jpg'),
              //       work(image: 'assets/images/sample_thumb.jpg'),
              //       work(image: 'assets/images/sample_thumb.jpg'),
              //       work(image: 'assets/images/sample_thumb.jpg'),
              //       work(image: 'assets/images/sample_thumb.jpg'),
              //       work(image: 'assets/images/sample_thumb.jpg'),
              //       work(image: 'assets/images/sample_thumb.jpg')
              //     ],
              //   ),
              // ),

              SizedBox(height: getVerticalSize(30),)

            ])));
  }
}
