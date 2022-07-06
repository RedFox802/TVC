import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/features/general_page/domain/entity/broadcast/broadcast_entity.dart';
import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';
import 'package:tv/features/search_page/domain/state/search_state.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(SearchState());

  Future<void> getVideoList() async {
    try {
      emit(state.copyWith(loading: true));
      final entity = VideoRecordingEntity(
        name: 'Видеозапись №1',
        type: 'тип 3',
        id: '125684',
        editingName: 'Редакция №1',
        editingStatus: 'статус ок',
        otkStatus: 'готово',
        creditsStatus: 'готово',
        commerceStatus: 'куплено',
        digitizationStatus: 'отцифровано',
        productionType: 'сериал',
        subtitles: 'проверено',
        registrationDate: '22.06.12',
        responsible: 'Балдова Татьяна Владимировна',
        broadcasts: [
          BroadcastEntity(
              channel: 'ТВЦентр',
              date: '12.07.12',
              time: '12.00',
              readyStatus: 'проверено'),
          BroadcastEntity(
              channel: 'ТВЦентр',
              date: '12.07.12',
              time: '12.00',
              readyStatus: 'проверено'),
          BroadcastEntity(
              channel: 'ТВЦентр',
              date: '12.07.12',
              time: '12.00',
              readyStatus: 'проверено'),
        ],
      );
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(video: entity, loading: false));
    } catch (e) {
      emit(state.copyWith(error: true));
    }
  }

}
