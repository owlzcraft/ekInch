import 'package:ekinch/app/modules/job/form/controllers/job.controller.dart';
import 'package:ekinch/app/modules/postjob/controllers/postjob_controller.dart';
import 'package:ekinch/app/modules/postjob/views/widget/select_skills.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/postjob/views/post_job_view/CompanyDetails.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:flutter_multiselect/flutter_multiselect.dart';

import '../../../../custom_widget/font_size.dart';

class JobDescriptions extends StatefulWidget {
  const JobDescriptions({Key? key}) : super(key: key);

  @override
  _JobDescriptionsState createState() => _JobDescriptionsState();
}

class _JobDescriptionsState extends State<JobDescriptions> {
  TextEditingController _descriptioncontroller = TextEditingController();
  PostjobController controller = Get.put(PostjobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitedark,
      body: Padding(
        padding: EdgeInsets.all(15.0),
        child: ListView(
          shrinkWrap: true,
          // crossAxisAlignment: CrossAxisAlignment.start,
          //    mainAxisAlignment: MainAxisAlignment.start,
          children: [
            
           
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Skils for the Job',
                  style: GoogleFonts.kadwa(
                    fontSize: F18(),
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                ),
                Text(
                  'Added  (3)',
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
            Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                //  SelectSkill(context, controller)
                Text(
                  'Load More +',
                  style: GoogleFonts.kadwa(
                    fontSize: F18(),
                    fontWeight: FontWeight.w700,
                    color: black,
                  ),
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Describe the Job Role',
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
                controller: _descriptioncontroller,
                hintText: 'Please Describe here',
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Job Timing',
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
              controller: controller.jobTime,
              hintText: "Select Job Timming",
              items: [
                '9:00 am - 6:00 pm  |  Mon to Sat',
                '10:00 am - 7:00 pm  |  Mon to Sat',
                '11:00 am - 8:00 pm  |  Mon to Sat',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.02,
            ),
            Text(
              'Interview Timing',
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
              controller: controller.interviewTime,
              hintText: "Select Interview Timming",
              items: [
                '9:00 am - 6:00 pm  |  Mon to Sat',
                '10:00 am - 7:00 pm  |  Mon to Sat',
                '11:00 am - 8:00 pm  |  Mon to Sat',
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
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
