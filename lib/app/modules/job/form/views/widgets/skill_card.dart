import 'package:ekinch/app/custom_widget/color.dart';
import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class SkillCard extends StatefulWidget {
  final String title;
  final List skillList;
  SkillCard({super.key, required this.title, required this.skillList});
  bool selected = false;
  @override
  State<SkillCard> createState() => _SkillCardState();
}

class _SkillCardState extends State<SkillCard> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: InkWell(
        onTap: () {
          setState(() {
            if (widget.selected) {
              widget.skillList.remove(widget.title);
              widget.selected = false;
            } else {
              widget.skillList.add(widget.title);
              widget.selected = true;
            }
          });
        },
        child: Container(
          width: Get.width / 1.1,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(6),
              border: Border.all(
                  color: const Color.fromARGB(255, 193, 191, 191), width: 1.0)),
          child: Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.kadwa(
                      fontSize: F18(), color: KColors.textGrey),
                ),
                widget.selected
                    ? Text(
                        AppLocalizations.of(context)!.aDDED,
                        style: GoogleFonts.kadwa(
                            fontSize: F18(), color: KColors.green),
                      )
                    : Text(
                        AppLocalizations.of(context)!.aDD,
                        style: GoogleFonts.kadwa(
                            fontSize: F18(), color: Colors.black),
                      )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
