import 'dart:developer';

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

    if (filters.isNotEmpty) {
      for (var filter in filters.keys) {
        filteredVideos =
            filteredVideos.where(filter, isEqualTo: filters[filter]);
      }
    }

    final snapshot = await filteredVideos.get();
    List<VideoRecordingEntity> result = snapshot.docs
        .map((doc) => doc.data())
        .toList()
        .map((json) => VideoRecordingEntity.fromJson(json))
        .toList();

    if (sorts.isNotEmpty) {
      for (var sort in sorts) {
        log(sort);
        switch (sort) {
          case 'name':
            result.sort((a, b) => a.name.compareTo(b.name));
            break;
          case 'type':
            result.sort((a, b) => a.type.compareTo(b.type));
            break;
          case 'editingName':
            result.sort((a, b) => a.editingName.compareTo(b.editingName));
            break;
          case 'otkStatus':
            result.sort((a, b) => a.otkStatus.compareTo(b.otkStatus));
            break;
          case 'creditsStatus':
            result.sort((a, b) => a.creditsStatus.compareTo(b.creditsStatus));
            break;
          case 'digitizationStatus':
            result.sort((a, b) => a.digitizationStatus.compareTo(b.digitizationStatus));
            break;
          case 'subtitles':
            result.sort((a, b) => a.subtitles.compareTo(b.subtitles));
            break;
          case 'commerceStatus':
            result.sort((a, b) => a.commerceStatus.compareTo(b.commerceStatus));
            break;
        }
      }
    }
    return result;
  }

  Future<VideoRecordingEntity> search(String searchString, bool isId) async {
    Query<Map<String, dynamic>> searchedVideo = _fireStore.collection('videos');
    if (isId) {
      searchedVideo =
          searchedVideo.where('id', isEqualTo: searchString).limit(1);
    } else {
      searchedVideo =
          searchedVideo.where('name', isEqualTo: searchString).limit(1);
    }
    final searchedVideoSnapshot = await searchedVideo.get();
    if (searchedVideoSnapshot.docs.isNotEmpty) {
      return VideoRecordingEntity.fromJson(
          searchedVideoSnapshot.docs.first.data());
    } else {
      return const VideoRecordingEntity();
    }
  }
}
