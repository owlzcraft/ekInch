// ignore_for_file: file_names

import 'package:ekinch/app/modules/postjob/controllers/postjob_controller.dart';
import 'package:ekinch/app/modules/postjob/views/widget/select_skills.dart';
import 'package:ekinch/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_multiselect/flutter_multiselect.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../../../custom_widget/font_size.dart';

class JobDescriptions extends StatefulWidget {
  const JobDescriptions({Key? key}) : super(key: key);

  @override
  JobDescriptionsState createState() => JobDescriptionsState();
}

class JobDescriptionsState extends State<JobDescriptions> {
  PostjobController controller = Get.put(PostjobController());
  int _count = 0;
  bool list1 = false;
  bool list2 = false;
  bool list3 = false;
  bool list4 = false;
  bool list5 = false;
  bool list6 = false;
  bool list7 = false;

  @override
  Widget build(BuildContext context) {
    List skill = [
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
      backgroundColor: whitedark,
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          //    mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.location,
              style: GoogleFonts.kadwa(
                fontSize: F18(),
                fontWeight: FontWeight.w700,
                color: black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),
            DropdownFieldFull(
              controller: controller.address,
              hintText: AppLocalizations.of(context)!.selectLocation,
              items: [
                AppLocalizations.of(context)!.agra,
                AppLocalizations.of(context)!.ahmedabad,
                AppLocalizations.of(context)!.ajmer,
                AppLocalizations.of(context)!.akola,
                AppLocalizations.of(context)!.aligarh,
                AppLocalizations.of(context)!.allahabad,
                AppLocalizations.of(context)!.alwar,
                AppLocalizations.of(context)!.amravati,
                AppLocalizations.of(context)!.amritsar,
                AppLocalizations.of(context)!.anand,
                AppLocalizations.of(context)!.anantapur,
                AppLocalizations.of(context)!.arrah,
                AppLocalizations.of(context)!.asansol,
                AppLocalizations.of(context)!.aurangabad,
                AppLocalizations.of(context)!.avadi,
                AppLocalizations.of(context)!.bally,
                AppLocalizations.of(context)!.bangalore,
                AppLocalizations.of(context)!.baranagar,
                AppLocalizations.of(context)!.barasat,
                AppLocalizations.of(context)!.bardhaman,
                AppLocalizations.of(context)!.bareilly,
                AppLocalizations.of(context)!.bathinda,
                AppLocalizations.of(context)!.begusarai,
                AppLocalizations.of(context)!.belgaum,
                AppLocalizations.of(context)!.bellary,
                AppLocalizations.of(context)!.berhampur,
                AppLocalizations.of(context)!.bhagalpur,
                AppLocalizations.of(context)!.bharatpur,
                AppLocalizations.of(context)!.bhatpara,
                AppLocalizations.of(context)!.bhilai,
                AppLocalizations.of(context)!.bhilwara,
                AppLocalizations.of(context)!.bhiwandi,
                AppLocalizations.of(context)!.bhopal,
                AppLocalizations.of(context)!.bhubaneswar,
                AppLocalizations.of(context)!.bhusawal,
                AppLocalizations.of(context)!.bidar,
                AppLocalizations.of(context)!.biharsharif,
                AppLocalizations.of(context)!.bijapur,
                AppLocalizations.of(context)!.bikaner,
                AppLocalizations.of(context)!.bilaspur,
                AppLocalizations.of(context)!.bokaro,
                AppLocalizations.of(context)!.brahmapur,
                AppLocalizations.of(context)!.budaun,
                AppLocalizations.of(context)!.bulandshahr,
                AppLocalizations.of(context)!.burhanpur,
                AppLocalizations.of(context)!.chandausi,
                AppLocalizations.of(context)!.chandigarh,
                AppLocalizations.of(context)!.chandrapur,
                AppLocalizations.of(context)!.chapra,
                AppLocalizations.of(context)!.chennai,
                AppLocalizations.of(context)!.chinsurah,
                AppLocalizations.of(context)!.coimbatore,
                AppLocalizations.of(context)!.cuttack,
                AppLocalizations.of(context)!.daman,
                AppLocalizations.of(context)!.darbhanga,
                AppLocalizations.of(context)!.darjiling,
                AppLocalizations.of(context)!.davanagere,
                AppLocalizations.of(context)!.dehradun,
                AppLocalizations.of(context)!.dehri,
                AppLocalizations.of(context)!.delhi,
                AppLocalizations.of(context)!.deoghar,
                AppLocalizations.of(context)!.dewas,
                AppLocalizations.of(context)!.dhanbad,
                AppLocalizations.of(context)!.dhule,
                AppLocalizations.of(context)!.dibrugarh,
                AppLocalizations.of(context)!.dimapur,
                AppLocalizations.of(context)!.dindigul,
                AppLocalizations.of(context)!.durg,
                AppLocalizations.of(context)!.durgapur,
                AppLocalizations.of(context)!.ernakulam,
                AppLocalizations.of(context)!.erode,
                AppLocalizations.of(context)!.faridabad,
                AppLocalizations.of(context)!.gandhidham,
                AppLocalizations.of(context)!.gandhinagar,
                AppLocalizations.of(context)!.gangtok,
                AppLocalizations.of(context)!.ghaziabad,
                AppLocalizations.of(context)!.giridih,
                AppLocalizations.of(context)!.goa,
                AppLocalizations.of(context)!.gorakhpur,
                AppLocalizations.of(context)!.gulbarga,
                AppLocalizations.of(context)!.guntur,
                AppLocalizations.of(context)!.gurgaon,
                AppLocalizations.of(context)!.guwahati,
                AppLocalizations.of(context)!.gwalior,
                AppLocalizations.of(context)!.hajipur,
                AppLocalizations.of(context)!.haldia,
                AppLocalizations.of(context)!.haldwani,
                AppLocalizations.of(context)!.hapur,
                AppLocalizations.of(context)!.haridwar,
                AppLocalizations.of(context)!.hassan,
                AppLocalizations.of(context)!.himatnagar,
                AppLocalizations.of(context)!.hindupur,
                AppLocalizations.of(context)!.hisar,
                AppLocalizations.of(context)!.hooghly,
                AppLocalizations.of(context)!.hoshiarpur,
                AppLocalizations.of(context)!.howrah,
                AppLocalizations.of(context)!.hubli,
                AppLocalizations.of(context)!.hyderabad,
                AppLocalizations.of(context)!.idukki,
                AppLocalizations.of(context)!.imphal,
                AppLocalizations.of(context)!.indore,
                AppLocalizations.of(context)!.jabalpur,
                AppLocalizations.of(context)!.jagdalpur,
                AppLocalizations.of(context)!.jaipur,
                AppLocalizations.of(context)!.jalandhar,
                AppLocalizations.of(context)!.jalgaon,
                AppLocalizations.of(context)!.jammu,
                AppLocalizations.of(context)!.jamnagar,
                AppLocalizations.of(context)!.jamshedpur,
                AppLocalizations.of(context)!.jhansi,
                AppLocalizations.of(context)!.jodhpur,
                AppLocalizations.of(context)!.junagadh,
                AppLocalizations.of(context)!.kadapa,
                AppLocalizations.of(context)!.kakinada,
                AppLocalizations.of(context)!.kalaburagi,
                AppLocalizations.of(context)!.kalyan,
                AppLocalizations.of(context)!.kamrup,
                AppLocalizations.of(context)!.kanpur,
                AppLocalizations.of(context)!.kanyakumari,
                AppLocalizations.of(context)!.karimnagar,
                AppLocalizations.of(context)!.karur,
                AppLocalizations.of(context)!.kashipur,
                AppLocalizations.of(context)!.katihar,
                AppLocalizations.of(context)!.katni,
                AppLocalizations.of(context)!.khammam,
                AppLocalizations.of(context)!.khandwa,
                AppLocalizations.of(context)!.khanna,
                AppLocalizations.of(context)!.kharagpur,
                AppLocalizations.of(context)!.kochi,
                AppLocalizations.of(context)!.kohima,
                AppLocalizations.of(context)!.kolhapur,
                AppLocalizations.of(context)!.kolkata,
                AppLocalizations.of(context)!.korba,
                AppLocalizations.of(context)!.kota,
                AppLocalizations.of(context)!.kottayam,
                AppLocalizations.of(context)!.kozhikode,
                AppLocalizations.of(context)!.kurnool,
                AppLocalizations.of(context)!.latur,
                AppLocalizations.of(context)!.lucknow,
                AppLocalizations.of(context)!.ludhiana,
                AppLocalizations.of(context)!.madurai,
                AppLocalizations.of(context)!.maheshtala,
                AppLocalizations.of(context)!.malappuram,
                AppLocalizations.of(context)!.mangaluru,
                AppLocalizations.of(context)!.mathura,
                AppLocalizations.of(context)!.meerut,
                AppLocalizations.of(context)!.mehsana,
                AppLocalizations.of(context)!.mira,
                AppLocalizations.of(context)!.mirzapur,
                AppLocalizations.of(context)!.moradabad,
                AppLocalizations.of(context)!.mumbai,
                AppLocalizations.of(context)!.muzaffarnagar,
                AppLocalizations.of(context)!.muzaffarpur,
                AppLocalizations.of(context)!.mysuru,
                AppLocalizations.of(context)!.nadiad,
                AppLocalizations.of(context)!.nagaon,
                AppLocalizations.of(context)!.nagapattinam,
                AppLocalizations.of(context)!.nagpur,
                AppLocalizations.of(context)!.naihati,
                AppLocalizations.of(context)!.nalgonda,
                AppLocalizations.of(context)!.namakkal,
                AppLocalizations.of(context)!.nanded,
                AppLocalizations.of(context)!.nashik,
                AppLocalizations.of(context)!.navsari,
                AppLocalizations.of(context)!.nellore,
                AppLocalizations.of(context)!.nizamabad,
                AppLocalizations.of(context)!.noida,
                AppLocalizations.of(context)!.ongole,
                AppLocalizations.of(context)!.palakkad,
                AppLocalizations.of(context)!.palanpur,
                AppLocalizations.of(context)!.pali,
                AppLocalizations.of(context)!.panaji,
                AppLocalizations.of(context)!.panchkula,
                AppLocalizations.of(context)!.panipat,
                AppLocalizations.of(context)!.panvel,
                AppLocalizations.of(context)!.parbhani,
                AppLocalizations.of(context)!.patiala,
                AppLocalizations.of(context)!.patna,
                AppLocalizations.of(context)!.pimpri,
                AppLocalizations.of(context)!.ponnani,
                AppLocalizations.of(context)!.port,
                AppLocalizations.of(context)!.prayagraj,
                AppLocalizations.of(context)!.puducherry,
                AppLocalizations.of(context)!.pune,
                AppLocalizations.of(context)!.purulia,
                AppLocalizations.of(context)!.rae,
                AppLocalizations.of(context)!.raipur,
                AppLocalizations.of(context)!.rajahmundry,
                AppLocalizations.of(context)!.rajapalayam,
                AppLocalizations.of(context)!.rajkot,
                AppLocalizations.of(context)!.ramagundam,
                AppLocalizations.of(context)!.rampur,
                AppLocalizations.of(context)!.ranchi,
                AppLocalizations.of(context)!.ratlam,
                AppLocalizations.of(context)!.ratnagiri,
                AppLocalizations.of(context)!.rewa,
                AppLocalizations.of(context)!.rewari,
                AppLocalizations.of(context)!.rohtak,
                AppLocalizations.of(context)!.roorkee,
                AppLocalizations.of(context)!.saharanpur,
                AppLocalizations.of(context)!.salem,
                AppLocalizations.of(context)!.sambalpur,
                AppLocalizations.of(context)!.sambhal,
                AppLocalizations.of(context)!.sangli,
                AppLocalizations.of(context)!.sasaram,
                AppLocalizations.of(context)!.satara,
                AppLocalizations.of(context)!.satna,
                AppLocalizations.of(context)!.secunderabad,
                AppLocalizations.of(context)!.serampore,
                AppLocalizations.of(context)!.shivamogga,
                AppLocalizations.of(context)!.shimla,
                AppLocalizations.of(context)!.shimoga,
                AppLocalizations.of(context)!.silchar,
                AppLocalizations.of(context)!.siliguri,
                AppLocalizations.of(context)!.singrauli,
                AppLocalizations.of(context)!.sirsa,
                AppLocalizations.of(context)!.sivakasi,
                AppLocalizations.of(context)!.siwan,
                AppLocalizations.of(context)!.solapur,
                AppLocalizations.of(context)!.sonipat,
                AppLocalizations.of(context)!.sri,
                AppLocalizations.of(context)!.srikakulam,
                AppLocalizations.of(context)!.srinagar,
                AppLocalizations.of(context)!.surat,
                AppLocalizations.of(context)!.thane,
                AppLocalizations.of(context)!.thanjavur,
                AppLocalizations.of(context)!.thiruvananthapuram,
                AppLocalizations.of(context)!.thrissur,
                AppLocalizations.of(context)!.tinsukia,
                AppLocalizations.of(context)!.tiruchirappalli,
                AppLocalizations.of(context)!.tirunelveli,
                AppLocalizations.of(context)!.tirupati,
                AppLocalizations.of(context)!.tiruppur,
                AppLocalizations.of(context)!.tiruvannamalai,
                AppLocalizations.of(context)!.tumakuru,
                AppLocalizations.of(context)!.udaipur,
                AppLocalizations.of(context)!.udupi,
                AppLocalizations.of(context)!.ujjain,
                AppLocalizations.of(context)!.ulhasnagar,
                AppLocalizations.of(context)!.unnao,
                AppLocalizations.of(context)!.vadodara,
                AppLocalizations.of(context)!.vallabh,
                AppLocalizations.of(context)!.valsad,
                AppLocalizations.of(context)!.vapi,
                AppLocalizations.of(context)!.varanasi,
                AppLocalizations.of(context)!.vasai,
                AppLocalizations.of(context)!.vellore,
                AppLocalizations.of(context)!.vijayawada,
                AppLocalizations.of(context)!.viluppuram,
                AppLocalizations.of(context)!.virar,
                AppLocalizations.of(context)!.visakhapatnam,
                AppLocalizations.of(context)!.warangal,
                AppLocalizations.of(context)!.wardha,
                AppLocalizations.of(context)!.yamunanagar,
                AppLocalizations.of(context)!.yanam,
                AppLocalizations.of(context)!.yavatmal,
                AppLocalizations.of(context)!.zirakpur
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.012,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  AppLocalizations.of(context)!.skillsfortheJob,
                  style: GoogleFonts.kadwa(
                    fontSize: F18(),
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                ),
                Text(
                  AppLocalizations.of(context)!.add,
                  style: GoogleFonts.kadwa(
                    fontSize: F18(),
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                ),
              ],
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),

            Wrap(
              clipBehavior: Clip.antiAlias,
              alignment: WrapAlignment.start,
              direction: Axis.horizontal,
              children: (skill)
                  .sublist(0, 10)
                  .map((e) => SelectSkillCard(
                        title: e,
                      ))
                  .toList(),
            ),
            Visibility(
              visible: list1,
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: (skill)
                    .sublist(11, 40)
                    .map((e) => SelectSkillCard(
                          title: e,
                        ))
                    .toList(),
              ),
            ),
            Visibility(
              visible: list2,
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: (skill)
                    .sublist(41, 60)
                    .map((e) => SelectSkillCard(
                          title: e,
                        ))
                    .toList(),
              ),
            ),
            Visibility(
              visible: list3,
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: (skill)
                    .sublist(61, 85)
                    .map((e) => SelectSkillCard(
                          title: e,
                        ))
                    .toList(),
              ),
            ),
            Visibility(
              visible: list4,
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: (skill)
                    .sublist(86, 120)
                    .map((e) => SelectSkillCard(
                          title: e,
                        ))
                    .toList(),
              ),
            ),
            Visibility(
              visible: list5,
              child: Wrap(
                alignment: WrapAlignment.start,
                direction: Axis.horizontal,
                children: (skill)
                    .sublist(121, 136)
                    .map((e) => SelectSkillCard(
                          title: e,
                        ))
                    .toList(),
              ),
            ),

            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //  SelectSkill(context, controller)
                InkWell(
                  onTap: () {
                    _count++;
                    setState(() {
                      switch (_count) {
                        case 1:
                          list1 = true;
                          break;
                        case 2:
                          list2 = true;
                          break;
                        case 3:
                          list3 = true;
                          break;
                        case 4:
                          list4 = true;
                          break;
                        case 5:
                          list5 = true;
                          break;
                        case 6:
                          list6 = true;
                          break;
                        case 7:
                          list7 = true;
                          break;
                        case 8:
                          errorSnackbar(
                              AppLocalizations.of(context)!.noMoreSKills);
                      }
                    });
                  },
                  child: Text(
                    AppLocalizations.of(context)!.loadMore,
                    style: GoogleFonts.kadwa(
                      fontSize: F18(),
                      fontWeight: FontWeight.w700,
                      color: black,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              AppLocalizations.of(context)!.describetheJobRole,
              style: GoogleFonts.kadwa(
                fontSize: F18(),
                fontWeight: FontWeight.w700,
                color: black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),
            SizedBox(
              height: 80,
              child: Description(
                controller: controller.description,
                hintText: AppLocalizations.of(context)!.pleaseDescribehere,
                initialValue: 'Please Describe here',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              AppLocalizations.of(context)!.jobTiming,
              style: GoogleFonts.kadwa(
                fontSize: F18(),
                fontWeight: FontWeight.w700,
                color: black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),
            DropdownFieldFull(
              controller: controller.jobTmg,
              hintText: AppLocalizations.of(context)!.selectJobTimming,
              items: const [
                '1:00 am - 10:00 am',
                '2:00 am - 11:00 am',
                '3:00 am - 12:00 pm',
                '4:00 am - 1:00 pm',
                '5:00 am - 2:00 pm',
                '6:00 am - 3:00 pm',
                '7:00 am - 4:00 pm',
                '8:00 am - 5:00 pm',
                '9:00 am - 6:00 pm',
                '10:00 am - 7:00 pm',
                '11:00 am - 8:00 pm',
                '12:00 pm - 9:00 pm',
                '1:00 pm -10:00 pm',
                '2:00 pm - 11:00 pm',
                '3:00 pm - 12:00 am',
                '4:00 pm - 1:00 am',
                '5:00 pm - 2:00 am',
                '6:00 pm - 3:00 am',
                '7:00 pm - 4:00 am',
                '8:00 pm - 5:00 am',
                '9:00 pm - 6:00 am',
                '10:00 pm - 7:00 am',
                '11:00 pm - 8:00 am',
                '12:00 pm - 9:00 am',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            // Text(
            //   'Interview Timing',
            //   style: GoogleFonts.kadwa(
            //     fontSize: F18(),
            //     fontWeight: FontWeight.w700,
            //     color: black,
            //   ),
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.002,
            // ),
            // DropdownFieldFull(
            //   controller: controller.interviewTime,
            //   hintText: "Select Interview Timming",
            //   items: [
            //     '9:00 am - 6:00 pm  |  Mon to Sat',
            //     '10:00 am - 7:00 pm  |  Mon to Sat',
            //     '11:00 am - 8:00 pm  |  Mon to Sat',
            //   ],
            // ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.03,
            // ),
            // Material(
            //     borderRadius: BorderRadius.circular(10.0),
            //     color: yellow,
            //     child: MaterialButton(
            //         minWidth: MediaQuery.of(context).size.width,
            //         onPressed: () {
            //         //  Get.to(CompanyDetails());
            //         },
            //         child: Center(
            //           child: Text(
            //             'Next',
            //             style: GoogleFonts.kadwa(
            //                 color: black,
            //                 fontSize: 18,
            //                 fontFamily: 'Kadwa',
            //                 fontWeight: FontWeight.w700),
            //           ),
            //         ))),
          ],
        ),
      ),
    );
  }
}
