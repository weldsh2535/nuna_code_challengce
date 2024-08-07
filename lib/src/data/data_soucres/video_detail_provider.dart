import 'dart:convert';
import 'package:nuna_code_challenges/src/core/constants/api_constants.dart';
import "package:http/http.dart" as http;
import 'package:nuna_code_challenges/src/domain/models/video_detail_response.dart';

class VideoDetailDataProvider {
  Future<VideoDetailResponse> fetchVideoDetails(String id) async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.baseAPIUrlVedio}/videos/$id'),headers: {
            "x-apikey-header":"api-access-key-5544"
          });

      if (response.statusCode == 200) {
        return VideoDetailResponse.fromJson(jsonDecode(response.body));
      } else {
        throw Exception(
            'Failed to load products. Status code: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching products: $e');
      throw Exception('Failed to fetch products: $e');
    }
  }
}
