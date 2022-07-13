import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv/features/search_page/presentation/screens/search_screen.dart';
import 'app_input_border.dart';
import 'app_text_style.dart';

class AppSearchTextField extends StatelessWidget {
  final double? width;
  final bool readOnly;
  final TextEditingController? textEditingController;
  final void Function()? onComplete;
  final void Function(String)? onChanged;

  const AppSearchTextField({
    Key? key,
    this.readOnly = true,
    this.textEditingController,
    this.width,
    this.onChanged,
    this.onComplete,
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
            Navigator.pushAndRemoveUntil(
              context,
              MaterialPageRoute(
                builder: (BuildContext context) {
                  return const SearchScreen();
                },
              ),
              (route) => true,
            );
          }
        },
        onChanged: onChanged,
        onEditingComplete: onComplete,
        decoration: InputDecoration(
          fillColor: Colors.white,
          filled: true,
          hintText: 'Поиск видеозаписи...',
          hintStyle: AppTextStyles.normalW700S16.copyWith(color: Colors.grey.shade800),
          contentPadding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 12.h),
          border: AppInputBorders.appBorder,
          focusedBorder: AppInputBorders.appBorder,
          disabledBorder: AppInputBorders.appBorder,
          focusedErrorBorder: AppInputBorders.appBorder,
          errorBorder: AppInputBorders.appBorder,
          enabledBorder: AppInputBorders.appBorder,
          suffix: IconButton(
            onPressed: onComplete,
            icon: const Icon(
              Icons.search,
              color: Colors.black,
            ),
          ),
        ),
      ),
    );
  }
}
