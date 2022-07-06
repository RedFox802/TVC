import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/app_text_style.dart';
import '../../domain/entity/video_recording/video_recording_entity.dart';

class VideoRecordingContainer extends StatelessWidget {
  final VideoRecordingEntity entity;

  const VideoRecordingContainer({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
        vertical: 4.h,
      ),
      child: GestureDetector(
        child: Container(
          height: 260.h,
          decoration: BoxDecoration(
            color: Colors.blueGrey.shade50,
            borderRadius: BorderRadius.circular(20.r),
          ),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 6.h),
                  child: Column(
                    children: [
                      Text(
                        entity.name,
                        style: AppTextStyles.normalW700S16,
                      ),
                      Text(
                        entity.registrationDate,
                        style: AppTextStyles.normalW600S14.copyWith(
                          color: Colors.grey.shade800,
                        ),
                      ),
                    ],
                  ),
                ),
                const Divider(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Тип видеозаписи:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Редакция:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Редакц. статус:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Статус ОТК:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Статус титров:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Статус комерции:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Статус оцифровки:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          'Статус субтитров:',
                          style: AppTextStyles.normalW600S12.copyWith(color: Colors.grey.shade800),
                        ),
                      ],
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          entity.type,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.editingName,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.editingStatus,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.otkStatus,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.creditsStatus,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.commerceStatus,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.digitizationStatus,
                          style: AppTextStyles.normal400S12,
                        ),
                        SizedBox(height: 6.h),
                        Text(
                          entity.subtitles,
                          style: AppTextStyles.normal400S12,
                        ),
                      ],
                    )
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
