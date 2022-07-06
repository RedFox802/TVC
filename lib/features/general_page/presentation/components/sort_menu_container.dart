import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv/components/app_text_button.dart';

import '../../../../components/app_text_style.dart';

class SortMenuContainer extends StatelessWidget {
  final List<String> items;
  final List<String> selectedItems;
  final void Function() onPressed;

  const SortMenuContainer({
    Key? key,
    required this.items,
    required this.selectedItems,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.w),
      child: Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: BoxDecoration(
          color: Colors.grey.shade50,
          borderRadius: BorderRadius.circular(16.r),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 20.h),
          child: Column(
            children: [
              Text(
                'Сортировка параметров',
                style: AppTextStyles.normalW600S14.copyWith(color: Colors.blueGrey.shade700),
              ),
              SizedBox(height: 12.h),
              Container(
                height: 50.h,
                decoration: BoxDecoration(
                  color: Colors.blueGrey.shade50,
                  borderRadius: BorderRadius.circular(16.r),
                ),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2<String>(
                    dropdownDecoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16.r),
                    ),
                    isExpanded: true,
                    hint: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 10.w),
                      child: Align(
                        alignment: AlignmentDirectional.centerStart,
                        child: Text(
                          'Выбрать параметры',
                          style: AppTextStyles.normalW400S14,
                        ),
                      ),
                    ),
                    items: items.map((item) {
                      return DropdownMenuItem<String>(
                        value: item,
                        enabled: false,
                        child: StatefulBuilder(
                          builder: (context, menuSetState) {
                            final isSelected = selectedItems.contains(item);
                            return InkWell(
                              onTap: () {
                                isSelected
                                    ? selectedItems.remove(item)
                                    : selectedItems.add(item);
                                menuSetState(() {});
                              },
                              child: Container(
                                height: double.infinity,
                                padding: EdgeInsets.symmetric(horizontal: 16.w),
                                child: Row(
                                  children: [
                                    isSelected
                                        ? const Icon(Icons.check_box_outlined)
                                        : const Icon(
                                            Icons.check_box_outline_blank),
                                    SizedBox(width: 10.w),
                                    Text(
                                      item,
                                      style: AppTextStyles.normalW400S14,
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                        ),
                      );
                    }).toList(),
                    value: null,
                    onChanged: (value) {},
                    buttonHeight: 40.h,
                    buttonWidth: 300.w,
                    itemHeight: 40.h,
                    itemPadding: EdgeInsets.zero,
                  ),
                ),
              ),
              SizedBox(height: 30.h),
              AppRedTextButton(
                text: 'Отсортировать',
                onPressed: onPressed,
              )
            ],
          ),
        ),
      ),
    );
  }
}
