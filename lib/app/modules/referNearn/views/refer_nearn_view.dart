import 'package:flutter/material.dart';
import 'package:flutter_application_00/widgets/Upperbar.dart';

import 'package:get/get.dart';

import '../controllers/refer_nearn_controller.dart';

class ReferNearnView extends GetView<ReferNearnController> {
  const ReferNearnView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: UpperBar("Refer and Earn", "ReferNearn", false, false),
      body: Center(
        child: Text(
          'ReferNearnView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
