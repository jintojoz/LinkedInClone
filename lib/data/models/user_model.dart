class UserModel {
  final String id;
  final String username;
  final String profilePicture;

  UserModel(
      {required this.id, required this.username, required this.profilePicture});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'],
      username: json['username'],
      profilePicture: json['profile_picture'],
    );
  }
}
