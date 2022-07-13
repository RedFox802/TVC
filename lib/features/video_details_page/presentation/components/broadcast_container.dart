import 'package:flutter/material.dart';
import 'package:tv/components/app_text_style.dart';

import '../../../general_page/domain/entity/broadcast/broadcast_entity.dart';

class BroadcastContainer extends StatelessWidget {
  final BroadcastEntity entity;

  const BroadcastContainer({
    Key? key,
    required this.entity,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Column(
              children: [
                Text('Канал', style: AppTextStyles.normal400S12),
                Text(entity.channel, style: AppTextStyles.normal400S12),
              ],
            ),
            Column(
              children: [
                Text(
                  'Дата',
                  style: AppTextStyles.normal400S12,
                ),
                Text(
                  entity.date,
                  style: AppTextStyles.normal400S12,
                ),
              ],
            ),
            Column(
              children: [
                Text('Время', style: AppTextStyles.normal400S12),
                Text(entity.time, style: AppTextStyles.normal400S12),
              ],
            ),
            Column(
              children: [
                Text('Готовность', style: AppTextStyles.normal400S12),
                Text(entity.readyStatus, style: AppTextStyles.normal400S12),
              ],
            ),
          ],
        ),
        const Divider(),
      ],
    );
  }
}
