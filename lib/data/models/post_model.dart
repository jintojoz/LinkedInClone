// lib/data/models/post_model.dart
import 'package:linkedin_clone/data/models/user_model.dart';

import 'comment_model.dart';
import 'user_reaction_model.dart';
import 'reactions_model.dart';

class PostModel {
  final String id;
  final UserModel author;
  final String mediaUrl;
  final String caption;
  final ReactionsModel reactions;
  final UserReactionModel userReaction;
  final List<CommentModel> comments;

  PostModel({
    required this.id,
    required this.author,
    required this.mediaUrl,
    required this.caption,
    required this.reactions,
    required this.userReaction,
    required this.comments,
  });

  factory PostModel.fromJson(Map<String, dynamic> json) {
    return PostModel(
      id: json['post_id'],
      author: UserModel.fromJson(json['author']),
      mediaUrl: json['media']['url'],
      caption: json['caption'],
      reactions: ReactionsModel.fromJson(json['reactions']),
      userReaction: UserReactionModel.fromJson(json['user_reaction']),
      comments: (json['comments'] as List)
          .map((comment) => CommentModel.fromJson(comment))
          .toList(),
    );
  }
}
