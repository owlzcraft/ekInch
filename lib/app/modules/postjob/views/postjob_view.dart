import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/dashboard/widgets/navigation.dart';
import 'package:ekinch/app/modules/postjob/views/post_job_view/PostDetails.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/views/post_job_view/JobDescriptions.dart';
import 'package:ekinch/app/modules/postjob/views/stepProgressView.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../generated/assets.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/postjob_controller.dart';
import 'PostJobProfile.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class PostjobView extends StatefulWidget {
  const PostjobView({super.key});

  @override
  State<PostjobView> createState() => _PostjobViewState();
}

class _PostjobViewState extends State<PostjobView> {
  GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
  PostjobController postJobController = Get.put(PostjobController());
  PageController controller = PageController(initialPage: 0);
  final _stepCircleRadius = 8.0;
  final _stepProgressViewHeight = 110.0;
  final Color _activeColor = yellow;
  final Color _inactiveColor = whitedark;
  final TextStyle _headerStyle = GoogleFonts.kadwa(
      fontSize: F12(), fontWeight: FontWeight.bold, color: whitedark);
  final TextStyle _stepStyle = GoogleFonts.kadwa(
    fontSize: F14(),
    fontWeight: FontWeight.w500,
    color: Colors.white,
  );

  late Size _safeAreaSize;

  int _curPage = 1;
  StepProgressView _getStepProgress() {
    final stepsText = [
      AppLocalizations.of(context)!.jobDetails,
      AppLocalizations.of(context)!.jobDescriptions
    ];

    return StepProgressView(
      stepsText,
      _curPage,
      _stepProgressViewHeight,
      _safeAreaSize.width,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _headerStyle,
      _stepStyle,
      decoration: const BoxDecoration(color: Colors.black),
      padding: const EdgeInsets.only(
        top: 20.0,
        left: 15.0,
        right: 15.0,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    return Scaffold(
        bottomNavigationBar: const BottomTabView(2),
        key: scaffoldKey,
        drawer: const SettingsView(),
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!scaffoldKey.currentState!.isDrawerOpen) {
                //check if drawer is closed
                scaffoldKey.currentState!.openDrawer(); //open drawer
              }
            },
          ),
          title: Text(
            AppLocalizations.of(context)!.postJob,
            style:
                GoogleFonts.kadwa(fontSize: F20(), fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 100.0, child: _getStepProgress()),
            Expanded(
              child: PageView(
                controller: controller,
                onPageChanged: (i) {
                  setState(() {
                    _curPage = i + 1;
                  });
                },
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 16.0, vertical: 8.0),
                          child: Text(
                            AppLocalizations.of(context)!.companyOnly,
                            style: GoogleFonts.kadwa(
                              fontSize: F24(),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(child: PostDetails()),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15.0),
                          child: Text(
                            AppLocalizations.of(context)!.companyOnly,
                            style: GoogleFonts.kadwa(
                              fontSize: F20(),
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        const Expanded(child: JobDescriptions())
                      ],
                    ),
                  ),
                  // Container(
                  //   height: MediaQuery.of(context).size.height,
                  //   child: Column(
                  //     crossAxisAlignment: CrossAxisAlignment.start,
                  //     mainAxisAlignment: MainAxisAlignment.start,
                  //     children: [
                  //       Padding(
                  //         padding: const EdgeInsets.all(15.0),
                  //         child: Text(
                  //           'Company Only',
                  //           style: GoogleFonts.kadwa(
                  //               fontSize: F20(),
                  //               color: Colors.black,
                  //               fontWeight: FontWeight.bold,
                  //              ),
                  //         ),
                  //       ),
                  //       const Expanded(child: CompanyDetails()),
                  //     ],
                  //   ),
                  // ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Stack(children: [
                Material(
                    borderRadius: BorderRadius.circular(10.0),
                    color: yellow,
                    child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (_curPage == 2) {
                            Get.to(PostJobProfile(
                              company: AppLocalizations.of(context)!.postJob,
                              jobTitle:
                                  "${postJobController.profession1.text.toString()} ${postJobController.profession2.text.toString()} ${postJobController.profession3.text.toString()}",
                              subtitle: " ",
                              location:
                                  postJobController.address.text.toString(),
                              salary:
                                  "${postJobController.salaryStr1.text}-${postJobController.salaryEnd1.text}",
                              qualification:
                                  postJobController.quali1.text.toString(),
                              language:
                                  postJobController.language1.text.toString(),
                              require:
                                  postJobController.selectedSKills.join(','),
                              jobInfo:
                                  postJobController.description.text.toString(),
                              experience:
                                  "${postJobController.exp1.text.toString()} ${AppLocalizations.of(context)!.yearsExperience}",
                              jobTime: postJobController.jobTmg.text.toString(),
                              // interviewTime: "",
                              // address: ""
                            ));
                          } else {
                            controller.animateToPage(
                              _curPage,
                              curve: Curves.easeInOut,
                              duration: const Duration(milliseconds: 500),
                            );
                            setState(() {});
                          }
                        },
                        child: Center(
                          child: Text(
                            _curPage == 2
                                ? AppLocalizations.of(context)!.done
                                : AppLocalizations.of(context)!.next,
                            style: GoogleFonts.kadwa(
                                color: black,
                                fontSize: F18(),
                                fontWeight: FontWeight.w700),
                          ),
                        ))),
              ]),
            ),
          ],
        ));
  }
}
