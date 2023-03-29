import 'package:country_code_picker/country_code_picker.dart';
import 'package:get/get.dart';

class LanguageController extends GetxController {
  //TODO: Implement LanguageController
  var activatedComp = 0;
  
  var lang_data = [
    {
      "index": 0,
      "textT": "Hindi",
      "active_image": "assets/images/taj_active.png",
      "inactive_image": "assets/images/taj_inactive.png",
      "textB": "हिन्दी",
      "isActive": 0
    },
    {
      "index": 1,
      "textT": "English",
      "active_image": "assets/images/english_active.png",
      "inactive_image": "assets/images/english_inactive.png",
      "textB": "English",
      "isActive": 1
    },
    // {
    //   "index": 2,
    //   "textT": "Gujrati",
    //   "active_image": "assets/images/gujarat_active.png",
    //   "inactive_image": "assets/images/gujarat_inactive.png",
    //   "textB": "ગુજરાતી",
    //   "isActive": 0
    // },
    // {
    //   "index": 3,
    //   "textT": "Marathi",
    //   "active_image": "assets/images/marathi_active.png",
    //   "inactive_image": "assets/images/marathi_inactive.png",
    //   "textB": "मराठी",
    //   "isActive": 0
    // },
    // {
    //   "index": 4,
    //   "textT": "Punjabi",
    //   "active_image": "assets/images/punjabi_active.png",
    //   "inactive_image": "assets/images/punjabi_inactive.png",
    //   "textB": "Punjabi",
    //   "isActive": 0
    // },
    // {
    //   "index": 5,
    //   "textT": "Telugu",
    //   "active_image": "assets/images/telugu_active.png",
    //   "inactive_image": "assets/images/telugu_inactive.png",
    //   "textB": "తెలంగాణ",
    //   "isActive": 0
    // },
    // {
    //   "index": 6,
    //   "textT": "Maithili",
    //   "active_image": "assets/images/maithili_active.png",
    //   "inactive_image": "assets/images/maithili_inactive.png",
    //   "textB": "मैथिली",
    //   "isActive": 0
    // },
    // {
    //   "index": 7,
    //   "textT": "Bengali",
    //   "active_image": "assets/images/bengali_active.png",
    //   "inactive_image": "assets/images/bengali_inactive.png",
    //   "textB": "বাংলা",
    //   "isActive": 0
    // }
  ];
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
