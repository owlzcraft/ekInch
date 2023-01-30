import 'package:get/get.dart';

import '../controllers/postjob_controller.dart';

class PostjobBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PostjobController>(
      () => PostjobController(),
    );
  }
}
