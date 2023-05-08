import 'package:ekinch/app/models/language_model.dart';
import 'package:ekinch/app/modules/Onboarding/views/onboarding_view.dart';
import 'package:ekinch/app/modules/dashboard/controllers/dashboard_controller.dart';
import 'package:ekinch/app/networking/app_repo.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../widgets/loader.dart';
import '../../../networking/api_result.dart';

class LanguageController extends GetxController {
  //TODO: Implement LanguageController
  var activatedComp = 0;
  DashboardController dashboardController = Get.put(DashboardController());

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
  final APIRepository apiRepository = APIRepository(isTokenRequired: false);

  //language selection

  void changeLanguage(BuildContext context, Locale locale) {
    final newLocale = Locale(locale.languageCode, locale.countryCode);
    print("111111111111111");
    print(newLocale);
    AppLocalizations.delegate.load(newLocale);
    if (LocalStorage.shared.isLoggedIn()) {
      dashboardController.GetDashboard();
    } else {
      Get.to(OnboardingView());
    }
    // You can save the selected locale to persistent storage here
    // and use it to initialize the locale in future app launches.
  }

  Future<void> languageSelection() async {
    Get.showOverlay(
        asyncFunction: () async {
          final Map<String, dynamic> data = <String, dynamic>{};
          data["LANG"] = 2;

          await apiRepository
              .selectLanguage(data)
              .then((ApiResult<LocalizationModel> value) {
            value.when(
                success: (value) {
                  // if (value!.status == 200) {
                  //   LocalStorage.shared.saveUserData(value);
                  //   LocalStorage.shared
                  //       .savephoto(value.userData!.photo as String);
                  //   dashboardController.GetDashboard();
                  //   // Get.to(DashboardView(ReelsList: [], RecentlyAddedList: [],));
                  // } else if (value.status == 400) {
                  //   errorSnackbar("Something Went Wrong");
                  // } else {
                  //   errorSnackbar("Please Try After Sometime");
                  // }
                },
                failure: (networkExceptions) {});
          });
        },
        loadingWidget: const LoadingIndicator());
  }

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
