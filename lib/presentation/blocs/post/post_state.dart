// lib/presentation/blocs/post_state.dart
import '../../../domain/entities/post.dart';

class PostState {
  final List<Post> posts;
  final bool isLoading;
  final String error;

  PostState({required this.posts, this.isLoading = false, this.error = ''});
}
