// lib/presentation/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../blocs/post/post_bloc.dart';
import '../blocs/post/post_state.dart';
import '../blocs/post/post_event.dart';
import '../widgets/post_cell.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Video Feed')),
      body: BlocBuilder<PostBloc, PostState>(
        builder: (context, state) {
          if (state.isLoading) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state.error.isNotEmpty) {
            return Center(child: Text('Error: ${state.error}'));
          }
          return ListView.builder(
            itemCount: state.posts.length,
            itemBuilder: (context, index) {
              final post = state.posts[index];
              return PostCell(
                post: post,
                onLike: () {
                  // Handle like action
                  context.read<PostBloc>().add(SavePost(post.id));
                },
                onComment: () {
                  // Handle comment action
                },
                onShare: () {
                  // Handle share action
                },
                onSave: () {
                  // Handle save action
                },
                onOptions: () {
                  // Handle options action
                },
              );
            },
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => context.read<PostBloc>().add(FetchPosts()),
        child: const Icon(Icons.refresh),
      ),
    );
  }
}
