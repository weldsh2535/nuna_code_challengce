import 'package:nuna_code_challenges/src/data/data_soucres/video_provider.dart';
import 'package:nuna_code_challenges/src/domain/models/video_response.dart';

class VideoRepository{
  VideoDataProvider videoDataProvider;
  VideoRepository({required this.videoDataProvider});
  Future<VideoResponse> fetchVideo() async {
    return videoDataProvider.fetchVideo();
  }
}