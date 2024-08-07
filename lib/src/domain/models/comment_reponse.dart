import 'package:nuna_code_challenges/src/domain/models/comment.dart';

class CommentsResponse {
  final List<Comment> comments;
  final int total;
  final int skip;
  final int limit;

  CommentsResponse({
    required this.comments,
    required this.total,
    required this.skip,
    required this.limit,
  });

  factory CommentsResponse.fromJson(Map<String, dynamic> json) {
    var commentsList = json['comments'] as List;
    List<Comment> comments = commentsList.map((i) => Comment.fromJson(i)).toList();

    return CommentsResponse(
      comments: comments,
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'comments': comments.map((e) => e.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}
