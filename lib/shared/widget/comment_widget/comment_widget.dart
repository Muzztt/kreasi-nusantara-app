import 'package:flutter/material.dart';
import 'package:kreasi_nusantara/models/comment_model/comment_model.dart';
import 'package:kreasi_nusantara/shared/theme/theme_config.dart';

class CommentWidget extends StatelessWidget {
  final Comment comment;

  const CommentWidget({super.key, required this.comment});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CircleAvatar(
            backgroundImage: AssetImage(comment.avatarAsset),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  comment.username,
                  style: const TextStyle(fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 5),
                Text(
                  comment.content,
                  style: const TextStyle(
                    fontSize: 14.0,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  comment.timeAgo,
                  style: TextStyle(
                    color: disabledColor,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  comment.repliesCount,
                  style: TextStyle(
                    color: commentTextColor,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
