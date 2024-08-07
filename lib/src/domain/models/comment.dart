import 'package:nuna_code_challenges/src/domain/models/user.dart';

class Comment {
  final int id;
  final String body;
  final int postId;
  final int likes;
  final User user;

  Comment({
    required this.id,
    required this.body,
    required this.postId,
    required this.likes,
    required this.user,
  });

  factory Comment.fromJson(Map<String, dynamic> json) {
    return Comment(
      id: json['id'],
      body: json['body'],
      postId: json['postId'],
      likes: json['likes'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'body': body,
      'postId': postId,
      'likes': likes,
      'user': user.toJson(),
    };
  }
}
