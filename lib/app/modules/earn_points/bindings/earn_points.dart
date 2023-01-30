import 'package:get/get.dart';

import '../controllers/earn_points_controller.dart';

class EarnPointsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EarnPointsController>(
      () => EarnPointsController(),
    );
  }
}
