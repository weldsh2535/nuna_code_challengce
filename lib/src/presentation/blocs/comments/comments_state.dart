
import 'package:nuna_code_challenges/src/domain/models/comment_reponse.dart';

abstract class CommentsState {}

class CommentsStateInital extends CommentsState {}
class CommentsStateLoading extends CommentsState {}
class CommentsStateSucess extends CommentsState {
   final CommentsResponse commentsResponse;
   CommentsStateSucess(this.commentsResponse);
}

class CommentsStateErrorState extends CommentsState {
  final String error;

  CommentsStateErrorState(this.error);
}
