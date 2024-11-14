// lib/presentation/blocs/post_event.dart
abstract class PostEvent {}

class FetchPosts extends PostEvent {}

class SavePost extends PostEvent {
  final String postId;

  SavePost(this.postId);
}
