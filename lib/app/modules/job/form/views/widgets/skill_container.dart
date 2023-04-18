import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../custom_widget/color.dart';
import '../../../../../custom_widget/font_size.dart';

class SkillContainerWidget extends StatelessWidget {
  String title;
   SkillContainerWidget({super.key,required this.title});

  @override
  Widget build(BuildContext context) {
    return  Container(
                                  decoration: BoxDecoration(
                                      color: KColors.greybg,
                                      borderRadius: BorderRadius.circular(100)),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 10.0),
                                    child: Center(
                                      child: Text(
                                        title,
                                        style: GoogleFonts.kadwa(
                                            fontSize: F14(),
                                            color: Colors.black),
                                      ),
                                    ),
                                  ),
                                );
  }
}