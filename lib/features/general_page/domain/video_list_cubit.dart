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
      emit(state.copyWith(videos: entities, loading: false, error: false));
    } catch (e) {
      emit(state.copyWith(error: true, loading: false));
    }
  }

  Future<void> getFilteredVideoList(
      Map<String, String> filters, String sort) async {
    try {
      emit(state.copyWith(loading: true));
      List<VideoRecordingEntity> entities = await _videosFirebaseRepository
          .getFilteredSortedVideos(filters, sort);
      emit(state.copyWith(videos: entities, loading: false, error: false));
    } catch (e) {
      emit(state.copyWith(error: true, loading: false));
    }
  }
}
