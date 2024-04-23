import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

// Post model
class Post {
  final int id;
  final String title;
  final String body;

  Post({required this.id, required this.title, required this.body});

  factory Post.fromJson(Map<String, dynamic> json) => Post(
        id: json['id'] as int,
        title: json['title'] as String,
        body: json['body'] as String,
      );
}

// PostEvent
abstract class PostEvent {}

class FetchPosts extends PostEvent {}

// PostState
abstract class PostState {}

class PostInitial extends PostState {}

class PostLoading extends PostState {}

class PostLoaded extends PostState {
  final List<Post> posts;
  PostLoaded({required this.posts});
}

class PostError extends PostState {}

// PostBloc
class PostBloc extends Bloc<PostEvent, PostState> {
  PostBloc() : super(PostInitial()) {
    on<FetchPosts>(_onFetchPosts);
  }

  Future<void> _onFetchPosts(FetchPosts event, Emitter<PostState> emit) async {
    emit(PostLoading());
    try {
      final response = await http
          .get(Uri.parse('https://jsonplaceholder.typicode.com/posts'));
      if (response.statusCode == 200) {
        final List<dynamic> data = jsonDecode(response.body);
        final List<Post> posts = data
            .map((json) => Post.fromJson(json as Map<String, dynamic>))
            .toList();
        emit(PostLoaded(posts: posts));
      } else {
        emit(PostError());
      }
    } catch (e) {
      emit(PostError());
    }
  }
}

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) => MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(primarySwatch: Colors.blue),
        home: BlocProvider(
          create: (_) => PostBloc()..add(FetchPosts()),
          child: const MyHomePage(),
        ),
      );
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Posts'),
          backgroundColor: Colors.green[200],
        ),
        body: BlocBuilder<PostBloc, PostState>(
          builder: (_, state) {
            if (state is PostInitial || state is PostLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is PostLoaded) {
              return ListView.builder(
                itemCount: state.posts.length,
                itemBuilder: (_, index) {
                  final post = state.posts[index];
                  return Card(
                    color: Colors.cyan[100],
                    child: ListTile(
                      title: Text(post.title),
                      subtitle: Text('Post ID: ${post.id}'),
                      onTap: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => PostDetailsPage(post: post),
                        ),
                      ),
                    ),
                  );
                },
              );
            } else {
              return const Center(child: Text('Something went wrong!'));
            }
          },
        ),
      );
}

class PostDetailsPage extends StatelessWidget {
  final Post post;

  const PostDetailsPage({super.key, required this.post});

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: Text(post.title),
        ),
        body: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Text(post.body),
        ),
      );
}
