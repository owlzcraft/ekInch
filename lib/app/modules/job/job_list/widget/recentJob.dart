import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:flutter_svg/flutter_svg.dart';

class RecentJob extends StatefulWidget {
  const RecentJob({Key? key}) : super(key: key);

  @override
  RecentJobState createState() => RecentJobState();
}

class RecentJobState extends State<RecentJob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
                children: [
      
                 Center(child: Text("RECENT JOBS"))  
                ],),
      )


    );
  }
}
