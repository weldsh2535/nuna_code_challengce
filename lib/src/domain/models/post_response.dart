import 'package:nuna_code_challenges/src/domain/models/post.dart';

class PostsResponse {
  final List<Post> posts;
  final int total;
  final int skip;
  final int limit;

  PostsResponse({
    required this.posts,
    required this.total,
    required this.skip,
    required this.limit,
  });

  // Factory constructor to create a PostsResponse from JSON
  factory PostsResponse.fromJson(Map<String, dynamic> json) {
    return PostsResponse(
      posts: (json['posts'] as List).map((i) => Post.fromJson(i)).toList(),
      total: json['total'],
      skip: json['skip'],
      limit: json['limit'],
    );
  }

  // Convert PostsResponse to JSON
  Map<String, dynamic> toJson() {
    return {
      'posts': posts.map((post) => post.toJson()).toList(),
      'total': total,
      'skip': skip,
      'limit': limit,
    };
  }
}
