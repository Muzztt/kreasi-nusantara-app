class Article {
  final String id;
  final String title;
  final String? image;
  final String? content;
  final DateTime createdAt;

  Article({
    required this.id,
    required this.title,
    this.image,
    this.content,
    required this.createdAt,
  });

  factory Article.fromJson(Map<String, dynamic> json) {
    return Article(
      id: json['id'] as String,
      title: json['title'] as String,
      image: json['image'] as String?,
      content: json['content'] as String?,
      createdAt: DateTime.parse(json['created_at'] as String),
    );
  }
}
