import 'package:nuna_code_challenges/src/data/data_soucres/video_detail_provider.dart';
import 'package:nuna_code_challenges/src/domain/models/video_response.dart';

class VideoDetailRepository{
  VideoDetailDataProvider videoDetailDataProvider;
  VideoDetailRepository({required this.videoDetailDataProvider});
  Future<VideoResponse> fetchVideoDetails(String id) async {
    return videoDetailDataProvider.fetchVideoDetails(id);
  }
}