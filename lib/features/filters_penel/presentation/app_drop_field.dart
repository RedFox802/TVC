import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../components/app_text_style.dart';

class AppDropField extends StatefulWidget {
  final List<String> itemsList;
  final void Function(String?) onChanged;
  final String description;
  final bool first;

  const AppDropField({
    Key? key,
    required this.itemsList,
    required this.description,
    required this.onChanged,
    this.first = false,
  }) : super(key: key);

  @override
  State<AppDropField> createState() => _AppDropFieldState();
}

class _AppDropFieldState extends State<AppDropField> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 46.h,
          child: DropdownButtonFormField2(
            onSaved: widget.onChanged,
            onChanged: widget.onChanged,
            isExpanded: true,
            iconSize: 30.h,
            buttonHeight: 30.h,
            //buttonPadding: EdgeInsets.symmetric(horizontal: 14.w),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.r),
            ),
            decoration: InputDecoration(
              label: Text(widget.description,style: AppTextStyles.normalW600S14,),
              isDense: true,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(16.r),
              ),
            ),
            hint: Text(
              'Все',
              style: AppTextStyles.normal400S12,
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            items: widget.itemsList
                .map(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: AppTextStyles.normal400S12,
                    ),
                  ),
                )
                .toList(),
          ),
        ),
        SizedBox(height:16.h),
      ],
    );
  }
}
