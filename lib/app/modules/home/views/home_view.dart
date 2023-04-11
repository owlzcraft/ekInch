import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  const Text('HomeView',),
        centerTitle: true,
      ),
      body: Center(
        child: Text(
          'HomeView is working',
          style: GoogleFonts.kadwa(fontSize: 20, ),
        ),
      ),
    );
  }
}
