import 'dart:async';

import 'package:get/get.dart';

import '../../../networking/api_result.dart';
import '../../../networking/app_repo.dart';

class PaymentController extends GetxController {
  var activeCategory = 0.obs;

  var PaymentList = [
    {
      "text": "Debit /Credit Card",
      "inactive_icon": "assets/images/wallet.png",
      "active_icon": "assets/images/wallet.png"
    },
    {
      "text": "QR Code Payment",
      "inactive_icon": "assets/images/Qr.png",
      "active_icon": "assets/images/Qr.png"
    },
    {
      "text": "Netbanking",
      "inactive_icon": "assets/images/netbanking.png",
      "active_icon": "assets/images/netbanking.png"
    }
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
