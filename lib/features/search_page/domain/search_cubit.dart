import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/components/app_constants.dart';
import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';
import 'package:tv/features/search_page/domain/state/search_state.dart';

import '../../general_page/data/videos_firebase_repository.dart';

class SearchCubit extends Cubit<SearchState> {
  SearchCubit() : super(const SearchState());

  final VideosFirebaseRepository _videosFirebaseRepository =
      VideosFirebaseRepository();

  Future<void> searchVideoRecording(String searchString) async {
    try {
      emit(state.copyWith(loading: true));
      VideoRecordingEntity entity;
      if (AppConstants.idPattern.hasMatch(searchString)) {
        entity = await _videosFirebaseRepository.search(searchString, true);
      } else {
        entity = await _videosFirebaseRepository.search(searchString, false);
      }
      emit(state.copyWith(video: entity, loading: false));
    } catch (e) {
      emit(state.copyWith(error: true));
    }
  }
}
