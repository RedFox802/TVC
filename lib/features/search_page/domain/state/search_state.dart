import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../general_page/domain/entity/video_recording/video_recording_entity.dart';

part 'search_state.freezed.dart';

@freezed
class SearchState with _$SearchState {
  const factory SearchState({
    @Default(false) final bool error,
    @Default(false) final bool loading,
    @Default(VideoRecordingEntity()) final VideoRecordingEntity video,
  }) = _SearchState;
}
