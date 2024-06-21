class Comment {
  final String username;
  final String content;
  final String timeAgo;
  final String repliesCount;
  final String avatarAsset;

  Comment({
    required this.username,
    required this.content,
    required this.timeAgo,
    required this.repliesCount,
    required this.avatarAsset,
  });
}

List<Comment> comments = [
  Comment(
    username: 'celulut',
    content:
        'Saya sangat menikmati fasilitas tempat ini sangat nyaman dan spektakuler',
    timeAgo: '1 month ago',
    repliesCount: 'Lihat 1 balasan',
    avatarAsset: 'assets/images/Oval-1.png',
  ),
  Comment(
    username: 'gusti manik angkeran',
    content: 'Saya sangat mencintai tari kecak, amazing!🔥🔥🔥',
    timeAgo: '1 month ago',
    repliesCount: 'Lihat 1 balasan',
    avatarAsset: 'assets/images/Oval-2.png',
  ),
  Comment(
    username: 'Bara Silver Bali',
    content: 'Sekali seumur hidup main kebali nonton kecak😇😇',
    timeAgo: '1 month ago',
    repliesCount: 'Lihat 1 balasan',
    avatarAsset: 'assets/images/Oval-3.png',
  ),
];
