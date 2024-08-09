abstract class CommentsEvent {}

class FetchCommentsDataEvent extends CommentsEvent {
  final int id;
  FetchCommentsDataEvent(this.id);

}