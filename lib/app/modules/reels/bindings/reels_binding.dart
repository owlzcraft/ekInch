import 'package:get/get.dart';

import '../controllers/reels_controller.dart';

class ReelsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ReelsController>(
      () => ReelsController(),
    );
  }
}
