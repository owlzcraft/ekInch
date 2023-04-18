
import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controller/payment_controller.dart';

class PaymentCard extends StatelessWidget {
  final Map<String, String> data;
  final bool active;
  // ignore: use_key_in_widget_constructors
  PaymentCard({required this.data, required this.active});
  PaymentController controller = Get.put(PaymentController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical:3.0),
      child: Card(
          elevation: 1,
          shadowColor: Colors.orange,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.transparent,
          child: Stack(
            children: [
              Container(
                  decoration: BoxDecoration(
                      border: Border.all(
                          color: (active) ? const Color(0xFFFF8A00) : const Color(0xFFDBDBDB),
                          width: 0.2),
                      borderRadius: BorderRadius.circular(10),
                      color: (active) ? Colors.orange : Colors.white),
                  child: (active)
                      ? Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                data['active_icon'].toString(),
                                color: Colors.white,
                                scale: 2.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  data['text'].toString(),
                                  style: GoogleFonts.kadwa(
                                      fontSize: F20(), color: Colors.white),
                                ),
                              ),
                             
                            ],
                          ),
                        )
                      : Padding(
                          padding: const EdgeInsets.symmetric(
                              vertical: 10.0, horizontal: 30.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Image.asset(
                                data['active_icon'].toString(),
                                color: KColors.textGrey,
                                scale: 2.0,
                              ),
                              Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10.0),
                                child: Text(
                                  data['text'].toString(),
                                  style: GoogleFonts.kadwa(
                                      fontSize: F20(), color: KColors.textGrey),
                                ),
                              ),
                            ],
                          ),
                        )),
              Positioned(
                right: 16.sp,
                top: 16.sp,
                bottom: 16.sp,
                  child:active? Icon(Icons.check_circle_outline_outlined,
                      size: 25.sp, color: Colors.white):const Text(""))
            ],
          )),
    );
  }
}
// onTap: () => Get.to(JobInterestedView()),