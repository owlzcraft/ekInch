import 'package:get/get.dart';

import '../controllers/mobile_controller.dart';

class MobileBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MobileController>(
      () => MobileController(),
    );
  }
}
