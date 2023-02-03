import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/job/form/views/widgets/skills_options.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:getwidget/components/button/gf_button.dart';

import '../../../../../custom_widget/color.dart';
import '../../../../../generated/assets.dart';
import '../../../../../utils/math_utils.dart';
import '../../../../notication/view/notification_view.dart';
import '../../../../settings/views/settings_view.dart';

class AddSkillView extends StatelessWidget {
  AddSkillView({super.key});
  GlobalKey<ScaffoldState> notDrawerKey = new GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: notDrawerKey,
      drawer: const SettingsView(),
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        actions: [
          IconButton(
            padding: const EdgeInsetsDirectional.only(end: 9.11),
            onPressed: (() => {Get.to(() => NotificationView())}),
            icon: SvgPicture.asset(Assets.notification),
          ),
        ],
        title: const Text(
          "Add Your Skills",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
        elevation: 0.0,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.drawerIcon_white),
          onPressed: () {
            if (!notDrawerKey.currentState!.isDrawerOpen) {
              //check if drawer is closed
              notDrawerKey.currentState!.openDrawer(); //open drawer
            }
          },
        ),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 30,
            decoration: BoxDecoration(
              color: Colors.black,
              border: Border.all(color: Colors.black),
            ),
          ),
          Stack(
            children: [
              Container(
                height: 30,
                decoration: BoxDecoration(
                  color: Colors.black,
                  border: Border.all(color: Colors.black),
                ),
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 16.0, right: 16.0, bottom: 0.0),
                child: Container(
                  width: getHorizontalSize(460),
                  height: getVerticalSize(95),
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(6)),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      TextFormField(
                        onTap: () {
                          // setState(() {
                          //   drop = false;
                          // });
                        },
                        // controller: nameController,
                        validator: ((value) {
                          // print(value);
                          if (value!.isEmpty) {
                            return "This Field Can't be Empty.";
                          }
                          return null;
                        }),
                        // cursorColor: const Color(0xFFFEBA0F),
                        style: const TextStyle(fontSize: 18),
                        decoration: const InputDecoration(
                            prefixIcon:
                                Icon(Icons.search, color: KColors.borderGrey),
                            hintStyle: TextStyle(
                                fontSize: 18, color: Color(0xFF999898)),
                            hintText: "Start type your skills",
                            focusedBorder: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(color: KColors.greyLine)),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(4)),
                                borderSide:
                                    BorderSide(color: KColors.greyLine))),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                SkillOptions.textField("  Light Fitting"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                  child: SkillOptions.textField("  Light Fitting"),
                ),
                SkillOptions.textField("  Light Fitting"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                  child: SkillOptions.textField("  Light Fitting"),
                ),
                SkillOptions.textField("  Light Fitting"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                  child: SkillOptions.textField("  Light Fitting"),
                ),
                SkillOptions.textField("  Light Fitting"),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 11.0),
                  child: SkillOptions.textField("  Light Fitting"),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10),
                  child: GFButton(
                    onPressed: () {
                      Get.back();
                    },
                    color: KColors.orange,
                    fullWidthButton: true,
                    size: 50.2,
                    text: "Save & Next",
                    textStyle: const TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.w900,
                        fontSize: 24.0,
                        fontFamily: 'Kadwa'),
                  ),
                ),
              ],
            ),
          ),
        ],
      )),
      bottomNavigationBar: MyNavigator(),
    );
  }
}
