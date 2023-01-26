import 'package:get/get.dart';

import '../controllers/my_videos_controller.dart';

class MyVideosBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MyVideosController>(
      () => MyVideosController(),
    );
  }
}
