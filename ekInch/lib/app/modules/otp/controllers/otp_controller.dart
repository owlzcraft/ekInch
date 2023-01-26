import 'dart:async';

import 'package:get/get.dart';

class OtpController extends GetxController {
  //TODO: Implement OtpController
    Timer? _timer;
  int remainingSeconds = 1;
  final time = '00.00'.obs;
  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    
    _startTimer(60);
    super.onReady();
  }

  @override
  void onClose() {
    if(_timer!=null){
      _timer!.cancel();
    }
    super.onClose();
  }
   _startTimer(int seconds){
    const duration = Duration(seconds: 1);
    remainingSeconds = seconds;
    _timer = Timer.periodic(duration, (Timer timer) {
      if(remainingSeconds==0){
        timer.cancel();
      }else{
        int minutes = remainingSeconds~/60;
        int seconds = (remainingSeconds%60);
        time.value = minutes.toString().padLeft(2, "0")+
        ":"+seconds.toString().padLeft(2, "0");
        remainingSeconds--;
      }
    });
  }
  void increment() => count.value++;
}
