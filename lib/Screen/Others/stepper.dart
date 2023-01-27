import 'package:flutter/material.dart';




class MyHomePage extends StatefulWidget {
  MyHomePage({ Key? key, this.title}) : super(key: key);

   String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _stepsText = ["Job Details", "Job Discription", "Your credit card details"];

  final _stepCircleRadius = 10.0;

  final _stepProgressViewHeight = 150.0;

  Color _activeColor = Colors.yellow;

  Color _inactiveColor = Colors.grey;

  TextStyle _headerStyle =
  TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold);

  TextStyle _stepStyle = TextStyle(fontSize: 12.0, fontWeight: FontWeight.bold);

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
        top: 48.0,
        left: 24.0,
        right: 24.0,
      ),
    );
  }

//Build method of Main Page
  Widget build(BuildContext context) {
    var mediaQD = MediaQuery.of(context);
    _safeAreaSize = mediaQD.size;
    return Scaffold(
        body: Column(
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
                    color: Colors.blue,
                  ),
                  Container(
                    color: Colors.amber,
                  ),
                  Container(
                    color: Colors.cyan,
                  ),
                ],
              ),
            )
          ],
        ));
  }
}

class StepProgressView extends StatelessWidget {
   StepProgressView(
      List<String> stepsText,
      int curStep,
      double height,
      double width,
      double dotRadius,
      Color activeColor,
      Color inactiveColor,
      TextStyle headerStyle,
      TextStyle stepsStyle, {
        Key? key,
        this.decoration,
        this.padding,
        this.lineHeight = 2.0,
      })  : _stepsText = stepsText,
        _curStep = curStep,
        _height = height,
        _width = width,
        _dotRadius = dotRadius,
        _activeColor = activeColor,
        _inactiveColor = inactiveColor,
        _headerStyle = headerStyle,
        _stepStyle = stepsStyle,
        assert(curStep > 0 == true && curStep <= stepsText.length),
        assert(width > 0),
        assert(height >= 2 * dotRadius),
        assert(width >= dotRadius * 2 * stepsText.length),
        super(key: key);

  //height of the container
   double? _height;
  //width of the container
   double? _width;
  //container decoration
   BoxDecoration? decoration;
  //list of texts to be shown for each step
   List<String>? _stepsText;
  //cur step identifier
   int ? _curStep;
  //active color
   Color? _activeColor;
  //in-active color
   Color? _inactiveColor;
  //dot radius
   double? _dotRadius;
  //container padding
   EdgeInsets? padding;
  //line height
   double? lineHeight;
  //header textstyle
   TextStyle? _headerStyle;
  //steps text
   TextStyle? _stepStyle;

  List<Widget> _buildDots() {
    var wids = <Widget>[];
    _stepsText!.asMap().forEach((i, text) {
      var circleColor =
      (i == 0 || _curStep! > i + 1) ? _activeColor : _inactiveColor;

      var lineColor = _curStep! > i + 1 ? _activeColor : _inactiveColor;

      wids.add(CircleAvatar(
        radius: _dotRadius,
        backgroundColor: circleColor,
      ));

      //add a line separator
      //0-------0--------0
      if (i != _stepsText!.length - 1) {
        wids.add(
          Expanded(
            child: Container(
              height: lineHeight,
              color: lineColor,
            ),
          ),
        );
      }
    });

    return wids;
  }

  List<Widget> _buildText() {
    var wids = <Widget>[];
    _stepsText!.asMap().forEach((i, text) {
      wids.add(Text(text, style: _stepStyle));
    });

    return wids;
  }

  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      height: this._height,
      width: this._width,
      decoration: this.decoration,
      child: Column(
        children: <Widget>[
          // Container(
          //   child: Center(
          //     child: RichText(
          //       text: TextSpan(
          //         children: [
          //           TextSpan(
          //             text: (_curStep).toString(),
          //             style: _headerStyle!.copyWith(
          //               color: _activeColor, //this is always going to be active
          //             ),
          //           ),
          //           TextSpan(
          //             text:  _stepsText!.length.toString(),
          //             style: _headerStyle!.copyWith(
          //               color: _curStep == _stepsText!.length
          //                   ? _activeColor
          //                   : _inactiveColor,
          //             ),
          //           ),
          //         ],
          //       ),
          //     ),
          //   ),
          // ),
          Row(
            children: _buildDots(),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: _buildText(),
          )
        ],
      ),
    );
  }
}