import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../controllers/job_interested_controller.dart';

class JobCategoryCard extends StatelessWidget {
  final Map<String, String> data;
  final bool active;
  // ignore: use_key_in_widget_constructors
  JobCategoryCard({required this.data, required this.active});
  final JobInterestedController controller = Get.put(JobInterestedController());
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4, vertical: 2),
      child: Card(
          elevation: 1,
          shadowColor: const Color(0xFF000000),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          color: Colors.transparent,
          child: Container(
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                border: Border.all(color: const Color(0xFFDBDBDB), width: 1)),
            child: Container(
              decoration: BoxDecoration(
                  border: Border.all(
                      color: (active) ? Colors.black : const Color(0xFFDBDBDB),
                      width: 0.2),
                  borderRadius: BorderRadius.circular(20),
                  color: (active) ? Colors.black : Colors.white),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SvgPicture.asset(
                    (active)
                        ? data['active_icon'].toString()
                        : data['inactive_icon'].toString(),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5.0),
                    child: Text(data['title'].toString(),
                        style: TextStyle(
                            fontSize: 16,
                            color: (active) ? Colors.white : Colors.black,
                            fontWeight: FontWeight.w400)),
                  ),
                ],
              ),
            ),
          )),
    );
  }
}
