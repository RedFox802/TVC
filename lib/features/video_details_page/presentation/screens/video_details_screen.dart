import 'package:flutter/material.dart';
import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';

class VideoDetailsScreen extends StatelessWidget {
  final VideoRecordingEntity entity;

  const VideoDetailsScreen({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.red.shade800,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.maybePop(context);
          },
        ),
      ),
      body: Container(),
    );
  }
}
