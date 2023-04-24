import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ekinch/app/modules/dashboard/widgets/dashboard_profile.dart';
import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:ekinch/app/modules/job/form/views/details_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/click_custom.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/custom_job_form.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/pop_up_exp.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/skill_container.dart';
import 'package:ekinch/app/modules/listpostjob/views/jobs_view.dart';
import 'package:ekinch/app/utils/localStorage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/add_skills.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/notication/view/notification_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:getwidget/components/button/gf_button.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../widgets/math_utils.dart';
import '../../../../../widgets/snack_bar.dart';

import '../../../custom_widget/color.dart';
import '../../../custom_widget/font_size.dart';
import '../../../generated/assets.dart';
import '../../dashboard/widgets/navigation.dart';
import '../../settings/views/settings_view.dart';

class GetJobEditView extends StatefulWidget {
  GetJobEditView({
    super.key,
  });

  @override
  State<GetJobEditView> createState() => GetJobEditViewState();
}

class GetJobEditViewState extends State<GetJobEditView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  GetJobController controller = Get.put(GetJobController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      key: notDrawerKey, drawer: const SettingsView(),
      // appBar: UpperBar("Records", "Records", true, true),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(200),
        child: AppBar(
          centerTitle: true,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(180),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                CircleAvatar(
                  radius: 40,
                  backgroundColor: Color(0xFFE0E0E0),
                  child: Container(
                    height: 90.sp,
                    width: 90.sp,
                    decoration: BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: LocalStorage.shared.getProfile() ==
                                  "https://d3nypwrzdy6f4k.cloudfront.net/"
                              ? AssetImage('assets/images/profile_icon.png')
                              : NetworkImage(
                                      "${LocalStorage.shared.getProfile()}")
                                  as ImageProvider),
                      border: Border.all(color: KColors.greyLine, width: 2.0),
                    ),
                  ),
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.firstName}",
                  style: GoogleFonts.kadwa(
                      color: Colors.white,
                      fontSize: F20(),
                      fontWeight: FontWeight.bold),
                ),
                Text(
                  "${LocalStorage.shared.getUserData()?.userData?.profession.toString()}",
                  style: GoogleFonts.kadwa(
                    height: 1.2,
                    color: Colors.white,
                    fontSize: F14(),
                  ),
                ),
                SizedBox(
                  height: getVerticalSize(20),
                )
              ],
            ),
          ),
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
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: InkWell(
                onTap: () {
                  Get.back();
                  Get.back();
                },
                child: Container(
                  width: getHorizontalSize(58),
                  height: getVerticalSize(27),
                  decoration: BoxDecoration(
                      color: KColors.orange,
                      borderRadius: BorderRadius.circular(6)),
                  child: Center(
                    child: Text(
                      "Edit",
                      style: GoogleFonts.kadwa(
                          fontSize: F14(), color: Colors.black),
                    ),
                  ),
                ),
              ),
            )
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,  
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
            
              Padding(
                padding: const EdgeInsets.symmetric(
                    vertical: 16.0, horizontal: 12.0),
                child: Center(
                  child: DynamicButton("Submit", true, () {
                    controller.GetJobForm();
                  }),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomTabView(2),
    );
  }
}
