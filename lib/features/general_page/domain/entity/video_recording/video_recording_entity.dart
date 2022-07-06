import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:tv/features/general_page/domain/entity/broadcast/broadcast_entity.dart';

part 'video_recording_entity.freezed.dart';

part 'video_recording_entity.g.dart';

@freezed
class VideoRecordingEntity with _$VideoRecordingEntity {
  const factory VideoRecordingEntity({
    @Default('') final String name,
    @Default('') final String type,
    @Default('') final String id,
    @Default('') final String editingName,
    @Default('') final String editingStatus,
    @Default('') final String otkStatus,
    @Default('') final String creditsStatus,
    @Default('') final String commerceStatus,
    @Default('') final String digitizationStatus,
    @Default('') final String subtitles,
    @Default('') final String productionType,
    @Default('') final String registrationDate,
    @Default('') final String responsible,
    @Default([]) final List<BroadcastEntity> broadcasts,
  }) = _VideoRecordingEntity;

  factory VideoRecordingEntity.fromJson(Map<String, dynamic> json) =>
      _$VideoRecordingEntityFromJson(json);
}
