import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';

import 'full_screen_reels.dart';

class ReelsPageFullScreen extends StatelessWidget {
  ReelsPageFullScreen({super.key, required this.videos});
  late List videos;

  // final List<String> videos = [
  //   'https://d1fbvmt8nzlepc.cloudfront.net/596127My%2BVideo2_360p/596127My%2BVideo2_360p.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-young-mother-with-her-little-daughter-decorating-a-christmas-tree-39745-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-mother-with-her-little-daughter-eating-a-marshmallow-in-nature-39764-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-girl-in-neon-sign-1232-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-winter-fashion-cold-looking-woman-concept-video-39874-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-womans-feet-splashing-in-the-pool-1261-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-a-girl-blowing-a-bubble-gum-at-an-amusement-park-1226-large.mp4',
  //   'https://assets.mixkit.co/videos/preview/mixkit-taking-photos-from-different-angles-of-a-model-34421-large.mp4',
  // ];
  @override
  Widget build(BuildContext context) {
    print("reel page!!!!!!!!!!");
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(color: Colors.black),
        child: Stack(
          children: [
            //We need swiper for every content
            Swiper(
              itemBuilder: (BuildContext context, int index) {
                return ContentScreen(
                  src: videos[index],
                );
              },
              itemCount: videos.length,
              scrollDirection: Axis.vertical,
            ),
            // Padding(
            //   padding: const EdgeInsets.all(8.0),
            //   child: Row(
            //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //     children: [
            //       Text(
            //         'Flutter Shorts',
            //         style: TextStyle(
            //           fontSize: 22,
            //           fontWeight: FontWeight.w600,
            //         ),
            //       ),
            //       Icon(Icons.camera_alt),
            //     ],
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
