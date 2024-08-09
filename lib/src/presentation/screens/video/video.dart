import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_state.dart';
import 'package:nuna_code_challenges/src/presentation/screens/video/widgets/video_detail.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<VideoBloc>(context).add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video List'),
      ),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoStateLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is VideoStateErrorState) {

            return Center(child: Text('Error: ${state.error}'));
          } else if (state is VideoStateSucess) {

            return SingleChildScrollView(
              child: Column(
                children: state.data.data.map((video) {
                  return ListTile(
                    onTap: () => Get.to(()=> VideoDetailScreen(videoModel: video.id,)),
                    leading: const Icon(
                      Iconsax.video,
                      size: 28,
                      color: TColors.primary,
                    ),
                    title: Text(
                      video.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(video.id),
                  );
                }).toList(),
              ),
            );
          } else {

            return const Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
