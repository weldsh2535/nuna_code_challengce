import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:nuna_code_challenges/src/data/repository/comment_repository.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_event.dart';
import 'package:nuna_code_challenges/src/presentation/blocs/comments/comments_state.dart';


class CommentsBloc extends Bloc<CommentsEvent, CommentsState> {
  final CommentRepository commentRepository;
  CommentsBloc({required this.commentRepository}) : super(CommentsStateInital()) {
    on<FetchCommentsDataEvent>(_onFetchData);
  }

  Future<void> _onFetchData(
      FetchCommentsDataEvent event, Emitter<CommentsState> emit) async {
    emit(CommentsStateLoading());
    try {
      emit(CommentsStateLoading());
      final commentResponse = await commentRepository.fetchComments();
      // //print("object  ${response.first}");
      if (commentResponse.comments.isNotEmpty) {
        emit(CommentsStateSucess(commentResponse));
      } else {
        emit(CommentsStateErrorState("Failed to try again"));
      }
    } catch (e) {
      emit(CommentsStateErrorState("Failed to try again"));
    }
  }
}
