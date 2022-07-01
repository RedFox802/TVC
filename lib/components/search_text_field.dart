import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'app_input_border.dart';
import 'app_text_style.dart';

class AppSearchTextField extends StatelessWidget {
  final double? width;
  final bool readOnly;
  final TextEditingController? textEditingController;

  const AppSearchTextField({
    Key? key,
    this.readOnly = true,
    this.textEditingController,
    this.width,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50.h,
      width: width,
      child: TextFormField(
        readOnly: readOnly,
        controller: textEditingController,
        onTap: () {
          if (readOnly) {
            // Navigator.pushAndRemoveUntil(
            //   context,
            //   MaterialPageRoute(
            //     builder: (BuildContext context) {
            //       return HelpScreen();
            //     },
            //   ),
            //   (route) => true,
            // );
          }
        },
        decoration: InputDecoration(
          fillColor: Colors.grey.shade300,
          filled: true,
          hintText: 'Введите название или id',
          hintStyle: AppTextStyles.normalW600S12,
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          border: AppInputBorders.appBorder,
          focusedBorder: AppInputBorders.appBorder,
          disabledBorder: AppInputBorders.appBorder,
          focusedErrorBorder: AppInputBorders.appBorder,
          errorBorder: AppInputBorders.appBorder,
          enabledBorder: AppInputBorders.appBorder,
          suffix: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
              color: Colors.grey.shade800,
            ),
          ),
        ),
      ),
    );
  }
}
