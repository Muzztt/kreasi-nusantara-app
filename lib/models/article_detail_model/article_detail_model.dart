class ArticleDetail {
  final String content;
  final int likesCount;
  final int commentsCount;

  ArticleDetail({
    required this.content,
    required this.likesCount,
    required this.commentsCount,
  });

  factory ArticleDetail.fromJson(Map<String, dynamic> json) {
    return ArticleDetail(
      content: json['content'] as String,
      likesCount: json['likes_count'] as int,
      commentsCount: json['comments_count'] as int,
    );
  }
}
