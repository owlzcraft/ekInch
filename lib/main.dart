import 'package:flutter/material.dart';

import 'Screen/PostJob/PostDetails.dart';
import 'Screen/PostJob/TabPostJob.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: PostJobTabs(),
      debugShowCheckedModeBanner: false,
    );
  }
}
