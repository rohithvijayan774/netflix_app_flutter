part of 'fast_laugh_bloc.dart';

@freezed
class FastLaughEvent with _$FastLaughEvent {
  const factory FastLaughEvent.initializeFastLaugh() = InitializeFastLaugh;

  const factory FastLaughEvent.likeVideos({required int id}) = LikeVideos;
  const factory FastLaughEvent.unlikeVideos({required int id}) = UnlikeVideos;
}
