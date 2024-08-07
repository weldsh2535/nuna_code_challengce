class Pagination {
  final int currentPage;
  final int pageLimit;
  final int totalItems;
  final int totalPages;

  Pagination({
    required this.currentPage,
    required this.pageLimit,
    required this.totalItems,
    required this.totalPages,
  });

  factory Pagination.fromJson(Map<String, dynamic> json) {
    return Pagination(
      currentPage: json['currentPage'],
      pageLimit: json['pageLimit'],
      totalItems: json['totalItems'],
      totalPages: json['totalPages'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'currentPage': currentPage,
      'pageLimit': pageLimit,
      'totalItems': totalItems,
      'totalPages': totalPages,
    };
  }
}
