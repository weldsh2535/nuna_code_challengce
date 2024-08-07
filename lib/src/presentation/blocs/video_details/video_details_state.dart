
import 'package:nuna_code_challenges/src/domain/models/video_detail_response.dart';

abstract class VideoDetailState {}

class VideoDetailStateInital extends VideoDetailState {}
class VideoDetailStateLoading extends VideoDetailState {}
class VideoDetailStateSucess extends VideoDetailState {
   final VideoDetail data;
   VideoDetailStateSucess(this.data);
}

class VideoDetailStateErrorState extends VideoDetailState {
  final String error;

  VideoDetailStateErrorState(this.error);
}
