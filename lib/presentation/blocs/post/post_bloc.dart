// lib/presentation/blocs/post_bloc.dart
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_posts.dart';
import 'post_event.dart';
import 'post_state.dart';

class PostBloc extends Bloc<PostEvent, PostState> {
  final GetPosts getPosts;
  PostBloc(this.getPosts) : super(PostState(posts: [])) {
    on<FetchPosts>((event, emit) async {
      emit(PostState(posts: state.posts, isLoading: true));
      try {
        final posts = await getPosts();
        emit(PostState(posts: posts));
      } catch (e) {
        emit(PostState(posts: state.posts, error: e.toString()));
      }
    });
    on<SavePost>((event, emit) async {
      await getPosts.repository.savePost(event.postId);
      add(FetchPosts()); // Refresh posts after saving
    });
  }
}
