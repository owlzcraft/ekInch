import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/Onboarding/views/onboarding_view.dart';
import 'package:flutter_application_00/app/utils/localStorage.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_application_00/widgets/shape.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import '../../dashboard/views/dashboard_view.dart';
import '../controllers/language_controller.dart';
import '../widgets/language.dart';

class LanguageView extends StatefulWidget {
  LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  var device_height = 802.9090909090909;
  var device_width = 392.72727272727275;
  final box = GetStorage();
  var controller = Get.put(LanguageController());
  @override
  Widget build(BuildContext context) {
//Yamini
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: false,
        title: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                    onTap: () {
                      if (LocalStorage.shared.isLoggedIn()) {
                        print(LocalStorage.shared.isLoggedIn());

                        var lang = controller.lang_data
                            .firstWhere((element) => element['isActive'] == 1);
                        box.write("lang", lang['textT']);
                        Get.to(DashboardView());
                      } else {
                        var lang = controller.lang_data
                            .firstWhere((element) => element['isActive'] == 1);
                        box.write("lang", lang['textT']);
                        Get.to(OnboardingView());
                      }
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            ),
            SizedBox(
              height: getVerticalSize(40),
            ),
            Text(
              'भाषा चुने / Select Language ',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 28,
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: getVerticalSize(120),
            )
          ],
        ),
        toolbarHeight: 250,
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
              height: getVerticalSize(250),
              width: MediaQuery.of(context).size.width,
              color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Container(
        alignment: AlignmentDirectional.topCenter,
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: GridView.count(
          childAspectRatio: 1.5.sp,
          crossAxisSpacing: 0.sp,
          mainAxisSpacing: 20.sp,
          crossAxisCount: 2,
          children: controller.lang_data.map((l) {
            return GestureDetector(
              onTap: () {
                for (var i = 0; i < controller.lang_data.length; i++) {
                  if (controller.lang_data[i]['isActive'] == 0) {
                    setState(() {
                      controller.lang_data[i]['isActive'] = 1;
                    });
                  }
                  if (i != l['index']) {
                    setState(() {
                      controller.lang_data[i]['isActive'] = 0;
                    });
                  }
                }
              },
              child: Center(
                child: AnimatedContainer(
                  duration: const Duration(microseconds: 800),
                  curve: Curves.bounceIn,
                  child: LangCom(
                    textT: l['textT'].toString(),
                    active_img: l['active_image'].toString(),
                    inactive_img: l['inactive_image'].toString(),
                    textB: l['textB'].toString(),
                    active: int.parse(l['isActive'].toString()),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );

    //old one
    // return Scaffold(
    //         appBar: PreferredSize(
    //             preferredSize: Size.fromHeight((device_height / 9).sp),
    //             child:
    //              Container(
    //               color: Colors.white,
    //               padding: EdgeInsets.only(top: ((Get.height / 10) - 30).sp),
    //               child:
    //                Column(
    //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                 children: [
    //                   Container(
    //                     padding: EdgeInsets.symmetric(horizontal: 10.sp),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.end,
    //                       children: [
    //                         GestureDetector(
    //                           onTap: () {
    //                             var lang = controller.lang_data.firstWhere(
    //                                 (element) => element['isActive'] == 1);
    //                             box.write("lang", lang['textT']);
    //                             Get.to(OnboardingView());
    //                           },
    //                           child:const Icon(
    //                             Icons.arrow_forward,
    //                             color: Colors.black,
    //                           ),
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                   Center(
    //                       child: Text(
    //                     'भाषा चुने  / Select Language ',
    //                     style: TextStyle(
    //                         color: Colors.black,
    //                         fontSize: 28.sp,
    //                         fontWeight: FontWeight.w800),
    //                   )),
    //                 ],
    //               ),
    //             )),
    //         body: Container(
    //           decoration:const BoxDecoration(
    //             color: Colors.black,
    //           ),
    //           child: Stack(
    //             children: <Widget>[
    //               Expanded(
    //                 child: Container(
    //                   margin: EdgeInsets.only(top: (Get.height / 9).sp),
    //                   decoration:const BoxDecoration(
    //                     color: Color.fromARGB(255, 14, 14, 14),
    //                   ),
    //                   width: MediaQuery.of(context).size.width,
    //                   padding:
    //                       EdgeInsets.symmetric(horizontal: 15.sp, vertical: 20.sp),
    //                   child: GridView.count(
    //                     childAspectRatio: 1.45.sp,
    //                     crossAxisSpacing: 2.sp,
    //                     mainAxisSpacing: 20.sp,
    //                     crossAxisCount: 2,
    //                     children: controller.lang_data.map((l) {
    //                       return GestureDetector(
    //                         onTap: () {
    //                           for (var i = 0;
    //                               i < controller.lang_data.length;
    //                               i++) {
    //                             if (controller.lang_data[i]['isActive'] == 0) {
    //                               setState(() {
    //                                 controller.lang_data[i]['isActive'] = 1;
    //                               });
    //                             }
    //                             if (i != l['index']) {
    //                               setState(() {
    //                                 controller.lang_data[i]['isActive'] = 0;
    //                               });
    //                             }
    //                           }
    //                         },
    //                         child: Center(
    //                           child: AnimatedContainer(
    //                             duration:const Duration(microseconds: 800),
    //                             curve: Curves.bounceIn,
    //                             child: LangCom(
    //                               textT: l['textT'].toString(),
    //                               active_img: l['active_image'].toString(),
    //                               inactive_img: l['inactive_image'].toString(),
    //                               textB: l['textB'].toString(),
    //                               active: int.parse(l['isActive'].toString()),
    //                             ),
    //                           ),
    //                         ),
    //                       );
    //                     }).toList(),
    //                   ),
    //                 ),
    //               ),
    //               Positioned(
    //                   child: Image.asset(
    //                 'assets/images/Vector 1.png',
    //               )),
    //               Positioned(
    //                   child: Container(
    //                 height: (Get.height / 23).sp,
    //                 decoration:const BoxDecoration(color: Colors.white),
    //               ))
    //             ],
    //           ),
    //         ),
    //       );
  }
}
