import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/postjob/Style.dart';
import 'package:flutter_application_00/app/modules/postjob/views/CompanyDetails.dart';
import 'package:flutter_application_00/app/modules/postjob/views/JobDescriptions.dart';
import 'package:flutter_application_00/app/modules/postjob/views/PostDetails.dart';
import 'package:flutter_application_00/app/modules/postjob/views/stepProgressView.dart';

import 'package:get/get.dart';

import '../controllers/postjob_controller.dart';

class PostjobView extends StatefulWidget {
  const PostjobView({super.key});

  @override
  State<PostjobView> createState() => _PostjobViewState();
}

class _PostjobViewState extends State<PostjobView> {
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
        appBar: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: Image.asset(
            'assets/images/menu.png',
            cacheHeight: 18,
          ),
          //Icon(Icons.menu),
          title: Text(
            'Post Job',
            style: TextStyle(
                fontSize: 18, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
          ),
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(height: 100.0, child: _getStepProgress()),
            Expanded(
              child: PageView(
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
                        Expanded(child: PostDetails()),
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
            )
          ],
        ));
  }
}
