import 'package:flutter/material.dart';
import 'package:ekinch/app/modules/postjob/Style.dart';
import 'package:ekinch/app/modules/listpostjob/views/jobs_view.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Confirmationjob extends StatefulWidget {
  const Confirmationjob({Key? key}) : super(key: key);

  @override
  _ConfirmationjobState createState() => _ConfirmationjobState();
}

class _ConfirmationjobState extends State<Confirmationjob> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(80),
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
            style: TextStyle(
                fontSize: 20, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
          ),
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(
          left: 15.0,
          right: 15,
          bottom: 15,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            Text(
              'Job Post for Electrician Engineer',
              style: TextStyle(fontSize: 14, fontFamily: 'Kadwa', color: black),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.05,
            ),
            SvgPicture.asset('assets/images/confirmation.svg'),
            //Image.asset('assets/images/confirmation.png'),
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.03,
            ),
            Text(
              'Job has been Post,\n We have procced your\n appication',
              textAlign: TextAlign.center,
              style: TextStyle(
                  fontFamily: 'Kadwa',
                  fontSize: 18,
                  fontWeight: FontWeight.w700),
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
                         Navigator.push(context,
                          MaterialPageRoute(builder: (context) => JobView()));
                    },
                    child: Center(
                      child: Text(
                        'View Job',
                        style: TextStyle(
                            color: black,
                            fontSize: 18,
                            fontFamily: 'Kadwa',
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
                      // Navigator.push(context,
                      //     MaterialPageRoute(builder: (context) => JobView()));
                    },
                    child: Center(
                      child: Text(
                        'Create New Job',
                        style: TextStyle(
                            color: whitedark,
                            fontSize: 18,
                            fontFamily: 'Kadwa',
                            fontWeight: FontWeight.w700),
                      ),
                    ))),
          ],
        ),
      ),
    );
  }
}
