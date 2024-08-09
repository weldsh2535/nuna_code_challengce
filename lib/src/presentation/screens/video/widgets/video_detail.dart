import 'package:chewie/chewie.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:video_player/video_player.dart';
import '../../../blocs/video_details/video_details_bloc.dart';
import '../../../blocs/video_details/video_details_event.dart';
import '../../../blocs/video_details/video_details_state.dart';



class VideoDetailScreen extends StatefulWidget {
  final String videoModel;
  const VideoDetailScreen({super.key,required this.videoModel});

  @override
  State<VideoDetailScreen> createState() => _VideoDetailScreenState();
}

class _VideoDetailScreenState extends State<VideoDetailScreen> {
  late VideoPlayerController _controller;
  bool _isVideoReady = false;
    // late VideoPlayerController videoPlayerController;
  ChewieController? chewieController;
@override
  void dispose() {
    // videoPlayerController.dispose();
    chewieController?.dispose();
    super.dispose();
  }

  // @override
  // void initState() {
  //   super.initState();
  //   BlocProvider.of<VideoBloc>(context).add(FetchSingleVideoEvent(id: widget.videoModel.id));
  // }

//  Future<void> _initializeVideoPlayer(String url) async {
//   try {
//     _controller = VideoPlayerController.network(url)
//       ..initialize().then((_) {
//         setState(() {
//           _isVideoReady = true;
//         });
//       });
//   } on PlatformException catch (e) {
//     print('Platform error: $e');
//   } catch (e) {
//     print('General error: $e');
//   }
// }

 @override
  void initState() {
    super.initState();
    _controller = VideoPlayerController.networkUrl(Uri.parse(
        'https://flutter.github.io/assets-for-api-docs/assets/videos/bee.mp4'))
      ..initialize().then((_) {
        // Ensure the first frame is shown after the video is initialized, even before the play button has been pressed.
        setState(() {});
      });
       BlocProvider.of<VideoDetailsBloc>(context).add(FetchVideoDataEvent(widget.videoModel));
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.videoModel),
      ),
     
      body: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<VideoDetailsBloc, VideoDetailState>(builder: (context, state) {
              if (state is VideoDetailStateLoading) {
                return const Center(child: CircularProgressIndicator());
              }
              if(state is VideoDetailStateErrorState){
                return Center(child: Text(state.error),);
              }
              if (state is VideoDetailStateSucess) {
             return Center(
                child: Stack(
                  alignment: Alignment.center,
                  children: [
                    SizedBox(
                      height: MediaQuery.of(context).size.height * .5,
                      width: MediaQuery.of(context).size.width,
                      child: Chewie(
                              controller: ChewieController(
                                  videoPlayerController:
                                      VideoPlayerController.networkUrl(Uri.parse(state.data.videoUrl)
                                          ),
                                  autoPlay: true,
                                  looping: true,
                                  aspectRatio: 0.5)),
                    ),
                 
                    GestureDetector(
                      onTap: () {
                        if (_controller.value.isPlaying) {
                          _controller.pause();
                        } else {
                          _controller.play();
                        }
                      },
                      child: AnimatedIcon(
                        icon: AnimatedIcons.play_pause,
                        progress: AlwaysStoppedAnimation(
                            _controller.value.isPlaying ? 1.0 : 0.0),
                      ),
                    ),
                  ],
                ),
              );
              }
              return const SizedBox.shrink(); // Return an empty widget temporarily
            }),
          ],
        ),
      ),
    );
  }

 
}
