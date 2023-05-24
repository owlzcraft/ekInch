import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../postjob/Style.dart';
import '../../postjob/widgets/shortDropDown.dart';

class AllReview extends StatefulWidget {
  const AllReview({Key? key}) : super(key: key);

  @override
  AllReviewState createState() => AllReviewState();
}

class AllReviewState extends State<AllReview> {
  final TextEditingController _searchcontroller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.black,
        elevation: 0,
        centerTitle: true,
        leading: InkWell(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(Icons.arrow_back)),
        //Icon(Icons.menu),
        title: const Text(
          'Reviews',
          style: TextStyle(
              fontSize: 20, fontFamily: 'Kadwa', fontWeight: FontWeight.w700),
        ),
        actions: [
          const Icon(
            Icons.share_outlined,
            size: 20,
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * 0.05,
          )
        ],
      ),
      body: Column(
        children: [
          Stack(
            children: [
              Container(
                height: 50,
                color: black,
              ),
              Padding(
                padding:
                    const EdgeInsets.only(left: 15.0, right: 10, top: 30, bottom: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Expanded(
                      child: TextFeildWhiteBorder(
                        controller: _searchcontroller,
                        hintText: 'Search name or date',
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15, right: 15),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/nidhi_verma.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rahul Verma",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/whitestar.svg",
                                  height: 12),
                            ],
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry.",
                            style: TextStyle(
                                color: greylight,
                                fontSize: 10,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        "1 day ago",
                        style: TextStyle(
                            color: greylightdark,
                            fontSize: 10,
                            fontFamily: 'Kadwa',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15, right: 15),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/nidhi_verma.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rahul Verma",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/whitestar.svg",
                                  height: 12),
                            ],
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry.",
                            style: TextStyle(
                                color: greylight,
                                fontSize: 10,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        "1 day ago",
                        style: TextStyle(
                            color: greylightdark,
                            fontSize: 10,
                            fontFamily: 'Kadwa',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15, right: 15),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/nidhi_verma.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rahul Verma",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/whitestar.svg",
                                  height: 12),
                            ],
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry.",
                            style: TextStyle(
                                color: greylight,
                                fontSize: 10,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        "1 day ago",
                        style: TextStyle(
                            color: greylightdark,
                            fontSize: 10,
                            fontFamily: 'Kadwa',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15.0, top: 15, right: 15),
            child: Card(
                elevation: 0,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15)),
                child: Padding(
                  padding:
                      const EdgeInsets.only(left: 10.0, top: 10, bottom: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Image.asset(
                        'assets/images/nidhi_verma.png',
                        height: 50,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width * 0.02,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            "Rahul Verma",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w700),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/star.svg",
                                  height: 12),
                              SvgPicture.asset("assets/images/whitestar.svg",
                                  height: 12),
                            ],
                          ),
                          Text(
                            "Lorem Ipsum is simply dummy text of the \n printing and typesetting industry.",
                            style: TextStyle(
                                color: greylight,
                                fontSize: 10,
                                fontFamily: 'Kadwa',
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      Text(
                        "1 day ago",
                        style: TextStyle(
                            color: greylightdark,
                            fontSize: 10,
                            fontFamily: 'Kadwa',
                            fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
