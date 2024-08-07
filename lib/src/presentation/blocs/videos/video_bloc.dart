import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/data/repository/video_repository.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_state.dart';


class VideoBloc extends Bloc<VideoEvent, VideoState> {
  final VideoRepository videoRepository;
  VideoBloc({required this.videoRepository}) : super(VideoStateInital()) {
    on<FetchDataEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
      FetchDataEvent event, Emitter<VideoState> emit) async {
    emit(VideoStateLoading());
    try {
      emit(VideoStateLoading());
      final videos = await videoRepository.fetchVideo();
      // //print("object  ${response.first}");
      if (videos.data.isNotEmpty) {
        emit(VideoStateSucess(videos));
      } else {
        emit(VideoStateErrorState("Failed to try again"));
      }
    } catch (e) {
      emit(VideoStateErrorState("Failed to try again"));
    }
  }
}
