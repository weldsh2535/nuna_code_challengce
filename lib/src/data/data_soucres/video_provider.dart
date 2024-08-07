import 'dart:convert';
import 'package:nuna_code_challenges/src/core/constants/api_constants.dart';
import "package:http/http.dart" as http;
import 'package:nuna_code_challenges/src/domain/models/video_response.dart';

class VideoDataProvider {
  Future<VideoResponse> fetchVideo() async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.baseAPIUrlVedio}/videos'));

      if (response.statusCode == 200) {
        return VideoResponse.fromJson(jsonDecode(response.body));
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
