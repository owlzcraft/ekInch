import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_application_00/app/utils/localStorage.dart';
import 'package:flutter_application_00/app/utils/math_utils.dart';
import 'package:flutter_application_00/widgets/snack_bar.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../custom_widget/color.dart';
import '../../../generated/assets.dart';
import '../../mobile/widget/yellow_button.dart';
import '../controllers/register.controller.dart';

class RegisterView extends StatefulWidget {
  // const RegisterView({super.key});
  final String mobile_number;
  RegisterView({this.mobile_number = ""});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  TextEditingController nameController = TextEditingController();
  var drop = false;
  openCategories() {
    setState(() {
      drop = true;
    });
  }

  List<List<String>> cat_list = [
    ['Electrician', ' Home Mechanic'],
    [
      'Trowel Mechanic',
      ' Mechanic',
    ],
    [
      'Electrician2',
      'Home Mechanic2',
    ],
    [
      'Trowel Mechanic2',
      'Mechanic2',
    ],
    [
      'Electrician3',
      'Home Mechanic3',
    ],
    [
      'Trowel Mechanic3',
      'Mechanic3',
    ]
  ];
  List selected = [0, 0];
  var EnteredOTP = '';
  var dropdownValue = "";
  final _globalKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());

    // return Scaffold(
    //   appBar: AppBar(
    //       backgroundColor: Colors.white.withOpacity(0.0),
    //       elevation: 0.0,
    //       leading: InkWell(
    //         onTap: () {
    //           Get.back();
    //         },
    //         child: const Icon(
    //           Icons.arrow_back,
    //           color: Colors.black,
    //         ),
    //       )),
    //   body: SingleChildScrollView(
    //       child: Padding(
    //     padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 25),
    //     child: Column(
    //       mainAxisAlignment: MainAxisAlignment.start,
    //       crossAxisAlignment: CrossAxisAlignment.start,
    //       children: [
    //         Row(
    //           children: [
    //             Column(
    //               mainAxisAlignment: MainAxisAlignment.start,
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               // ignore: prefer_const_literals_to_create_immutables
    //               children: [
    //                 const Text("Registration",
    //                     style: TextStyle(
    //                         fontWeight: FontWeight.w700,
    //                         fontSize: 30,
    //                         color: Colors.black)),
    //                 const SizedBox(
    //                   height: 10,
    //                 ),
    //                 const Text(
    //                   "Select Your Job",
    //                   style: GoogleFonts.kadwa(
    //                     fontSize: 20,
    //                     color: Color(0xFF767676),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //             const SizedBox(width: 120),
    //             SvgPicture.asset(Assets.regis)
    //           ],
    //         ),
    //         const SizedBox(
    //           height: 25,
    //         ),
    //         Form(
    //           key: _globalKey,
    //           child: TextFormField(
    //               onTap: () {
    //                 setState(() {
    //                   drop = false;
    //                 });
    //               },
    //               controller: nameController,
    //               validator: ((value) {
    //                 // print(value);
    //                 if (value!.isEmpty) {
    //                   return "Please Enter Your Name";
    //                 }
    //                 return null;
    //               }),
    //               cursorColor: const Color(0xFFFEBA0F),
    //               style: const GoogleFonts.kadwa(fontSize: 20),
    //               decoration: const InputDecoration(
    //                   hintStyle:
    //                       GoogleFonts.kadwa(fontSize: 18, color: Color(0xFF999898)),
    //                   hintText: "Enter Full Name",
    //                   focusedBorder: OutlineInputBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(8)),
    //                       borderSide: BorderSide(color: Color(0xFFFEBA0F))),
    //                   border: OutlineInputBorder(
    //                       borderRadius: BorderRadius.all(Radius.circular(8)),
    //                       borderSide: BorderSide(color: Color(0xFFCDCDCD))))),
    //         ),
    //         SizedBox(
    //           height: getVerticalSize(25),
    //         ),
    //         (!drop)
    //             ? GestureDetector(
    //                 onTap: () {
    //                   FocusManager.instance.primaryFocus?.unfocus();
    //                   Timer(const Duration(milliseconds: 500), openCategories);
    //                 },
    //                 child: Container(
    //                   height: getVerticalSize(60),
    //                   width: Get.width,
    //                   decoration: BoxDecoration(
    //                       borderRadius: BorderRadius.circular(8),
    //                       border: Border.all(
    //                           width: 1, color: const Color(0xFFCDCDCD))),
    //                   child: Padding(
    //                     padding: const EdgeInsets.symmetric(horizontal: 10),
    //                     child: Row(
    //                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                       children: [
    //                         Text(
    //                           cat_list[selected[0]][selected[1]],
    //                           style: const GoogleFonts.kadwa(
    //                               color: Color(0xFF999898), fontSize: 20),
    //                         ),
    //                         const Icon(
    //                           Icons.keyboard_arrow_down,
    //                           color: Color(0xFF999999),
    //                           size: 30,
    //                         )
    //                       ],
    //                     ),
    //                   ),
    //                 ),
    //               )
    //             : Container(
    //                 child: Column(
    //                     children: cat_list.map((e) {
    //                   return Row(
    //                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
    //                     children: [
    //                       GestureDetector(
    //                         onTap: () {
    //                           setState(() {
    //                             FocusManager.instance.primaryFocus?.unfocus();
    //                             drop = false;
    //                             selected = [cat_list.indexOf(e), 0];
    //                           });
    //                         },
    //                         child: Container(
    //                           margin: const EdgeInsets.only(top: 10),
    //                           child: Text(
    //                             e[0],
    //                             style: GoogleFonts.kadwa(
    //                                 fontSize: 20,
    //                                 color: (cat_list[selected[0]]
    //                                             [selected[1]] ==
    //                                         e[0])
    //                                     ? Colors.white
    //                                     : Colors.black),
    //                           ),
    //                           padding: const EdgeInsets.all(13),
    //                           decoration: BoxDecoration(
    //                               color: (cat_list[selected[0]][selected[1]] ==
    //                                       e[0])
    //                                   ? Colors.black
    //                                   : const Color(0xFFF8F8F8),
    //                               border: Border.all(
    //                                   color: const Color(0xFFCDCDCD)),
    //                               borderRadius: BorderRadius.circular(6)),
    //                         ),
    //                       ),
    //                       GestureDetector(
    //                         onTap: () {
    //                           setState(() {
    //                             FocusManager.instance.primaryFocus?.unfocus();

    //                             drop = false;
    //                             selected = [cat_list.indexOf(e), 1];
    //                           });
    //                         },
    //                         child: Container(
    //                           margin: const EdgeInsets.only(top: 10),
    //                           // ignore: sort_child_properties_last
    //                           child: Text(
    //                             e[1],
    //                             style: GoogleFonts.kadwa(
    //                                 fontSize: 20,
    //                                 color: (cat_list[selected[0]]
    //                                             [selected[1]] ==
    //                                         e[1])
    //                                     ? Colors.white
    //                                     : Colors.black),
    //                           ),
    //                           padding: const EdgeInsets.symmetric(
    //                               vertical: 15, horizontal: 25),
    //                           decoration: BoxDecoration(
    //                               color: (cat_list[selected[0]][selected[1]] ==
    //                                       e[1])
    //                                   ? Colors.black
    //                                   : const Color(0xFFF8F8F8),
    //                               border: Border.all(
    //                                   color: const Color(0xFFCDCDCD)),
    //                               borderRadius: BorderRadius.circular(6)),
    //                         ),
    //                       ),
    //                     ],
    //                   );
    //                 }).toList()),
    //               ),
    //         SizedBox(
    //           height: getVerticalSize(30),
    //         ),
    //         GFButton(
    //           onPressed: () {
    //             check();
    //           },
    //           color: KColors.orange,
    //           fullWidthButton: true,
    //           size: 50.2,
    //           text: "Proceed",
    //           GoogleFonts.kadwa: const GoogleFonts.kadwa(
    //               color: Colors.black,
    //               fontWeight: FontWeight.bold,
    //               fontSize: 18.0,
    //               fontFamily: 'Kadwa'),
    //           // shape: GFButtonShape.standard,
    //         ),
    //       ],
    //     ),
    //   )),
    // );

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            Get.back();
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        elevation: 0,
      ),
      body: Container(
        width: Get.width,
        color: Colors.white,
        child: Column(children: [
          Container(
            margin: EdgeInsets.only(top: Get.height / 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                          padding: EdgeInsets.symmetric(vertical: 7),
                          child:  Text(
                            "Registration",
                            style: GoogleFonts.kadwa(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Color(0xFF525252)),
                          )),
                       Text(
                        "Select Your Job",
                        style: GoogleFonts.kadwa(
                            fontSize: 20,
                            color: Color(0xFF767676),
                            height: 1.4),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: SvgPicture.asset(Assets.regis),
                )
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: TextFormField(
                onTap: () {
                  setState(() {
                    drop = false;
                  });
                },
                controller: nameController,
                cursorColor: Color(0xFFFEBA0F),
                style: const TextStyle(fontSize: 20),
                decoration: const InputDecoration(
                    hintStyle:
                        TextStyle(fontSize: 18, color: Color(0xFF999898)),
                    hintText: "Enter Full Name",
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color(0xFFFEBA0F))),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                        borderSide: BorderSide(color: Color(0xFFCDCDCD))))),
          ),
          (!drop)
              ? GestureDetector(
                  onTap: () {
                    FocusManager.instance.primaryFocus?.unfocus();
                    Timer(Duration(milliseconds: 500), openCategories);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 10, vertical: 10),
                    height: 60,
                    width: Get.width,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                            width: 1, color: const Color(0xFFCDCDCD))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          cat_list[selected[0]][selected[1]],
                          style:
                              TextStyle(color: Color(0xFF999898), fontSize: 20),
                        ),
                        Icon(
                          Icons.keyboard_arrow_down,
                          color: Color(0xFF999999),
                          size: 30,
                        )
                      ],
                    ),
                  ),
                )
              : Container(
                  padding: EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                      children: cat_list.map((e) {
                    return Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              FocusManager.instance.primaryFocus?.unfocus();

                              drop = false;
                              selected = [cat_list.indexOf(e), 0];
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              e[0],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: (cat_list[selected[0]][selected[1]] ==
                                          e[0])
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            padding: EdgeInsets.all(15),
                            decoration: BoxDecoration(
                                color:
                                    (cat_list[selected[0]][selected[1]] == e[0])
                                        ? Colors.black
                                        : Color(0xFFF8F8F8),
                                border: Border.all(color: Color(0xFFCDCDCD)),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              FocusManager.instance.primaryFocus?.unfocus();

                              drop = false;
                              selected = [cat_list.indexOf(e), 1];
                            });
                          },
                          child: Container(
                            margin: EdgeInsets.only(top: 10),
                            child: Text(
                              e[1],
                              style: TextStyle(
                                  fontSize: 20,
                                  color: (cat_list[selected[0]][selected[1]] ==
                                          e[1])
                                      ? Colors.white
                                      : Colors.black),
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 15, horizontal: 25),
                            decoration: BoxDecoration(
                                color:
                                    (cat_list[selected[0]][selected[1]] == e[1])
                                        ? Colors.black
                                        : Color(0xFFF8F8F8),
                                border: Border.all(color: Color(0xFFCDCDCD)),
                                borderRadius: BorderRadius.circular(6)),
                          ),
                        ),
                      ],
                    );
                  }).toList()),
                ),
          Container(
            margin: EdgeInsets.only(top: 35),
            child: DynamicButton("Proceed", true, () {
              Get.to(DashboardView(
              ));
              print('checked' + EnteredOTP);
            }),
          )
        ]),
      ),
    );
  }

  void check() {
    final _isValid = _globalKey.currentState!.validate();
    print(_isValid);
    if (_isValid) {
      LocalStorage.shared.saveLoggedIn();
      Get.to(DashboardView());
    } else {
      createSnackBar("Please enter your Name", context);
    }
  }
}
