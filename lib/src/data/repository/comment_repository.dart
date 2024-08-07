import 'package:nuna_code_challenges/src/data/data_soucres/comment_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/post_provider.dart';
import 'package:nuna_code_challenges/src/domain/models/comment_reponse.dart';
import 'package:nuna_code_challenges/src/domain/models/post_response.dart';

class CommentRepository{
  CommentProvider commentProvider;
  CommentRepository({required this.commentProvider});
  Future<CommentsResponse> fetchComments() async {
    return commentProvider.fetchComments();
  }
}