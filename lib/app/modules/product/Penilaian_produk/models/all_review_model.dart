class ReviewAll {
  final String username;
  final String? imageUrl;
  final int rating;
  final String createdAt;
  final String reviewText;

  ReviewAll({
    required this.username,
    required this.imageUrl,
    required this.rating,
    required this.createdAt,
    required this.reviewText,
  });

  factory ReviewAll.fromJson(Map<String, dynamic> json) {
    return ReviewAll(
      username: json['user']['username'],
      imageUrl: json['user']['image_url'],
      rating: json['rating'],
      createdAt: json['created_at'],
      reviewText: json['review'],
    );
  }
}
