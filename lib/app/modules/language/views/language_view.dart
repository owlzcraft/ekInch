// ignore_for_file: non_constant_identifier_names

import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/main.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../widgets/math_utils.dart';
import '../../../../widgets/shape.dart';
import '../../../custom_widget/font_size.dart';
import '../../../utils/localStorage.dart';
import '../controllers/language_controller.dart';
import '../widgets/language.dart';

class LanguageView extends StatefulWidget {
  const LanguageView({super.key});

  @override
  State<LanguageView> createState() => _LanguageViewState();
}

class _LanguageViewState extends State<LanguageView> {
  var device_height = 802.9090909090909;
  var device_width = 392.72727272727275;
  final box = GetStorage();
  LanguageController controller = Get.put(LanguageController());
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
                      // changeLanguage('en');
                      if (LocalStorage.shared.isLoggedIn()) {
                        var lang = controller.lang_data
                            .firstWhere((element) => element['isActive'] == 1);
                        box.write("lang", lang['textT']);
                        // dashboardController.GetDashboard();
                        // Get.to(DashboardView(ReelsList: [], RecentlyAddedList: [],));
                      } else {
                        var lang = controller.lang_data
                            .firstWhere((element) => element['isActive'] == 1);
                        box.write("lang", lang['textT']);
                        // Locale currentLocale = const Locale('en');

                        // void _changeLanguage(value) {
                        //   print('done');
                        //   setState(() {
                        //     if (value == 'hi_IN') {
                        //       currentLocale = const Locale('hi');
                        //     } else {
                        //       currentLocale = const Locale('en');
                        //     }
                        //   });
                        // }
                        // Get.to(OnboardingView());
                      }
                    },
                    child: const Icon(
                      Icons.arrow_forward,
                      color: Colors.black,
                      size: 30,
                    )),
              ],
            ),
            SizedBox(
              height: getVerticalSize(15),
            ),
            Text(
              'भाषा चुने / Select Language ',
              textAlign: TextAlign.start,
              style: GoogleFonts.kadwa(
                  color: const Color.fromRGBO(0, 0, 0, 1),
                  fontSize: F30(),
                  fontWeight: FontWeight.w800),
            ),
            SizedBox(
              height: getVerticalSize(150),
            )
          ],
        ),
        toolbarHeight: 250,
        backgroundColor: Colors.white.withOpacity(0.0),
        elevation: 0.0,
        flexibleSpace: ClipPath(
          clipper: Customshape(),
          child: Container(
              height: getVerticalSize(260),
              width: MediaQuery.of(context).size.width,
              color: Colors.white),
        ),
      ),
      backgroundColor: Colors.black,
      body: Column(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
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
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 20.0, vertical: 8.0),
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
                ),
              );
            }).toList(),
          ),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 12.0, horizontal: 16.0),
            child: DynamicButton("Continue", true, () async {
              var lang = controller.lang_data
                  .firstWhere((element) => element['isActive'] == 1);
              box.write("lang", lang['textT']);
              var locale = const Locale('en');
              if (lang['index'] == 0) {
                setState(() {
                  locale = const Locale('hi');
                });
              }
              changeAppLanguage(locale);
              controller.changeLanguage(context, locale);
            }),
          ),
        ],
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
