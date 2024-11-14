// lib/data/models/reactions_model.dart
class ReactionsModel {
  final int likes;

  ReactionsModel({required this.likes});

  factory ReactionsModel.fromJson(Map<String, dynamic> json) {
    return ReactionsModel(
      likes: json['likes'],
    );
  }
}
