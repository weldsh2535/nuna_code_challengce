import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:iconsax/iconsax.dart';
import 'package:nuna_code_challenges/src/core/constants/colors.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_state.dart';

class VideoScreen extends StatefulWidget {
  const VideoScreen({super.key});

  @override
  State<VideoScreen> createState() => _VideoScreenState();
}

class _VideoScreenState extends State<VideoScreen> {
  @override
  void initState() {
    super.initState();
    // Fetch data when the widget is initialized
    BlocProvider.of<VideoBloc>(context).add(FetchDataEvent());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Video List'),
      ),
      body: BlocBuilder<VideoBloc, VideoState>(
        builder: (context, state) {
          if (state is VideoStateLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is VideoStateErrorState) {
            // Show error message if something goes wrong
            return Center(child: Text('Error: ${state.error}'));
          } else if (state is VideoStateSucess) {
            // Display the video tiles when data is successfully fetched
            return SingleChildScrollView(
              child: Column(
                children: state.data.data.map((video) {
                  return ListTile(
                    leading: Icon(
                      Iconsax.video,
                      size: 28,
                      color: TColors.primary,
                    ),
                    title: Text(
                      video.title,
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    subtitle: Text(video.id), // Assuming `id` is a string
                  );
                }).toList(),
              ),
            );
          } else {
            // Default case, if no state matches
            return Center(child: Text('No data available'));
          }
        },
      ),
    );
  }
}
