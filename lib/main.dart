// lib/main.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'data/data_source/api_service.dart';
import 'data/repositories/post_repository_impl.dart';
import 'domain/usecases/get_posts.dart';
import 'presentation/blocs/post/post_bloc.dart';
import 'presentation/pages/home_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Video Feed',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BlocProvider(
        create: (context) {
          final apiService = ApiService(
              'https://0826c5e5-a6d4-4ae8-84a1-71e80f96deb9.mock.pstmn.io/');
          final postRepository = PostRepositoryImpl(apiService);
          return PostBloc(GetPosts(postRepository));
        },
        child: HomePage(),
      ),
    );
  }
}
