import 'package:get/get.dart';

class JobInterestedController extends GetxController {
  //TODO: Implement JobInterestedController
  var activeCategory = 0.obs;
  var jobCategory = [
    {
      "inactive_icon": "assets/icons/labour_inactive.svg",
      "active_icon": "assets/icons/labour_active.svg",
      "title": "Labour",
    },
    {
      "inactive_icon": "assets/icons/plasterMistri_inactive.svg",
      "active_icon": "assets/icons/plasterMistri_active.svg",
      "title": "Plaster Mistri",
    },
    {
      "inactive_icon": "assets/icons/welding_inactive.svg",
      "active_icon": "assets/icons/welding_active.svg",
      "title": "Welding",
    },
    {
      "inactive_icon": "assets/icons/plumber_inactive.svg",
      "active_icon": "assets/icons/plumber_active.svg",
      "title": "Plumber",
    },
    {
      "inactive_icon": "assets/icons/electrician_inactive.svg",
      "active_icon": "assets/icons/electrician_active.svg",
      "title": "Electrician",
    },
    {
      "inactive_icon": "assets/icons/painter_inactive.svg",
      "active_icon": "assets/icons/painter_active.svg",
      "title": "Painter",
    },
    {
      "inactive_icon": "assets/icons/carpenter_inactive.svg",
      "active_icon": "assets/icons/carpenter_active.svg",
      "title": "Carpenter",
    },
    {
      "inactive_icon": "assets/icons/tilesMistri_inactive.svg",
      "active_icon": "assets/icons/tilesMistri_active.svg",
      "title": "TilesMistri",
    },
    {
      "inactive_icon": "assets/icons/welding_inactive.svg",
      "active_icon": "assets/icons/welding_active.svg",
      "title": "Welding",
    },
    {
      "inactive_icon": "assets/icons/plumber_inactive.svg",
      "active_icon": "assets/icons/plumber_active.svg",
      "title": "Plumber",
    },
   {
      "inactive_icon": "assets/icons/electrician_inactive.svg",
      "active_icon": "assets/icons/electrician_active.svg",
      "title": "Electrician",
    },
    {
      "inactive_icon": "assets/icons/welding_inactive.svg",
      "active_icon": "assets/icons/welding_active.svg",
      "title": "Welding",
    },
    {
      "inactive_icon": "assets/icons/plumber_inactive.svg",
      "active_icon": "assets/icons/plumber_active.svg",
      "title": "Plumber",
    },
    {
      "inactive_icon": "assets/icons/labour_inactive.svg",
      "active_icon": "assets/icons/labour_active.svg",
      "title": "Labour",
    }
  ].obs;

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;
}
