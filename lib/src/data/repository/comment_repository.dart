import 'package:nuna_code_challenges/src/data/data_soucres/comment_provider.dart';
import 'package:nuna_code_challenges/src/domain/models/comment_reponse.dart';

class CommentRepository{
  CommentProvider commentProvider;
  CommentRepository({required this.commentProvider});
  Future<CommentsResponse> fetchComments(int id) async {
    return commentProvider.fetchComments(id);
  }
}