import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/skill_card.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/widget/notifcation_card.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:ekinch/app/utils/math_utils.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../custom_widget/color.dart';
import '../../../../dashboard/widgets/navigation.dart';
import '../../../../notication/view/notification_view.dart';
import '../../../../resume/controller/resume_controller.dart';
import '../../../../settings/views/settings_view.dart';

class AddSkillView extends StatefulWidget {
  List resultList;
  List addSkillList;
  AddSkillView(
      {super.key,
      required this.resultList,
      required this.addSkillList,
   });

  @override
  State<AddSkillView> createState() => _AddSkillViewState();
}

class ListItem<T> {
  bool isSelected = false; //Selection property to highlight or not
  T data; //Data of the user
  ListItem(this.data); //Constructor to assign the data
}

class _AddSkillViewState extends State<AddSkillView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  ResumeController resumeController=Get.put(ResumeController());
  List skillList = [
    "Light Fitting",
    "Wire Fitting",
    "Motor Repairing",
    "Generator Repair",
    "Motor Repairing",
    "Light Fitting",
    "Wire Fitting",
    "Motor Repairing",
    "Generator Repair",
    "Motor Repairing",
  ];
  late List<ListItem<String>> list;
  @override
  void initState() {
    super.initState();
    // populateData();
  }

  // void populateData() {
  //   list = [];
  //   for (int i = 0; i < skillList.length; i++) {
  //     print(list);
  //     list.add(ListItem(skillList[i]["title"]));
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomTabView(2),
      key: notDrawerKey,
      drawer: const SettingsView(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        bottomOpacity: 0,
        title: Text(
          "Add Your Skills",
          style: GoogleFonts.kadwa(
              color: Colors.white,
              fontWeight: FontWeight.w700,
              fontSize: F24()),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: SvgPicture.asset(Assets.drawerIcon_white),
          onPressed: () {
            if (!notDrawerKey.currentState!.isDrawerOpen) {
              //check if drawer is closed
              notDrawerKey.currentState!.openDrawer(); //open drawer
            }
          },
        ),
        actions: [
          IconButton(
            padding: const EdgeInsetsDirectional.only(end: 9.11),
            onPressed: (() => {Get.to(() => NotificationView())}),
            icon: SvgPicture.asset(Assets.notification),
          ),
        ],
        backgroundColor: Colors.black,
        elevation: 0.0,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              alignment: WrapAlignment.start,
              direction: Axis.vertical,
              children: (skillList)
                  .map((e) => SkillCard(
                        title: e,
                        skillList: widget.resultList,
                      ))
                  .toList(),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 15, left: 16, right: 16.0),
              child: DynamicButton("Save & Next", true, () {
                if (Get.arguments == 'resume') {
                  resumeController.UpdateSkills();
                } else {
                  Get.back();
                }
              }),
            )
          ],
        ),
      ),
      //     body: Column(
      //       children: [
      //         Stack(
      //           children: [
      //             Container(
      //               height: getVerticalSize(40),
      //               color: Colors.black,
      //             ),
      //             Padding(
      //                 padding: const EdgeInsets.symmetric(
      //                     vertical: 12.0, horizontal: 16.0),
      //                 child: TextFeildGreyBorder(
      //                   hintText: "Start type your skills",
      //                 )),
      //           ],
      //         ),
      //         Expanded(
      //           child: ListView.builder(
      //             itemCount: list.length,
      //             itemBuilder: _getListItemTile,
      //           ),
      //         ),
      // Padding(
      //   padding: const EdgeInsets.only(top: 15, left: 16, right: 16.0),
      //   child: DynamicButton("Save & Next", true, () {
      //     Get.back();
      //   }),
      // )
      //       ],
      //     ),
      //   );
      // }

      // Widget _getListItemTile(BuildContext context, int index) {
      //   return GestureDetector(
      //       onTap: () {
      //         if (list.any((item) => item.isSelected)) {
      //           print(list[index].data);
      //           widget.addSkillList.remove(list[index].data);
      //           print(widget.addSkillList);
      //           setState(() {
      //             list[index].isSelected = !list[index].isSelected;
      //           });
      //         } else {
      //           print(list[index].data);

      //           widget.addSkillList.add(list[index].data);
      //           print(widget.addSkillList);
      //           setState(() {
      //             list[index].isSelected = true;
      //           });
      //         }
      //       },
      //       child: list[index].isSelected
      //           ? SkillCard(skillList[index]['title'], true)
      //           : SkillCard(skillList[index]['title'], false)
      //  SingleChildScrollView(
      //   child: Column(
      //     mainAxisAlignment: MainAxisAlignment.start,
      //     crossAxisAlignment: CrossAxisAlignment.start,
      //     children: [
      //      Stack(
      //           children: [
      //             Container(
      //               height: getVerticalSize(40),
      //               color: Colors.black,
      //             ),
      //             Padding(
      //                 padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 16.0),
      //                 child: TextFeildGreyBorder(hintText: "Start type your skills",)),
      //           ],
      //         ),
      //       SkillCard(
      //         "Light Fitting",
      //         () => null,
      //       ),
      //       SkillCard("Wire Fitting", () => null),
      //       SkillCard(
      //         "Light Fitting",
      //         () => null,
      //       ),
      //       SkillCard("Wire Fitting", () => null),
      //       SkillCard(
      //         "Light Fitting",
      //         () => null,
      //       ),
      //       SkillCard("Wire Fitting", () => null),
      //       SkillCard(
      //         "Light Fitting",
      //         () => null,
      //       ),
      //       SkillCard("Wire Fitting", () => null),
      //       SkillCard(
      //         "Light Fitting",
      //         () => null,
      //       ),
      //       SkillCard("Wire Fitting", () => null),
      //     ],
      //   ),
      // ),
// bottomNavigationBar: BottomTabView(9),
      // bottomNavigationBar: MyNavigator(),
    );
  }
}
