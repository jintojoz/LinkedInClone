// lib/domain/usecases/get_posts.dart
import 'package:linkedin_clone/domain/entities/comment.dart';

import '../repositories/post_repository.dart';
import '../entities/post.dart';

class GetPosts {
  final PostRepository repository;

  GetPosts(this.repository);

  Future<List<Post>> call() async {
    final postModels = await repository.fetchPosts();
    return postModels
        .map((model) => Post(
              id: model.id,
              author: model.author,
              mediaUrl: model.mediaUrl,
              caption: model.caption,
              reactions: model.reactions,
              userReaction: model.userReaction,
              comments: model.comments
                  .map((c) => Comment(id: c.id, text: c.text))
                  .toList(),
            ))
        .toList();
  }
}
