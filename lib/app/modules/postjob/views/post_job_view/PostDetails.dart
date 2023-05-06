import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/postjob/controllers/postjob_controller.dart';
import 'package:ekinch/app/modules/postjob/views/widget/hire_custom.dart';
import 'package:ekinch/widgets/snack_bar.dart';
import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/listpostjob/views/jobDescription.dart';
import 'package:ekinch/app/modules/postjob/widgets/shortDropDown.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PostDetails extends StatefulWidget {
  const PostDetails({
    Key? key,
  }) : super(key: key);

  @override
  _PostDetailsState createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  int count = 0;
  bool form2 = false;
  bool form3 = false;
  final _formKey = GlobalKey<FormState>();
  PostjobController controller = Get.put(PostjobController());
  @override
  void initState() {
    super.initState();
    controller.capacity1.text = "1";
  }
  // List<Widget> _buildColumn() {
  //   List<Widget> addColumn = [];
  //   for (int i = 0; i < _count; i++) {
  //     addColumn.add(
  //       HireColumn(
  //         expController: controller.exp+i,
  //         gender: controller.gender,
  //         langController: controller.language,
  //         // locController: controller.address,
  //         professionController: controller.profession,
  //         numberController: controller.capacity,
  //         qualification: controller.quali,
  //         salaryEndController: controller.salaryEnd,
  //         salaryStController: controller.salaryStr,
  //       ),
  //     );
  //   }
  //   return addColumn;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitedark,
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //    mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HireColumn(
                expController: controller.exp1,
                gender: controller.gender1,
                langController: controller.language1,
                // locController: controller.address,
                professionController: controller.profession1,
                numberController: controller.capacity1,
                qualification: controller.quali1,
                salaryEndController: controller.salaryEnd1,
                salaryStController: controller.salaryStr1,
              ),
              Visibility(
                visible: form2,
                child: HireColumn(
                  expController: controller.exp2,
                  gender: controller.gender2,
                  langController: controller.language2,
                  // locController: controller.address,
                  professionController: controller.profession2,
                  numberController: controller.capacity2,
                  qualification: controller.quali2,
                  salaryEndController: controller.salaryEnd2,
                  salaryStController: controller.salaryStr2,
                ),
              ),
              Visibility(
                visible: form3,
                child: HireColumn(
                  expController: controller.exp3,
                  gender: controller.gender3,
                  langController: controller.language3,
                  // locController: controller.address,
                  professionController: controller.profession3,
                  numberController: controller.capacity3,
                  qualification: controller.quali3,
                  salaryEndController: controller.salaryEnd3,
                  salaryStController: controller.salaryStr3,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: () {
                    if (count == 0) {
                      
                          setState(() {
                            form2 = true;
                            count++;
                            controller.jobCount.text = count.toString();
                          });
                    } else {
                      if (count == 1) {
                        setState(() {
                          form3 = true;
                          count++;
                          controller.jobCount.text = count.toString();
                        });
                      } else {
                        
                          controller.jobCount.text = count.toString();
                          errorSnackbar("Maximum Number Reached!");
                  
                      }
                    }
                  },
                  child: Text(
                    'Add More +',
                    textAlign: TextAlign.end,
                    style: GoogleFonts.kadwa(
                      fontSize: F20(),
                      fontWeight: FontWeight.w700,
                      color: black,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
