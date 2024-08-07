import 'package:nuna_code_challenges/src/domain/models/paggation.dart';
import 'package:nuna_code_challenges/src/domain/models/video.dart';

class VideoResponse {
  final bool success;
  final int count;
  final Pagination pagination;
  final List<Video> data;

  VideoResponse({
    required this.success,
    required this.count,
    required this.pagination,
    required this.data,
  });

  factory VideoResponse.fromJson(Map<String, dynamic> json) {
    var dataList = json['data'] as List;
    List<Video> data = dataList.map((i) => Video.fromJson(i)).toList();

    return VideoResponse(
      success: json['success'],
      count: json['count'],
      pagination: Pagination.fromJson(json['pagination']),
      data: data,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'success': success,
      'count': count,
      'pagination': pagination.toJson(),
      'data': data.map((e) => e.toJson()).toList(),
    };
  }
}
