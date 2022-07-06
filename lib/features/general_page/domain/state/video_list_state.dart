import 'package:freezed_annotation/freezed_annotation.dart';
import '../entity/video_recording/video_recording_entity.dart';

part 'video_list_state.freezed.dart';

@freezed
class VideoListState with _$VideoListState {
  const factory VideoListState({
    @Default(false) final bool error,
    @Default(false) final bool loading,
    @Default([]) final List<VideoRecordingEntity> videos,
    @Default({}) final Map<String,String> filters,
    @Default([]) final List<String> sorts,
  }) = _VideoListState;
}
