import 'package:nuna_code_challenges/src/data/data_soucres/post_provider.dart';
import 'package:nuna_code_challenges/src/domain/models/post_response.dart';

class PostRepository{
  PostDataProvider postDataProvider;
  PostRepository({required this.postDataProvider});
  Future<PostsResponse> fetchPosts() async {
    return postDataProvider.fetchPosts();
  }
}