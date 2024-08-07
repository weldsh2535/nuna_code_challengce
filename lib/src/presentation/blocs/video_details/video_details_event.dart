abstract class VideoDetailEvent {}

class FetchDataEvent extends VideoDetailEvent {
  final String id;
  FetchDataEvent(this.id);
}