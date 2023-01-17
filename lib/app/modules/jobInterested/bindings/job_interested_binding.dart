import 'package:get/get.dart';

import '../controllers/job_interested_controller.dart';

class JobInterestedBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<JobInterestedController>(
      () => JobInterestedController(),
    );
  }
}
