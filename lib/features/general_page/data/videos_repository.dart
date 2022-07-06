import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';

abstract class VideosRepository{
  Stream<List<VideoRecordingEntity>> getAllVideos();
}