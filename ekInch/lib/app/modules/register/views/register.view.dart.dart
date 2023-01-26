import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/views/dashboard_view.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
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
    ['Electrician', 'Home Mechanic'],
    [
      'Trowel Mechanic',
      'Mechanic',
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
  @override
  Widget build(BuildContext context) {
    Get.put(RegisterController());

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: const Icon(
          Icons.arrow_back,
          color: Colors.black,
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
                          child: const Text(
                            "Registration",
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 30,
                                color: Color(0xFF525252)),
                          )),
                      const Text(
                        "Select Your Job",
                        style: TextStyle(
                            fontSize: 20,
                            color: Color(0xFF767676),
                            height: 1.4),
                      ),
                    ],
                  ),
                ),
                Image.asset("assets/images/register_img.png")
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
              Get.to(DashboardView(name: nameController.text,));
              print('checked' + EnteredOTP);
            }),
          )
        ]),
      ),
    );
  }
}
