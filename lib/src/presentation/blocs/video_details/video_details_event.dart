abstract class VideoDetailEvent {}

class FetchVideoDataEvent extends VideoDetailEvent {
  final String id;
  FetchVideoDataEvent(this.id);
}