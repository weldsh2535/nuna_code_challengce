import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/data/repository/video_detail_repository.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/video_details/video_details_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/video_details/video_details_state.dart';


class VideoDetailsBloc extends Bloc<VideoDetailEvent, VideoDetailState> {
  final VideoDetailRepository videoDetailRepository;
  VideoDetailsBloc({required this.videoDetailRepository}) : super(VideoDetailStateInital()) {
    on<FetchVideoDataEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
      FetchVideoDataEvent event, Emitter<VideoDetailState> emit) async {
    emit(VideoDetailStateLoading());
    try {
      emit(VideoDetailStateLoading());
      final videos = await videoDetailRepository.fetchVideoDetails(event.id);
      // //print("object  ${response.first}");
      if (videos.data.id.isNotEmpty) {
        emit(VideoDetailStateSucess(videos.data));
      } else {
        emit(VideoDetailStateErrorState("Failed to try again"));
      }
    } catch (e) {
      emit(VideoDetailStateErrorState("Failed to try again"));
    }
  }
}
