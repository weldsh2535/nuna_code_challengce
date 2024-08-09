import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/domain/models/video.dart';
import 'package:video_player/video_player.dart';
import '../../../blocs/video_details/video_details_bloc.dart';
import '../../../blocs/video_details/video_details_event.dart';
import '../../../blocs/video_details/video_details_state.dart';

class VideoDetailScreen extends StatefulWidget {
  final Video videoModel;
  const VideoDetailScreen({super.key, required this.videoModel});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  ChewieController? chewieController;

  @override
  void dispose() {
    chewieController?.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideoDetailsBloc>(context)
        .add(FetchVideoDataEvent(widget.videoModel.id));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoModel.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<VideoDetailsBloc, VideoDetailState>(
                builder: (context, state) {
              if (state is VideoDetailStateLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              // if (state is VideoDetailStateErrorState) {
              //   return Center(child: Text(state.error));
              // }
              if (state is VideoDetailStateErrorState) {
                chewieController = ChewieController(
                    videoPlayerController: VideoPlayerController.network(
                        "https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4"),
                    autoPlay: true,
                    looping: true,
                    aspectRatio: 16 / 9,
                    errorBuilder: (context, errorMessage) {
                      return const Center(child: Text('ERROR'));
                    });

                return Center(
                  child: SizedBox(
                    height: MediaQuery.of(context).size.height * .5,
                    width: MediaQuery.of(context).size.width,
                    child: Chewie(
                      controller: chewieController!,
                    ),
                  ),
                );
              }
              return const SizedBox
                  .shrink(); // Return an empty widget temporarily
            }),
          ],
        ),
      ),
    );
  }
}
