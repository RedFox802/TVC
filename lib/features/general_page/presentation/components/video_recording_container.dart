import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class VideoRecordingContainer extends StatelessWidget {
  const VideoRecordingContainer({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 4.h,),
      child: GestureDetector(
        child: Container(
          height: 120.h,
          decoration: BoxDecoration(
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(20.r),
          ),
        ),
      ),
    );
  }
}
