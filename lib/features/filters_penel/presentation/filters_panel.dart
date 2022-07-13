import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
import 'package:tv/components/app_constants.dart';
import 'package:tv/components/app_text_style.dart';

import '../../../components/app_text_button.dart';
import '../../general_page/domain/state/video_list_state.dart';
import '../../general_page/domain/video_list_cubit.dart';
import 'app_drop_field.dart';

class FiltersPanel extends StatefulWidget {
  final SlidingUpPanelController controller;

  const FiltersPanel({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  State<FiltersPanel> createState() => _FiltersPanelState();
}

class _FiltersPanelState extends State<FiltersPanel> {
  String type = '';
  String editing = '';
  String editingState = '';
  String otpState = '';
  String creditsState = '';
  String commerceState = '';
  String digitalizationState = '';
  String subtitlesState = '';
  String sort = '';

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return BlocBuilder<VideoListCubit, VideoListState>(
      builder: (BuildContext context, state) {
        return SlidingUpPanelWidget(
          onTap: () {},
          panelStatus: SlidingUpPanelStatus.hidden,
          panelController: widget.controller,
          controlHeight: size.height,
          child: Container(
            width: size.width - 68.h,
            color: Colors.white,
            child: Column(
              children: [
                Container(
                  alignment: Alignment.center,
                  color: Colors.red.shade700,
                  height: 80.h,
                  width: size.width,
                  child: Text(
                    'Отфильтровать видеозаписи',
                    style: AppTextStyles.normalW600S14
                        .copyWith(color: Colors.white),
                    textAlign: TextAlign.center,
                  ),
                ),
                Expanded(
                  child: ListView(
                    padding: EdgeInsets.symmetric(horizontal: 14.w),
                    children: [
                      SizedBox(height: 20.h),
                      AppDropField(
                        description: "Тип видеозаписи",
                        first: true,
                        itemsList: AppConstants.videoTypes,
                        onChanged: (String? item) {
                          setState(() {
                            type = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Редакция",
                        itemsList: AppConstants.editions,
                        onChanged: (String? item) {
                          setState(() {
                            editing = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Статус ОТК",
                        itemsList: AppConstants.statuses,
                        onChanged: (String? item) {
                          setState(() {
                            otpState = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Статус титров",
                        itemsList: AppConstants.statuses,
                        onChanged: (String? item) {
                          setState(() {
                            creditsState = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Статус коммерции",
                        itemsList: AppConstants.statuses,
                        onChanged: (String? item) {
                          setState(() {
                            commerceState = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Статус оцифровки",
                        itemsList: AppConstants.digitizationStatuses,
                        onChanged: (String? item) {
                          setState(() {
                            digitalizationState = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Статус субтитров",
                        itemsList: AppConstants.subtitlesStatuses,
                        onChanged: (String? item) {
                          setState(() {
                            subtitlesState = item ?? '';
                          });
                        },
                      ),
                      AppDropField(
                        description: "Выберите поле для сортировки",
                        itemsList: AppConstants.allFields,
                        onChanged: (String? item) {
                          setState(() {
                            sort = item ?? '';
                          });
                        },
                      ),
                      AppRedTextButton(
                        height: 36.h,
                        text: "Применить фильтры",
                        horizontalIndent: 10,
                        verticalIndent: 0,
                        onPressed: () {
                          widget.controller.hide();
                          Map<String, String> filters =
                              AppConstants.createFiltersMap(
                            type,
                            editing,
                            otpState,
                            creditsState,
                            commerceState,
                            digitalizationState,
                            subtitlesState,
                          );
                          context.read<VideoListCubit>().getFilteredVideoList(
                              filters, sort == '-' ? '' : sort);
                        },
                      ),
                      SizedBox(height: 10.h),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
