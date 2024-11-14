// lib/domain/entities/post.dart
import '../../data/models/user_model.dart';
import 'comment.dart';
import 'user_reaction.dart';
import 'reactions.dart';

class Post {
  final String id;
  final UserModel author;
  final String mediaUrl;
  final String caption;
  final Reactions reactions;
  final UserReaction userReaction;
  final List<Comment> comments;

  Post({
    required this.id,
    required this.author,
    required this.mediaUrl,
    required this.caption,
    required this.reactions,
    required this.userReaction,
    required this.comments,
  });
}
