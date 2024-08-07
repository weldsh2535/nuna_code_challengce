
import 'package:nuna_code_challenges/src/domain/models/post_response.dart';

abstract class PostsState {}

class PostsStateInital extends PostsState {}
class PostsStateLoading extends PostsState {}
class PostsStateSucess extends PostsState {
   final PostsResponse data;
   PostsStateSucess(this.data);
}

class PostsStateState extends PostsState {
  final List<PostsResponse> data;

  PostsStateState(this.data);
}

class PostsStateErrorState extends PostsState {
  final String error;

  PostsStateErrorState(this.error);
}
