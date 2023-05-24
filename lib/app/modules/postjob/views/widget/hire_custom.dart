import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import '../../widgets/shortDropDown.dart';

class HireColumn extends StatefulWidget {
  final TextEditingController professionController;
  final TextEditingController numberController;
  final TextEditingController salaryStController;
  final TextEditingController salaryEndController;
  final TextEditingController expController;
  // TextEditingController locController;
  final TextEditingController langController;
  final TextEditingController qualification;
  final TextEditingController gender;
  const HireColumn(
      {super.key,
      required this.professionController,
      required this.numberController,
      required this.salaryStController,
      required this.salaryEndController,
      required this.expController,
      // required this.locController,
      required this.langController,
      required this.qualification,
      required this.gender});

  @override
  State<HireColumn> createState() => _HireColumnState();
}

class _HireColumnState extends State<HireColumn> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Form(
        // key: key,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          //    mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              AppLocalizations.of(context)!.iwanttoHireA,
              style: GoogleFonts.kadwa(
                fontSize: F18(),
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownFieldFull(
                    controller: widget.professionController,
                    hintText: widget.professionController.text,
                    // dropdownvalue: "${professionController.text}",
                    items: [
                      AppLocalizations.of(context)!.labour,
                      AppLocalizations.of(context)!.plastermistri,
                      AppLocalizations.of(context)!.tilesmistri,
                      AppLocalizations.of(context)!.plumber,
                      AppLocalizations.of(context)!.electrician,
                      AppLocalizations.of(context)!.painter,
                      AppLocalizations.of(context)!.carpenter,
                      AppLocalizations.of(context)!.welder,
                      AppLocalizations.of(context)!.barbender,
                      AppLocalizations.of(context)!.contractor,
                      AppLocalizations.of(context)!.dukandar,
                      AppLocalizations.of(context)!.customer,
                      AppLocalizations.of(context)!.engineer,
                      AppLocalizations.of(context)!.architect,
                      AppLocalizations.of(context)!.other
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.only(left: 12.sp),
                    child: DropdownFieldFull(
                      controller: widget.numberController,
                      hintText: "1",
                      // dropdownvalue: '1',
                      items: const [
                        '1',
                        '2',
                        '3',
                        "4",
                        "5",
                        "6",
                        "7",
                        "8",
                        "9",
                        "10"
                      ],
                    ),
                  ),
                )
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: DropdownFieldFull(
                      controller: widget.salaryStController,
                      hintText: AppLocalizations.of(context)!.salary,
                      items: const [
                        '5000',
                        '6000',
                        '7000',
                        '8000',
                        '9000',
                        '10000',
                        '11000',
                        '12000',
                        '13000',
                        '14000',
                        '15000',
                        '16000',
                        '17000',
                        '18000',
                        '19000',
                        '20000',
                        '21000',
                        '22000',
                        '23000',
                        '24000',
                        '25000',
                        '26000',
                        '27000',
                        '28000',
                        '29000',
                        '30000',
                        '31000',
                        '32000',
                        '33000',
                        '34000',
                        '35000',
                        '36000',
                        '37000',
                        '38000',
                        '39000',
                        '40000',
                        '41000',
                        '42000',
                        '43000',
                        '44000',
                        '45000',
                        '46000',
                        '47000',
                        '48000',
                        '49000',
                        '50000'
                      ]),
                ),
                Expanded(
                    child: Center(
                  child: Text(
                    AppLocalizations.of(context)!.to,
                    style: GoogleFonts.kadwa(
                        fontSize: F16(), fontWeight: FontWeight.w600),
                  ),
                )),
                Expanded(
                  flex: 2,
                  child: DropdownFieldFull(
                      controller: widget.salaryEndController,
                      hintText: AppLocalizations.of(context)!.salary,
                      items: const [
                        '5000',
                        '6000',
                        '7000',
                        '8000',
                        '9000',
                        '10000',
                        '11000',
                        '12000',
                        '13000',
                        '14000',
                        '15000',
                        '16000',
                        '17000',
                        '18000',
                        '19000',
                        '20000',
                        '21000',
                        '22000',
                        '23000',
                        '24000',
                        '25000',
                        '26000',
                        '27000',
                        '28000',
                        '29000',
                        '30000',
                        '31000',
                        '32000',
                        '33000',
                        '34000',
                        '35000',
                        '36000',
                        '37000',
                        '38000',
                        '39000',
                        '40000',
                        '41000',
                        '42000',
                        '43000',
                        '44000',
                        '45000',
                        '46000',
                        '47000',
                        '48000',
                        '49000',
                        '50000'
                      ]),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DropdownFieldFull(
              controller: widget.expController,
              hintText: AppLocalizations.of(context)!.enterExperienceInYears,
              items: const [
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12',
                '13',
                '14',
                '15',
                '16',
                '17',
                '18',
                '19',
                '20',
                '21',
                '22',
                '23',
                '24',
                '25',
                '26',
                '27',
                '28',
                '29',
                '30',
                '31',
                '32',
                '33',
                '34',
                '35',
                '36',
                '37',
                '38',
                '39',
                '40',
                '41',
                '42',
                '43',
                '44',
                '45',
                '46',
                '47',
                '48',
                '49',
                '50'
              ],
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            // DropdownFieldFull(
            //   controller: locController,
            //   hintText: "Select Location",
            //   items: const ['Roorkee', 'Talhedi', 'Laksar', "Noida", "Delhi"],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            DropdownFieldFull(
              controller: widget.langController,
              hintText: AppLocalizations.of(context)!.selectLanguage,
              items: [
                AppLocalizations.of(context)!.hindi,
                AppLocalizations.of(context)!.english,
                AppLocalizations.of(context)!.bengali,
                AppLocalizations.of(context)!.telugu,
                AppLocalizations.of(context)!.marathi,
                AppLocalizations.of(context)!.tamil,
                AppLocalizations.of(context)!.gujarati,
                AppLocalizations.of(context)!.urdu,
                AppLocalizations.of(context)!.kannada,
                AppLocalizations.of(context)!.odia,
                AppLocalizations.of(context)!.punjabi,
                AppLocalizations.of(context)!.malayalam,
                AppLocalizations.of(context)!.assamese,
                AppLocalizations.of(context)!.kashmiri,
                AppLocalizations.of(context)!.sindhi,
                AppLocalizations.of(context)!.sanskrit
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              AppLocalizations.of(context)!.qualification,
              style: GoogleFonts.kadwa(
                fontSize: F18(),
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),

            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),
            // SizedBox(
            //   height: MediaQuery.of(context).size.height * 0.02,
            // ),
            DropdownFieldFull(
              controller: widget.qualification,
              hintText: AppLocalizations.of(context)!.enterQualification,
              items: [
                AppLocalizations.of(context)!.ethpass,
                AppLocalizations.of(context)!.tthpass,
                AppLocalizations.of(context)!.twthpass,
                AppLocalizations.of(context)!.ba,
                AppLocalizations.of(context)!.btech,
                AppLocalizations.of(context)!.bcom,
                AppLocalizations.of(context)!.bca,
                AppLocalizations.of(context)!.bba,
                AppLocalizations.of(context)!.diploma,
                AppLocalizations.of(context)!.other
              ],
            ),
            // Dropdownprefix(
            //   controller: qualification,
            //   hintText: "Enter Graduation",
            //   // dropdownvalue: '10th',
            //   items: const ['8th Pass', '10th Pass', '12th Pass', 'Graduated'],
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.01,
            ),
            Text(
              AppLocalizations.of(context)!.gender,
              style: GoogleFonts.kadwa(
                fontSize: F18(),
                fontWeight: FontWeight.w700,
                color: Colors.black,
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.002,
            ),
            DropdownFieldFull(
              controller: widget.gender,
              hintText: AppLocalizations.of(context)!.selectGender,
              items: [
                AppLocalizations.of(context)!.male,
                AppLocalizations.of(context)!.female,
                AppLocalizations.of(context)!.others
              ],
            ),
          ],
        ),
      ),
    );
  }
}
