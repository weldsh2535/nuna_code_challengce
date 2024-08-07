class VideoDetailResponse {
  final bool success;
  final VideoDetail data;

  VideoDetailResponse({
    required this.success,
    required this.data,
  });

  factory VideoDetailResponse.fromJson(Map<String, dynamic> json) {
    return VideoDetailResponse(
      success: json['success'],
      data: VideoDetail.fromJson(json['data']),
    );
  }


  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'data': data.toJson(),
    };
  }
}

class VideoDetail {
  final String id;
  final String title;
  final String videoUrl;
  final DateTime createdAt;
  final DateTime updatedAt;

  VideoDetail({
    required this.id,
    required this.title,
    required this.videoUrl,
    required this.createdAt,
    required this.updatedAt,
  });

  factory VideoDetail.fromJson(Map<String, dynamic> json) {
    return VideoDetail(
      id: json['_id'],
      title: json['title'],
      videoUrl: json['videoUrl'],
      createdAt: DateTime.parse(json['createdAt']),
      updatedAt: DateTime.parse(json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      '_id': id,
      'title': title,
      'videoUrl': videoUrl,
      'createdAt': createdAt.toIso8601String(),
      'updatedAt': updatedAt.toIso8601String(),
    };
  }
}
