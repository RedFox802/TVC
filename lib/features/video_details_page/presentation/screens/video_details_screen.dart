import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv/components/app_text_style.dart';
import 'package:tv/features/general_page/domain/entity/video_recording/video_recording_entity.dart';

import '../../../general_page/presentation/screens/general_screen.dart';
import '../components/broadcast_container.dart';

class VideoDetailsScreen extends StatelessWidget {
  final VideoRecordingEntity entity;

  const VideoDetailsScreen({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    log(entity.broadcasts.length);
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          entity.name,
          style: AppTextStyles.normalW500S20,
        ),
        backgroundColor: Colors.red.shade800,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            size: 30.w,
          ),
          onPressed: () {
            Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
              builder: (BuildContext context) {
                return const GeneralScreen();
              },
            ), (route) => true);
          },
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Colors.blueGrey.shade50,
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
              child: Column(
                children: [
                  ListTile(
                    title: const Text('ID'),
                    subtitle: Text(entity.id),
                  ),
                  ListTile(
                    title: const Text('Тип производства'),
                    subtitle: Text(entity.productionType),
                  ),
                  ListTile(
                    title: const Text('Дата регистрации'),
                    subtitle: Text(entity.registrationDate),
                  ),
                  ListTile(
                    title: const Text('Ответственный'),
                    subtitle: Text(entity.responsible),
                  )
                ],
              ),
            ),
          ),
          Container(
            alignment: Alignment.center,
            height: 50.h,
            color: Colors.red.shade700,
            child: Text(
              'Эфиры',
              style: AppTextStyles.normalW700S16.copyWith(color: Colors.white),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
            child: ListView(
              children: [
                for (int i = 0; i < entity.broadcasts.length; i++)
                  BroadcastContainer(
                    entity: entity.broadcasts[i],
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
