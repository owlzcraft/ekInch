import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:ekinch/app/modules/job/jobInterested/widget/card.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:ekinch/app/modules/postjob/views/postjob_view.dart';
import 'package:ekinch/app/modules/settings/views/settings_view.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../dashboard/widgets/navigation.dart';
import '../../../postjob/controllers/postjob_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class JobInterestedView extends StatefulWidget {
  const JobInterestedView({Key? key}) : super(key: key);

  @override
  State<JobInterestedView> createState() => _JobInterestedViewState();
}

class _JobInterestedViewState extends State<JobInterestedView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    PostjobController controller = Get.put(PostjobController());
    var jobCategory = [
      {
        "inactive_icon": "assets/icons/labour_inactive.svg",
        "active_icon": "assets/icons/labour_active.svg",
        "title": AppLocalizations.of(context)!.labour,
      },
      {
        "inactive_icon": "assets/icons/plasterMistri_inactive.svg",
        "active_icon": "assets/icons/plasterMistri_active.svg",
        "title": AppLocalizations.of(context)!.plastermistri,
      },
      {
        "inactive_icon": "assets/icons/welding_inactive.svg",
        "active_icon": "assets/icons/welding_active.svg",
        "title": AppLocalizations.of(context)!.welder,
      },
      {
        "inactive_icon": "assets/icons/plumber_inactive.svg",
        "active_icon": "assets/icons/plumber_active.svg",
        "title": AppLocalizations.of(context)!.plumber,
      },
      {
        "inactive_icon": "assets/icons/electrician_inactive.svg",
        "active_icon": "assets/icons/electrician_active.svg",
        "title": AppLocalizations.of(context)!.electrician,
      },
      {
        "inactive_icon": "assets/icons/painter_inactive.svg",
        "active_icon": "assets/icons/painter_active.svg",
        "title": AppLocalizations.of(context)!.painter,
      },
      {
        "inactive_icon": "assets/icons/carpenter_inactive.svg",
        "active_icon": "assets/icons/carpenter_active.svg",
        "title": AppLocalizations.of(context)!.carpenter,
      },
      {
        "inactive_icon": "assets/icons/tilesMistri_inactive.svg",
        "active_icon": "assets/icons/tilesMistri_active.svg",
        "title": AppLocalizations.of(context)!.tilesmistri
      },
      {
        "inactive_icon": "assets/icons/welding_inactive.svg",
        "active_icon": "assets/icons/welding_active.svg",
        "title": AppLocalizations.of(context)!.engineer,
      },
      {
        "inactive_icon": "assets/icons/carpenter_inactive.svg",
        "active_icon": "assets/icons/carpenter_active.svg",
        "title": AppLocalizations.of(context)!.architect,
      },
      {
        "inactive_icon": "assets/icons/labour_inactive.svg",
        "active_icon": "assets/icons/labour_active.svg",
        "title": AppLocalizations.of(context)!.dukandar,
      },
      {
        "inactive_icon": "assets/icons/welding_inactive.svg",
        "active_icon": "assets/icons/welding_active.svg",
        "title": AppLocalizations.of(context)!.contractor,
      },
      {
        "inactive_icon": "assets/icons/labour_inactive.svg",
        "active_icon": "assets/icons/labour_active.svg",
        "title": AppLocalizations.of(context)!.customer,
      },
      {
        "inactive_icon": "assets/icons/labour_inactive.svg",
        "active_icon": "assets/icons/labour_active.svg",
        "title": AppLocalizations.of(context)!.other,
      }
    ].obs;
    return Scaffold(
      key: notDrawerKey,
      drawer: const SettingsView(),
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(70),
        child: AppBar(
          title: Text(
            AppLocalizations.of(context)!.iamInterestedin,
            style: GoogleFonts.kadwa(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: SvgPicture.asset(Assets.drawerIcon_white),
            onPressed: () {
              if (!notDrawerKey.currentState!.isDrawerOpen) {
                notDrawerKey.currentState!.openDrawer();
              }
            },
          ),
          actions: [
            IconButton(
              padding: const EdgeInsetsDirectional.only(end: 9.11),
              onPressed: (() => {}),
              icon: SvgPicture.asset(Assets.search_icon),
            ),
          ],
          backgroundColor: Colors.black,
          elevation: 0.0,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 25),
              color: Colors.white,
              child: GridView.count(
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                crossAxisCount: 3,
                childAspectRatio: 0.9,
                crossAxisSpacing: 2,
                mainAxisSpacing: 5,
                children: jobCategory.map((e) {
                  var index = jobCategory.indexOf(e);
                  return Obx(() => GestureDetector(
                        onTap: () {
                          controller.profession1.text =
                              jobCategory[controller.activeCategory.value]
                                      ['title']
                                  .toString();
                          controller.activeCategory.value = index;
                        },
                        child: JobCategoryCard(
                            data: e,
                            active: index == controller.activeCategory.value
                                ? true
                                : false),
                      ));
                }).toList(),
              ),
            ),
            Padding(
              padding:
                  const EdgeInsets.only(bottom: 20, left: 16.0, right: 16.0),
              child: DynamicButton(AppLocalizations.of(context)!.proceed, true,
                  () {
                Get.to(const PostjobView());
              }),
            )
          ],
        ),
      ),
      bottomNavigationBar: const BottomTabView(2),
    );
  }
}
