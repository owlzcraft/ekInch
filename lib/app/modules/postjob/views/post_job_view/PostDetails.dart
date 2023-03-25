import 'package:ekinch/app/custom_widget/font_size.dart';
import 'package:ekinch/app/modules/postjob/controllers/postjob_controller.dart';
import 'package:ekinch/app/modules/postjob/views/widget/hire_custom.dart';
import 'package:flutter/cupertino.dart';
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
  int _count = 0;
  final formKey = GlobalKey<FormState>();
PostjobController controller= Get.put(PostjobController());
  List<Widget> _buildColumn() {
    List<Widget> addColumn = [];
    for (int i = 0; i < _count; i++) {
      addColumn.add(HireColumn(context,formKey,controller.profession,controller.numberOfPerson,controller.salary,controller.experience,controller.location,controller.language));
    }
    return addColumn;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whitedark,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            //    mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              HireColumn(context,formKey,controller.profession,controller.numberOfPerson,controller.salary,controller.experience,controller.location,controller.language),
              ..._buildColumn(),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                child: InkWell(
                  onTap: () {
                    setState(() {
                      _count++;
                    });
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
