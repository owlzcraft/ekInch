import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/views/CompanyDetails.dart';
import 'package:ekinch/app/modules/postjob/views/JobDescriptions.dart';
import 'package:ekinch/app/modules/postjob/views/PostDetails.dart';
import 'package:ekinch/app/modules/postjob/views/stepProgressView.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../../../generated/assets.dart';
import '../../settings/views/settings_view.dart';
import '../controllers/postjob_controller.dart';
import 'PostJobProfile.dart';

class PostjobView extends StatefulWidget {
  const PostjobView({super.key});

  @override
  State<PostjobView> createState() => _PostjobViewState();
}

class _PostjobViewState extends State<PostjobView> {
  GlobalKey<ScaffoldState> scaffoldKey = new GlobalKey<ScaffoldState>();
  PageController controller = PageController(initialPage: 0);
  final _stepsText = ["Job Details", "Job Descriptions", "Company Details"];

  final _stepCircleRadius = 8.0;

  final _stepProgressViewHeight = 110.0;

  Color _activeColor = yellow;

  Color _inactiveColor = whitedark;

  TextStyle _headerStyle =
      TextStyle(fontSize: 10.0, fontWeight: FontWeight.bold, color: whitedark);

  TextStyle _stepStyle = TextStyle(
      fontSize: 12.0,
      fontWeight: FontWeight.w500,
      color: Colors.white,
      fontFamily: 'Kadwa');

  late Size _safeAreaSize;

  int _curPage = 1;
  StepProgressView _getStepProgress() {
    return StepProgressView(
      _stepsText,
      _curPage,
      _stepProgressViewHeight,
      _safeAreaSize.width,
      _stepCircleRadius,
      _activeColor,
      _inactiveColor,
      _headerStyle,
      _stepStyle,
      decoration: BoxDecoration(color: Colors.black),
      padding: EdgeInsets.only(
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
          //  Image.asset(
          //   'assets/images/menu.png',
          //   cacheHeight: 18,
          // ),
          //Icon(Icons.menu),
          title: Text(
            'Post Job',
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 100.0, child: _getStepProgress()),
            Expanded(
              child: PageView(
                controller: controller,

                 
                onPageChanged: (i) {


                  setState(() {
                    _curPage = i + 1;
                  });
                },
                children: <Widget>[
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Company Only',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kadwa'),
                          ),
                        ),
                        Expanded(child: PostDetails(

                        )),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Company Only',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kadwa'),
                          ),
                        ),
                        // Container(
                        //     // height: MediaQuery.of(context).size.height*0.6,
                        //     child:
                        Expanded(child: JobDescriptions())
                        // ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(15.0),
                          child: Text(
                            'Company Only',
                            style: TextStyle(
                                fontSize: 16,
                                color: Colors.black,
                                fontWeight: FontWeight.bold,
                                fontFamily: 'Kadwa'),
                          ),
                        ),
                        Expanded(child: CompanyDetails()),
                      ],
                    ),
                  ),
                
                 
                ],
              ),
            ),


             Padding(
               padding: const EdgeInsets.all(15.0),
               child: Stack(
                      children:[ Material(
                                    borderRadius: BorderRadius.circular(10.0),
                                    color: yellow,
                                    child: MaterialButton(
                        minWidth: MediaQuery.of(context).size.width,
                        onPressed: () {
                          if (_curPage == 3){
Get.to(PostJobProfile());
                          }
                          else{
                             print(_curPage);
                          controller.animateToPage(_curPage, curve:Curves.easeInOut, duration: Duration(milliseconds: 500),);
                          setState(() {
                            
                          });
                          }
                         
                        },
                        
                        child: Center(
                          child:
                          
                           Text(
                            _curPage == 3 ?  'Done' :
                            'Next',
                            style: TextStyle(
                                color: black,
                                fontSize: 18,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w700),
                          ),
                          
                        ))),
                  ]),
             ),
          ],
        ));
  }
}
