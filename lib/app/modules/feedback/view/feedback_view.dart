import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/feedback/controller/feedback_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../widgets/math_utils.dart';
import '../../../../widgets/snack_bar.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../notication/view/notification_view.dart';
import '../../postjob/widgets/shortDropDown.dart';
import '../../settings/views/settings_view.dart';

class FeedbackView extends StatefulWidget {
  final String hint;
  final double initialStar;
  const FeedbackView(
      {super.key, required this.hint, required this.initialStar});

  @override
  State<FeedbackView> createState() => _FeedbackViewState();
}

class _FeedbackViewState extends State<FeedbackView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  FeedbackController controller = Get.put(FeedbackController());
  final _formKey = GlobalKey<FormState>();
  late String feedback;
  @override
  void initState() {
    super.initState();
    controller.GetFeedback();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            AppLocalizations.of(context)!.feedback,
            style: GoogleFonts.kadwa(
                fontSize: 24, color: Colors.white, fontWeight: FontWeight.w700),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                notDrawerKey.currentState!.openDrawer(); 
              }
            },
          ),
          actions: [
            IconButton(
              onPressed: (() => {Get.to(() => NotificationView())}),
              icon: SvgPicture.asset(Assets.notification),
            )
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      bottomNavigationBar: const BottomTabView(9),
      body: SafeArea(
        child: InkWell(
          onTap: () {
            FocusScope.of(context).requestFocus(FocusNode());
          },
          child: SingleChildScrollView(
              reverse: true,
              padding: EdgeInsets.only(
                  bottom: MediaQuery.of(context).viewInsets.bottom),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
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
                        AppLocalizations.of(context)!.rate5,
                        style: GoogleFonts.kadwa(
                            fontSize: 24, fontWeight: FontWeight.w700),
                      ),
                      RatingBar(
                        initialRating: widget.initialStar,
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
                        itemPadding:
                            const EdgeInsets.symmetric(horizontal: 4.0),
                        onRatingUpdate: (rating) {
                          controller.star = rating;
                        },
                      ),
                      SizedBox(
                        height: getVerticalSize(20),
                      ),
                      SizedBox(
                        height: getVerticalSize(150),
                        child: Description(
                          controller: controller.feedback,
                          hintText: widget.hint,
                          initialValue: widget.hint,
                        ),
                      ),
                      SizedBox(
                        height: getVerticalSize(40),
                      ),
                      GFButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            controller.PostFeedback();
                          } else {
                            errorSnackbar(AppLocalizations.of(context)!.pleaseAddComment);
                          }
                        },
                        color: KColors.orange,
                        fullWidthButton: true,
                        size: 50.2,
                        text: AppLocalizations.of(context)!.submit,
                        textStyle: GoogleFonts.kadwa(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0),
                        // shape: GFButtonShape.standard,
                      ),
                    ],
                  ),
                ),
              )),
        ),
      ),
    );
  }
}
