import 'package:video_player/video_player.dart';
import 'package:flutter/material.dart';
import 'package:chewie/chewie.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/bottomNavigate.wodget.dart';
import 'package:flutter_application_00/app/modules/dashboard/widgets/work.widget.dart';
import 'package:get/get.dart';
// import '../controllers/reels_controller.dart';
class ReelsView extends StatefulWidget {
  const ReelsView({Key? key}) : super(key: key);

  @override
  _VideoAppState createState() => _VideoAppState();
}
class _VideoAppState extends State<ReelsView> {
  // const ReelsView({Key? key}) : super(key: key);
  late VideoPlayerController _controller;
  @override
  void initState() {
    super.initState();

    

    _controller = VideoPlayerController.network(
      'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4',
    )..initialize().then((_) {
        setState(() {});
      });
  }
  Widget build(BuildContext context) {
    @override
    _VideoAppState createState() => _VideoAppState();
    final chewieController = ChewieController(
      videoPlayerController: _controller,
      // autoPlay: true,
      // looping: true,
      aspectRatio: 16 / 9,
      // autoInitialize: true,
      // autoPlay: true,
      // looping: true,
      // showControls: true,
      materialProgressColors: ChewieProgressColors(
        playedColor: Colors.white,
        handleColor: Colors.white,
      ),
      allowFullScreen: true,
    );
    return Scaffold(
      appBar: AppBar(
        leading: Icon(Icons.arrow_back),
        actions: [
          Icon(
            Icons.share,
          ),
          Icon(Icons.notification_add_outlined)
        ],
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                margin: EdgeInsets.only(bottom: 14),
                child: _controller!.value.isInitialized
                    ? AspectRatio(
                        aspectRatio: _controller!.value.aspectRatio,
                        child: Chewie(
                          controller: chewieController,
                        ),
                      )
                    : Container(),
              ),
              Container(
                width: 90,
                height: 25,
                margin: EdgeInsets.only(right: 300),

                // alignment:AlignmentDirectional.topStart,

                decoration: BoxDecoration(
                    color: Colors.yellow,
                    borderRadius: BorderRadius.circular(10)),
                child: Center(child: Text("Civil Work")),
              ),
              Container(
                padding: EdgeInsets.all(14),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Text(
                        "Cement Mortar",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Row(
                      children: [
                        Container(
                          child: Row(children: [
                            Icon(Icons.thumb_up_off_alt_outlined),
                            Text("123")
                          ]),
                        ),
                        Container(
                          child: Row(children: [
                            Icon(Icons.thumb_down_off_alt_outlined),
                            Text("123")
                          ]),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Container(
                  margin: EdgeInsets.only(right: 300),
                  child: Text("12,765 views")),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            child: Image.asset("./assets/image/Mask.png"),
                            backgroundColor: Colors.red,
                          ),
                          Column(
                            children: [
                              Text(
                                "Sanjay Singh",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Electrician Mechanic",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ],
                      ),
                      Image.asset("./assets/image/Line.png"),
                      Container(
                        child: Row(children: [
                          Icon(Icons.calendar_month_outlined),
                          Column(
                            children: [
                              Text(
                                "22-10-2022",
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w400),
                              ),
                              Text(
                                "Last Update",
                                style: TextStyle(
                                    fontSize: 12, fontWeight: FontWeight.w400),
                              )
                            ],
                          )
                        ]),
                      ),
                    ]),
              ),
              Image.asset("./assets/image/LineH.png"),
              Column(children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [work(), work(), work(), work()],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Plaster",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        "6 videos",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [work(), work(), work(), work()],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Concrete Wrok",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        "6 videos",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [work(), work(), work(), work()],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 18),
                      child: Text(
                        "Chokhat",
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w700),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 12),
                      child: Text(
                        "6 videos",
                        style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey),
                      ),
                    )
                  ],
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [work(), work(), work(), work()],
                  ),
                ),
              ])
            ],
          ),
        ),
      ),
      bottomNavigationBar: MyNavigator(),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
}
}
