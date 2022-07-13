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
    String sort,
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

    if (sort.isNotEmpty) {
      switch (sort) {
        case 'Название':
          result.sort((a, b) => a.name.compareTo(b.name));
          break;
        case 'Дата регистрации':
          result.sort((a, b) {
            List<String> firstDateArr = a.registrationDate.split('.');
            DateTime firstDate = DateTime(int.parse(firstDateArr[2]),
                int.parse(firstDateArr[1]), int.parse(firstDateArr[0]));

            List<String> secondDateArr = b.registrationDate.split('.');
            DateTime secondDate = DateTime(int.parse(secondDateArr[2]),
                int.parse(secondDateArr[1]), int.parse(secondDateArr[0]));

            return firstDate.compareTo(secondDate);
          });
          break;
        case 'Тип видеозаписи':
          result.sort((a, b) => a.type.compareTo(b.type));
          break;
        case 'Редакция':
          result.sort((a, b) => a.editingName.compareTo(b.editingName));
          break;
        case 'Статус ОТК':
          result.sort((a, b) => a.otkStatus.compareTo(b.otkStatus));
          break;
        case 'Статус титров':
          result.sort((a, b) => a.creditsStatus.compareTo(b.creditsStatus));
          break;
        case 'Статус оцифровки':
          result.sort(
              (a, b) => a.digitizationStatus.compareTo(b.digitizationStatus));
          break;
        case 'Статус субтитров':
          result.sort((a, b) => a.subtitles.compareTo(b.subtitles));
          break;
        case 'Статус комерции':
          result.sort((a, b) => a.commerceStatus.compareTo(b.commerceStatus));
          break;
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
