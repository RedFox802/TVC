import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_text_style.dart';

class AppRedTextButton extends StatelessWidget {
  final String text;
  final void Function() onPressed;
  final double horizontalIndent;
  final double verticalIndent;
  final double height;

  const AppRedTextButton({
    Key? key,
    required this.text,
    required this.onPressed,
    this.horizontalIndent = 20,
    this.verticalIndent = 40,
    this.height = 50,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(
          bottom: verticalIndent.h,
          right: horizontalIndent.w,
          left: horizontalIndent.w),
      child: SizedBox(
        height: height.h,
        width: MediaQuery.of(context).size.width,
        child: ElevatedButton(
          onPressed: onPressed,
          style: ButtonStyle(
            backgroundColor:
                MaterialStateProperty.all<Color>(Colors.red.shade800),
            shape: MaterialStateProperty.all<OutlinedBorder>(
              RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(8.r),
                ),
              ),
            ),
          ),
          child: Text(
            text,
            style: AppTextStyles.normalW600S14.copyWith(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
