// lib/presentation/widgets/post_cell.dart
import 'package:flutter/material.dart';
import '../../domain/entities/post.dart';

class PostCell extends StatelessWidget {
  final Post post;
  final Function onLike;
  final Function onComment;
  final Function onShare;
  final Function onSave;
  final Function onOptions;

  const PostCell({
    super.key,
    required this.post,
    required this.onLike,
    required this.onComment,
    required this.onShare,
    required this.onSave,
    required this.onOptions,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Section
          ListTile(
            leading: CircleAvatar(
              backgroundImage: NetworkImage(post.author.profilePicture),
            ),
            title: Text(post.author.username),
            subtitle: Text(post.caption),
            trailing: IconButton(
              icon: const Icon(Icons.more_vert),
              onPressed: () => onOptions(),
            ),
          ),
          // Media Section
          GestureDetector(
            onTap: () {
              // Handle media tap (e.g., open full media view)
            },
            child: Image.network(
              post.mediaUrl,
              fit: BoxFit.cover,
              height: 200,
              width: double.infinity,
              errorBuilder:
                  (BuildContext context, Object error, StackTrace? stackTrace) {
                return Image.asset(
                    'assets/images/placeholder.png'); // Use a local placeholder image
              },
            ),
          ),
          // Reaction Buttons
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                IconButton(
                  icon: Icon(post.userReaction.liked
                      ? Icons.favorite
                      : Icons.favorite_border),
                  onPressed: () => onLike(),
                ),
                IconButton(
                  icon: const Icon(Icons.comment),
                  onPressed: () => onComment(),
                ),
                IconButton(
                  icon: const Icon(Icons.share),
                  onPressed: () => onShare(),
                ),
                IconButton(
                  icon: Icon(post.userReaction.saved
                      ? Icons.bookmark
                      : Icons.bookmark_border),
                  onPressed: () => onSave(),
                ),
              ],
            ),
          ),
          // Likes Count
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Text('${post.reactions.likes} likes'),
          ),
          // Comments Section
          if (post.comments.isNotEmpty)
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Text(post.comments.first.text),
            ),
          // View all comments button
          TextButton(
            onPressed: () => onComment(),
            child: Text('View all ${post.comments.length} comments'),
          ),
        ],
      ),
    );
  }
}
