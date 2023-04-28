import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/Job_Application_List/view/job_application_view.dart';
import 'package:ekinch/app/modules/job/jobInterested/views/job_interested_view.dart';
import 'package:ekinch/app/modules/job/job_list/view/jobs_list.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/listpostjob/views/jobs_view.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../controllers/postjob_controller.dart';

class Confirmationjob extends StatefulWidget {
  const Confirmationjob({Key? key, required this.title})
      : super(
          key: key,
        );
  final String title;
  @override
  _ConfirmationjobState createState() => _ConfirmationjobState();
}

class _ConfirmationjobState extends State<Confirmationjob> {
  PostjobController controller = Get.put(PostjobController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(60),
        child: AppBar(
          backgroundColor: Colors.black,
          elevation: 0,
          centerTitle: true,
          leading: InkWell(
              onTap: () {
                Navigator.pop(context);
              },
              child: Icon(Icons.arrow_back)),
          //Icon(Icons.menu),
          title: Text(
            'Post Job',
            style:
                GoogleFonts.kadwa(fontSize: F20(), fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.sp),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Job Post for ${widget.title}',
              style: GoogleFonts.kadwa(fontSize: F18(), color: black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SvgPicture.asset('assets/images/confirmation.svg'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Job has been Post,\n We have procced your\n application',
              textAlign: TextAlign.center,
              style: GoogleFonts.kadwa(
                  height: 1.3, fontSize: F24(), fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Material(
                borderRadius: BorderRadius.circular(10.0),
                color: yellow,
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      controller.AvailableUser();
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => JobsList(userList: [],)));
                    },
                    child: Center(
                      child: Text(
                        'Hire Candidates',
                        style: GoogleFonts.kadwa(
                            color: black,
                            fontSize: F18(),
                            fontWeight: FontWeight.w700),
                      ),
                    ))),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Material(
                borderRadius: BorderRadius.circular(10.0),
                color: black,
                child: MaterialButton(
                    minWidth: MediaQuery.of(context).size.width,
                    onPressed: () {
                      Get.to(JobInterestedView());
                    },
                    child: Center(
                      child: Text(
                        'Create New Job',
                        style: GoogleFonts.kadwa(
                            color: whitedark,
                            fontSize: F18(),
                            fontWeight: FontWeight.w700),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
