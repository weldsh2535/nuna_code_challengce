import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  ChewieController? chewieController;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: SizedBox(
        height: MediaQuery.of(context).size.height * .5,
        width: MediaQuery.of(context).size.width,
        child: Chewie(
            controller: ChewieController(
                videoPlayerController: VideoPlayerController.networkUrl(Uri.parse(
                    "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4")),
                autoPlay: true,
                looping: true,
                aspectRatio: 0.5)),
      ),
    );
  }
}
