import 'package:freezed_annotation/freezed_annotation.dart';

part 'broadcast_entity.freezed.dart';
part 'broadcast_entity.g.dart';

@freezed
class BroadcastEntity with _$BroadcastEntity {
  const factory BroadcastEntity({
    @Default('') final String channel,
    @Default('') final String date,
    @Default('') final String time,
    @Default('') final String readyStatus,
  }) = _BroadcastEntity;

  factory BroadcastEntity.fromJson(Map<String, dynamic> json) =>
      _$BroadcastEntityFromJson(json);
}
