import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/job/form/views/widgets/skill_card.dart';
import 'package:ekinch/app/modules/mobile/widget/yellow_button.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/generated/assets.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../../dashboard/widgets/navigation.dart';
import '../../../../notication/view/notification_view.dart';
import '../../../../resume/controller/resume_controller.dart';
import '../../../../settings/views/settings_view.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class AddSkillView extends StatefulWidget {
  List resultList;
  List addSkillList;
  AddSkillView({
    super.key,
    required this.resultList,
    required this.addSkillList,
  });

  @override
  State<AddSkillView> createState() => _AddSkillViewState();
}

class ListItem<T> {
  bool isSelected = false;
  T data;
  ListItem(this.data);
}

class _AddSkillViewState extends State<AddSkillView> {
  GlobalKey<ScaffoldState> notDrawerKey = GlobalKey<ScaffoldState>();
  ResumeController resumeController = Get.put(ResumeController());

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
    List skillList = [
      AppLocalizations.of(context)!.leakagecurrentdetection,
      AppLocalizations.of(context)!.geyserConnection,
      AppLocalizations.of(context)!.fixturesinstallation,
      AppLocalizations.of(context)!.threephaseconnection,
      AppLocalizations.of(context)!.knowledgeaboutDC,
      AppLocalizations.of(context)!.twowayswitch,
      AppLocalizations.of(context)!.knowledgeaboutHTpanels,
      AppLocalizations.of(context)!.switchboardfixing,
      AppLocalizations.of(context)!.horizontalverticalchiselling,
      AppLocalizations.of(context)!.covelightningwork,
      AppLocalizations.of(context)!.fridgewashingmachineconnection,
      AppLocalizations.of(context)!.aCconnection,
      AppLocalizations.of(context)!.lighteningarresterwork,
      AppLocalizations.of(context)!.twophaseconnection,
      AppLocalizations.of(context)!.knowledgeaboutAC,
      AppLocalizations.of(context)!.one_way_switch,
      AppLocalizations.of(context)!.knowledge_about_lt_panels,
      AppLocalizations.of(context)!.conduit_placement_in_false_ceiling,
      AppLocalizations.of(context)!.knowledge_of_series_parallel_network,
      AppLocalizations.of(context)!.decorative_light_fixture_installation,
      AppLocalizations.of(context)!.lift_connection,
      AppLocalizations.of(context)!.detection_of_shot_circuiting,
      AppLocalizations.of(context)!
          .knowledge_of_wirecableswitchmcbccbfusemeter_etc,
      AppLocalizations.of(context)!.distribution_board_fixing,
      AppLocalizations.of(context)!.conduit_placement_in_rcc_slabwall,
      AppLocalizations.of(context)!.knowledge_of_drawing_reading,
      AppLocalizations.of(context)!.vertical_aligment,
      AppLocalizations.of(context)!.bar_binding_at_different_angles,
      AppLocalizations.of(context)!.machine_binding,
      AppLocalizations.of(context)!.chair_making_knowledge,
      AppLocalizations.of(context)!.drawing_reading,
      AppLocalizations.of(context)!.erection_of_bars,
      AppLocalizations.of(context)!.stirrups_cutting_making,
      AppLocalizations.of(context)!.hand_cutting_work,
      AppLocalizations.of(context)!.steel_bar_checking_knowledge,
      AppLocalizations.of(context)!.steel_bar_measurement_work,
      AppLocalizations.of(context)!.horizontal_bar_alignment,
      AppLocalizations.of(context)!.placement_of_bars,
      AppLocalizations.of(context)!.hand_bar_binding,
      AppLocalizations.of(context)!.machine_cutting,
      AppLocalizations.of(context)!.lap_length_knowledge,
      AppLocalizations.of(context)!.steel_bar_straightening_work,
      AppLocalizations.of(context)!.safety_knowledge_site,
      AppLocalizations.of(context)!.hand_cutting_work,
      AppLocalizations.of(context)!.plate_welding_work,
      AppLocalizations.of(context)!.welding_checking,
      AppLocalizations.of(context)!.fastner_drilling_fixing,
      AppLocalizations.of(context)!.rod_welding,
      AppLocalizations.of(context)!.drawing_reading,
      AppLocalizations.of(context)!.drawing_checking,
      AppLocalizations.of(context)!.ms_straightening_work,
      AppLocalizations.of(context)!.mechanical_cutting_work,
      AppLocalizations.of(context)!.gas_cutting,
      AppLocalizations.of(context)!.hold_fast_fabrication,
      AppLocalizations.of(context)!.gate_fabrication,
      AppLocalizations.of(context)!.steel_welding,
      AppLocalizations.of(context)!.gas_welding,
      AppLocalizations.of(context)!.cast_iron_work,
      AppLocalizations.of(context)!.fillet_welding_work,
      AppLocalizations.of(context)!.repair_work,
      AppLocalizations.of(context)!.railing_fabrication,
      AppLocalizations.of(context)!.material_checking,
      AppLocalizations.of(context)!.spot_welding,
      AppLocalizations.of(context)!.argon_welding,
      AppLocalizations.of(context)!.measurement_work,
      AppLocalizations.of(context)!.beading_work,
      AppLocalizations.of(context)!.veneer_pasting,
      AppLocalizations.of(context)!.wardrobe_work,
      AppLocalizations.of(context)!.lock_fixing,
      AppLocalizations.of(context)!.wood_adhesive_work,
      AppLocalizations.of(context)!.wood_finshing_work,
      AppLocalizations.of(context)!.drawing_checking,
      AppLocalizations.of(context)!.jali_fixing_work,
      AppLocalizations.of(context)!.dressing_table_work,
      AppLocalizations.of(context)!.latch_fixing,
      AppLocalizations.of(context)!.wood_grinding_work,
      AppLocalizations.of(context)!.wood_jointing_work,
      AppLocalizations.of(context)!.wood_sawing_work,
      AppLocalizations.of(context)!.leveling_work,
      AppLocalizations.of(context)!.glass_fixing_work,
      AppLocalizations.of(context)!.bed_making_work,
      AppLocalizations.of(context)!.hinges_fixing,
      AppLocalizations.of(context)!.tower_bolt_fixing,
      AppLocalizations.of(context)!.mica_pasting_work,
      AppLocalizations.of(context)!.pattern_painting,
      AppLocalizations.of(context)!.wood_cutting,
      AppLocalizations.of(context)!.measurement_work,
      AppLocalizations.of(context)!.duco_painting,
      AppLocalizations.of(context)!.lacquer_polishing,
      AppLocalizations.of(context)!.interior_painting,
      AppLocalizations.of(context)!.texture_painting,
      AppLocalizations.of(context)!.pvc_polishing,
      AppLocalizations.of(context)!.cleaning_work,
      AppLocalizations.of(context)!.polishing_natural,
      AppLocalizations.of(context)!.exterior_painting,
      AppLocalizations.of(context)!.roller_painting_work,
      AppLocalizations.of(context)!.putty_work,
      AppLocalizations.of(context)!.paint_material_checking,
      AppLocalizations.of(context)!.satin_painting,
      AppLocalizations.of(context)!.melamine_polishing,
      AppLocalizations.of(context)!.ground_panting,
      AppLocalizations.of(context)!.pattern_painting,
      AppLocalizations.of(context)!.machine_sanding,
      AppLocalizations.of(context)!.sanding,
      AppLocalizations.of(context)!.material_checking,
      AppLocalizations.of(context)!.drawing_checking,
      AppLocalizations.of(context)!.drawing_reading,
      AppLocalizations.of(context)!.sewer_chamber_construction_work,
      AppLocalizations.of(context)!.geyser_installation,
      AppLocalizations.of(context)!.bottle_trap_fixing,
      AppLocalizations.of(context)!.jointing_work,
      AppLocalizations.of(context)!.levelling_work,
      AppLocalizations.of(context)!.repairing_work,
      AppLocalizations.of(context)!.spout_fixing,
      AppLocalizations.of(context)!.wc_fixing,
      AppLocalizations.of(context)!.threading_work,
      AppLocalizations.of(context)!.water_leakage_checking,
      AppLocalizations.of(context)!.water_tank_fixing,
      AppLocalizations.of(context)!.water_tap_fixing,
      AppLocalizations.of(context)!.pipe_fitting,
      AppLocalizations.of(context)!.core_cutting,
      AppLocalizations.of(context)!.repair_work,
      AppLocalizations.of(context)!.concrete_work,
      AppLocalizations.of(context)!.plastering_work,
      AppLocalizations.of(context)!.steel_work,
      AppLocalizations.of(context)!.levelling_work,
      AppLocalizations.of(context)!.ground_filling,
      AppLocalizations.of(context)!.shuttering_work,
      AppLocalizations.of(context)!.stone_work,
      AppLocalizations.of(context)!.brick_work,
      AppLocalizations.of(context)!.construction_material_checking,
      AppLocalizations.of(context)!.grouting_work,
      AppLocalizations.of(context)!.damp_proofing_work,
      AppLocalizations.of(context)!.rcc_work,
      AppLocalizations.of(context)!.tile_work,
      AppLocalizations.of(context)!.measurement_work
    ];
    return Scaffold(
      bottomNavigationBar: const BottomTabView(2),
      key: notDrawerKey,
      drawer: const SettingsView(),
      appBar: AppBar(
        foregroundColor: Colors.black,
        bottomOpacity: 0,
        title: Text(
          AppLocalizations.of(context)!.addYourSkills,
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
          
              notDrawerKey.currentState!.openDrawer(); 
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
              child: DynamicButton(AppLocalizations.of(context)!.saveNext, true, () {
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
