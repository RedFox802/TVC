import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AppInputBorders {
  static final OutlineInputBorder telephoneInputBorder = OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey.shade50,
      width: 1.w,
    ),
    borderRadius: BorderRadius.circular(8.r),
  );

  static final OutlineInputBorder telephoneErrorInputBorder =
  OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.red,
      width: 1.w,
    ),
    borderRadius: BorderRadius.circular(8.r),
  );
}
