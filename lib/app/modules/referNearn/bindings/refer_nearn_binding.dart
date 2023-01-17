import 'package:get/get.dart';

import '../controllers/refer_nearn_controller.dart';

class ReferNearnBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReferNearnController>(
      () => ReferNearnController(),
    );
  }
}
