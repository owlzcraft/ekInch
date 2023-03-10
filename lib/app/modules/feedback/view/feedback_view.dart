import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';

import '../../../../widgets/math_utils.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../notication/view/notification_view.dart';
import '../../postjob/widgets/shortDropDown.dart';
import '../../settings/views/settings_view.dart';

class FeedbackView extends StatefulWidget {
  const FeedbackView({super.key});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(90),
        child: AppBar(
          title: Text(
            "Feedback",
            style: GoogleFonts.kadwa(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                notDrawerKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            )
          ],
          backgroundColor:
              // Colors.white.withOpacity(0.3),
              Colors.black, //You can make this transparent
          elevation: 0.0, //No shadow
        ),
      ),
      body: SingleChildScrollView(
          child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Stack(
              alignment: AlignmentDirectional.center,
              children: [
                Image.asset(
                  "assets/images/circlef.png",
                  scale: 1.5,
                ),
                SizedBox(
                  height: getVerticalSize(30),
                ),
                Image.asset(
                  "assets/images/imagef.png",
                  scale: 2.0,
                ),
              ],
            ),
            Text(
              "Rate Your Experience",
              style:
                  GoogleFonts.kadwa(fontSize: 24, fontWeight: FontWeight.w700),
            ),
            RatingBar(
              initialRating: 3,
              direction: Axis.horizontal,
              allowHalfRating: false,
              itemCount: 5,
              ratingWidget: RatingWidget(
                full: SvgPicture.asset(
                  Assets.star,
                  color: KColors.orange,
                ),
                half: SvgPicture.asset(Assets.star),
                empty: SvgPicture.asset(Assets.star),
              ),
              itemPadding: EdgeInsets.symmetric(horizontal: 4.0),
              onRatingUpdate: (rating) {
                print(rating);
              },
            ),
            SizedBox(height: getVerticalSize(20),),
            SizedBox(
              height: getVerticalSize(150),
              child: Description(
                // controller: _descriptioncontroller,
                hintText: 'Comment',
              ),
            ),
            SizedBox(height: getVerticalSize(40),),
            GFButton(
              onPressed: () {},
              color: KColors.orange,
              fullWidthButton: true,
              size: 50.2,
              text: "Submit",
              textStyle: GoogleFonts.kadwa(
                  color: Colors.black,
                  fontWeight: FontWeight.bold,
                  fontSize: 18.0),
              // shape: GFButtonShape.standard,
            ),
          ],
        ),
      )),
    );
  }
}
