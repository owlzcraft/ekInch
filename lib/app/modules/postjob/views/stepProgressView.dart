import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';

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
    this.lineHeight = 3.0,
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
  int? _curStep;
  //active color
  Color? _activeColor;
  //in-active color
  Color? _inactiveColor;
  //dot radius
  double? _dotRadius;
  //container padding
  EdgeInsets? padding;

  Icon? icon;
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
          (i == 0 || _curStep! >= i + 1) ? _activeColor : _inactiveColor;

      //  var icon =  (i == 0 || _curStep! >= i + 1) ? Icon(Icons.check_rounded,color:black,size: 13,) : '';

      var lineColor = _curStep! > i + 1 ? _activeColor : _inactiveColor;

      CircleAvatar b = (i == 0 || _curStep! >= i + 1)
          ? CircleAvatar(
              radius: _dotRadius,
              backgroundColor: circleColor,
              child: Icon(
                Icons.check_rounded,
                size: 13,
                color: Colors.black,
              ),
            )
          : CircleAvatar(
              radius: _dotRadius,
              backgroundColor: circleColor,
              //child: Icon(Icons.check_rounded,size: 15,color: Colors.black,),
            );

      //   var steptextcolor = (i == 0 || _curStep! > i + 1) ? _activeColor : _inactiveColor;

      wids.add(b
          // CircleAvatar(
          //   radius: _dotRadius,
          //   backgroundColor: circleColor,
          //   child: Icon(Icons.check_rounded,size: 13,color: Colors.black,),
          // )
          );
      //add a line separator
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
      Text a = (i == 0 || _curStep! >= i + 1)
          ? Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: yellow,
                  fontFamily: 'Kadwa'))
          : Text(text,
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontSize: 12.0,
                  fontWeight: FontWeight.w500,
                  color: whitedark,
                  fontFamily: 'Kadwa'));
      wids.add(a);
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
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 18.0, right: 18),
              child: Row(
                children: _buildDots(),
              ),
            ),
            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: _buildText(),
            )
          ]),
    );
  }
}
