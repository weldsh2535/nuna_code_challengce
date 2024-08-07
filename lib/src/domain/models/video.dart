class Video {
  final String id;
  final String title;
  final DateTime createdAt;

  Video({
    required this.id,
    required this.title,
    required this.createdAt,
  });

  factory Video.fromJson(Map<String, dynamic> json) {
    return Video(
      id: json['_id'],
      title: json['title'],
      createdAt: DateTime.parse(json['createdAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'createdAt': createdAt.toIso8601String(),
    };
  }
}
