import 'package:get/get.dart';

import '../controller/notication_controller.dart';

class RecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<NotificationController>(
      () => NotificationController(),
    );
  }
}
