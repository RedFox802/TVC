import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';

class VideosFirebaseRepository {
  final _fireStore = FirebaseFirestore.instance;

  Future<List<VideoRecordingEntity>> getAllVideos() async {
    final snapshot = await _fireStore.collection('videos').get();
    return snapshot.docs
        .map((doc) => doc.data())
        .toList()
        .map((json) => VideoRecordingEntity.fromJson(json))
        .toList();
  }

  Future<List<VideoRecordingEntity>> getFilteredSortedVideos(
    Map<String, String> filters,
    List<String> sorts,
  ) async {
    final videos = _fireStore.collection('videos');
    Query<Map<String, dynamic>> filteredVideos = videos;

    if(sorts.isNotEmpty){
      for(var sort in sorts){
        filteredVideos = filteredVideos.orderBy(sort);
      }
    }
    if(filters.isNotEmpty){
      for(var filter in filters.keys){
        filteredVideos = filteredVideos.where(filter, isEqualTo: filters[filter]);
      }
    }

    final snapshot = await filteredVideos.get();

    return snapshot.docs
        .map((doc) => doc.data())
        .toList()
        .map((json) => VideoRecordingEntity.fromJson(json))
        .toList();
  }

  Future<List<VideoRecordingEntity>> getFilteredVideos(
      String type,
      String editing,
      String otkStatus,
      String creditsStatus,
      String commerceStatus,
      String digitizationStatus,
      String subtitlesStatus) async {
    final videos = _fireStore.collection('videos');
    Query<Map<String, dynamic>> filteredVideos = videos;

    if (editing.isNotEmpty && editing != 'все') {
      filteredVideos = filteredVideos.where('editingName', isEqualTo: editing);
    }
    if (otkStatus.isNotEmpty && otkStatus != 'все') {
      filteredVideos = filteredVideos.where('otkStatus', isEqualTo: otkStatus);
    }
    if (creditsStatus.isNotEmpty && creditsStatus != 'все') {
      filteredVideos =
          filteredVideos.where('creditsStatus', isEqualTo: creditsStatus);
    }
    if (commerceStatus.isNotEmpty && commerceStatus != 'все') {
      filteredVideos =
          filteredVideos.where('commerceStatus', isEqualTo: commerceStatus);
    }
    if (digitizationStatus.isNotEmpty && digitizationStatus != 'все') {
      filteredVideos = filteredVideos.where('digitizationStatus',
          isEqualTo: digitizationStatus);
    }
    if (subtitlesStatus.isNotEmpty && subtitlesStatus != 'все') {
      filteredVideos =
          filteredVideos.where('subtitles', isEqualTo: subtitlesStatus);
    }
    if (type.isNotEmpty && type != 'все') {
      filteredVideos = filteredVideos.where('type', isEqualTo: type);
    }

    final snapshot = await filteredVideos.get();

    return snapshot.docs
        .map((doc) => doc.data())
        .toList()
        .map((json) => VideoRecordingEntity.fromJson(json))
        .toList();
  }
}
