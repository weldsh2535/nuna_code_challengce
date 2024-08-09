import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/data/repository/post_reposity.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/posts/posts_state.dart';


class PostsBloc extends Bloc<PostsEvent, PostsState> {
  final PostRepository postRepository;
  PostsBloc({required this.postRepository}) : super(PostsStateInital()) {
    on<FetchPostEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
      FetchPostEvent event, Emitter<PostsState> emit) async {
    emit(PostsStateLoading());
    try {
      emit(PostsStateLoading());
      final posts = await postRepository.fetchPosts();
      // //print("object  ${response.first}");
      if (posts.posts.isNotEmpty) {
        emit(PostsStateSucess(posts));
      } else {
        emit(PostsStateErrorState("Failed to try again"));
      }
    } catch (e) {
      emit(PostsStateErrorState("Failed to try again"));
    }
  }
}
