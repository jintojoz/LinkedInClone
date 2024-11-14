// lib/data/models/user_reaction_model.dart
class UserReactionModel {
  final bool liked;
  final bool saved;

  UserReactionModel({required this.liked, required this.saved});

  factory UserReactionModel.fromJson(Map<String, dynamic> json) {
    return UserReactionModel(
      liked: json['liked'],
      saved: json['saved'],
    );
  }
}
