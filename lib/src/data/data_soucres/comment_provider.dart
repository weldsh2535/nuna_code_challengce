import 'dart:convert';
import 'package:nuna_code_challenges/src/core/constants/api_constants.dart';
import 'package:nuna_code_challenges/src/domain/models/comment_reponse.dart';
import "package:http/http.dart" as http;

class CommentProvider {
  Future<CommentsResponse> fetchComments(int id) async {
    try {
      final response =
          await http.get(Uri.parse('${ApiConstants.baseAPIUrl}/comments/post/$id'));

      if (response.statusCode == 200) {
        return CommentsResponse.fromJson(jsonDecode(response.body));
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
