import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:nuna_code_challenges/bloc_observer.dart';
import 'package:nuna_code_challenges/navigation_menu.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/comment_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/post_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/product_provider.dart';
import 'package:nuna_code_challenges/src/data/data_soucres/video_provider.dart';
import 'package:nuna_code_challenges/src/data/repository/comment_repository.dart';
import 'package:nuna_code_challenges/src/data/repository/post_reposity.dart';
import 'package:nuna_code_challenges/src/data/repository/product_repository.dart';
import 'package:nuna_code_challenges/src/data/repository/video_repository.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/products/products_bloc.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/videos/video_bloc.dart';

void main() {
  Bloc.observer = AppBlocObserver();
  ProviderScope( child: App(),);
}

class App extends StatelessWidget {
  App({super.key});

  final ProductsRepository productsRepository =
      ProductsRepository(productDataProvider: ProductDataProvider());
  final PostRepository postRepository =
      PostRepository(postDataProvider: PostDataProvider());
  final CommentRepository commentRepository =
      CommentRepository(commentProvider: CommentProvider());
  final VideoRepository videoRepository = VideoRepository(videoDataProvider: VideoDataProvider());

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider<ProductsBloc>(
              create: (context) =>
                  ProductsBloc(productsRepository: productsRepository)),
          BlocProvider<PostsBloc>(
              create: (context) => PostsBloc(postRepository: postRepository)),
          BlocProvider<CommentsBloc>(
              create: (context) =>
                  CommentsBloc(commentRepository: commentRepository)),
          BlocProvider<VideoBloc>(create: (context) => VideoBloc(videoRepository: videoRepository))
        ],
        child: const MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          themeMode: ThemeMode.system,
          // theme: TAppTheme.lightTheme,
          // darkTheme: TAppTheme.darkTheme,
          home: NavigationMenu(),
        ));
  }
}
