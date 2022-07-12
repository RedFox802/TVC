import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';
import 'package:tv/features/general_page/domain/state/video_list_state.dart';

import '../data/videos_firebase_repository.dart';

class VideoListCubit extends Cubit<VideoListState> {
  VideoListCubit() : super(const VideoListState());

  final VideosFirebaseRepository _videosFirebaseRepository =
      VideosFirebaseRepository();

  Future<void> getVideoList() async {
    try {
      emit(state.copyWith(loading: true));
      List<VideoRecordingEntity> entities =
          await _videosFirebaseRepository.getAllVideos();
      emit(state.copyWith(videos: entities, loading: false,error: false));
    } catch (e) {
      emit(state.copyWith(error: true,loading: false));
    }
  }

  Future<void> getSortedVideoList(List<String> sorts) async {
    try {
      emit(state.copyWith(loading: true));
      List<VideoRecordingEntity> entities =
      await _videosFirebaseRepository.getFilteredSortedVideos(state.filters, sorts);
      emit(state.copyWith(videos: entities,sorts: sorts, loading: false,error: false));
    } catch (e) {
      emit(state.copyWith(error: true,loading: false));
    }
  }

  Future<void> getFilteredVideoList(Map<String,String> filters) async {
    try {
      emit(state.copyWith(loading: true));
      List<VideoRecordingEntity> entities =
      await _videosFirebaseRepository.getFilteredSortedVideos(filters, state.sorts);
      emit(state.copyWith(videos: entities,filters: filters, loading: false,error: false));
    } catch (e) {
      emit(state.copyWith(error: true,loading: false));
    }
  }
}
