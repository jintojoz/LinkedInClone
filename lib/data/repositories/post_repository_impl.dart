import 'package:linkedin_clone/domain/entities/comment.dart';

import '../data_source/api_service.dart';
import '../models/post_model.dart';
import '../../domain/repositories/post_repository.dart';
import '../../domain/entities/post.dart';
import '../../domain/entities/reactions.dart'; // Import the Reactions entity
import '../../domain/entities/user_reaction.dart'; // Import the UserReaction entity

class PostRepositoryImpl implements PostRepository {
  final ApiService apiService;

  PostRepositoryImpl(this.apiService);

  @override
  Future<List<Post>> fetchPosts() async {
    try {
      final response = await apiService.get('getFeed/');
      // Convert List<PostModel> to List<Post>
      return (response as List).map((post) {
        final postModel = PostModel.fromJson(post);
        return Post(
          id: postModel.id,
          author: postModel.author,
          mediaUrl: postModel.mediaUrl,
          caption: postModel.caption,
          reactions: Reactions(
            likes: postModel.reactions.likes,
          ),
          userReaction: UserReaction(
            liked: postModel.userReaction.liked,
            saved: postModel.userReaction.saved,
          ),
          comments: postModel.comments
              .map((c) => Comment(id: c.id, text: c.text))
              .toList(),
        );
      }).toList();
    } catch (e) {
      // Handle the error, log it, or return an empty list
      print('Error fetching posts: $e');
      return []; // Return an empty list on error
    }
  }

  @override
  Future<void> savePost(String postId) async {
    await apiService.post('savePost/', {'postId': postId});
  }
}
