import 'package:flutter/material.dart';
import 'package:flutter_application_00/app/generated/assets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:video_viewer/video_viewer.dart';
import 'dart:async';
import 'package:helpers/helpers.dart';
import 'package:native_device_orientation/native_device_orientation.dart';
import '../../notication/view/notification_view.dart';

class Movie {
  const Movie(
      {required this.thumbnail,
      required this.title,
      required this.category,
      required this.address});
  final String thumbnail, title, category, address;
}

class VideoViewerOrientation extends StatefulWidget {
  VideoViewerOrientation({
    required this.child,
    required this.controller,
  });

  final Widget child;
  final VideoViewerController controller;

  @override
  _VideoViewerOrientationState createState() => _VideoViewerOrientationState();
}

class _VideoViewerOrientationState extends State<VideoViewerOrientation> {
  late StreamSubscription<NativeDeviceOrientation> _subscription;

  @override
  void dispose() {
    _subscription.cancel();
    super.dispose();
  }

  @override
  void initState() {
    _subscription = NativeDeviceOrientationCommunicator()
        .onOrientationChanged()
        .listen(_onOrientationChanged);
    super.initState();
  }

  void _onOrientationChanged(NativeDeviceOrientation orientation) {
    final bool isFullScreen = widget.controller.isFullScreen;
    final bool isLandscape =
        orientation == NativeDeviceOrientation.landscapeLeft ||
            orientation == NativeDeviceOrientation.landscapeRight;
    if (!isFullScreen && isLandscape) {
      print("OPEN FULLSCREEN");
      widget.controller.openFullScreen();
    } else if (isFullScreen && !isLandscape) {
      print("CLOSING FULLSCREEN");
      widget.controller.closeFullScreen();
      Misc.delayed(300, () {
        Misc.setSystemOverlay(SystemOverlay.values);
        Misc.setSystemOrientation(SystemOrientation.values);
      });
    }
  }

  @override
  Widget build(BuildContext context) => widget.child;
}

class VideoWidget extends StatefulWidget {
  const VideoWidget(this.address);

  final String address;

  @override
  VideoWidgetState createState() => VideoWidgetState();
}

class VideoWidgetState extends State<VideoWidget> {
  final VideoViewerController _controller = VideoViewerController();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        VideoViewerOrientation(
          controller: _controller,
          child: VideoViewer(
            style: VideoViewerStyle(
                progressBarStyle: ProgressBarStyle(
                    bar: BarStyle.progress(dotSize: 1, color: Colors.white)),
                header: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 10.0, horizontal: 10),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Icon(
                          Icons.arrow_back,
                          color: Colors.white,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.share_outlined,
                              color: Colors.white,
                            ),
                            IconButton(
                                onPressed: (() =>
                                    {Get.to(() => NotificationView())}),
                                icon:
                                    SvgPicture.asset(Assets.notification_white))
                          ],
                        )
                      ]),
                ),
                playAndPauseStyle: PlayAndPauseWidgetStyle(
                  background: Colors.transparent,
                  play: const Icon(
                    Icons.play_circle_outline,
                    color: Colors.white,
                    size: 35,
                  ),
                  pause: const Icon(
                    Icons.pause_circle_outline,
                    color: Colors.white,
                    size: 35,
                  ),
                )),
            controller: _controller,
            onFullscreenFixLandscape: false,
            source: {
              widget.address: VideoSource(
                video: VideoPlayerController.network(
                  widget.address,
                ),
                range: Tween<Duration>(
                  begin: const Duration(seconds: 5),
                  end: const Duration(seconds: 25),
                ),
              ),
            },
          ),
        ),
      ],
    );
  }
}
