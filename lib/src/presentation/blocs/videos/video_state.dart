import 'package:nuna_code_challenges/src/domain/models/video_response.dart';

abstract class VideoState {}

class VideoStateInital extends VideoState {}
class VideoStateLoading extends VideoState {}
class VideoStateSucess extends VideoState {
   final VideoResponse data;
   VideoStateSucess(this.data);
}

class VideoStateErrorState extends VideoState {
  final String error;

  VideoStateErrorState(this.error);
}
