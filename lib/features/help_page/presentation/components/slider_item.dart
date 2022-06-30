import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../components/app_text_style.dart';

class SliderItem extends StatelessWidget {
  final String title;
  final String? subTitle;

  const SliderItem({
    Key? key,
    required this.title,
    this.subTitle,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: subTitle != null ? 60.h : 120.h, horizontal: 14.w),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
            title,
            textAlign: TextAlign.center,
            style: AppTextStyles.normalW700S16.copyWith(color: Colors.black),
          ),
          SizedBox(height: 20.h),
          if (subTitle != null)
            Text(
              subTitle!,
              textAlign: TextAlign.center,
              style: AppTextStyles.normalW600S14
                  .copyWith(color: Colors.grey.shade600),
            ),
        ],
      ),
    );
  }
}
