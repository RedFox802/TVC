import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/flutter_sliding_up_panel.dart';
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
  List<String> list1 = ['1', '2', '3'];
  String type = '';
  String editing = '';
  String editingState = '';
  String otpState = '';
  String creditsStatus = '';
  String commerceStatus = '';
  String digitalizationStatus = '';
  String subtitlesStatus = '';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<VideoListCubit, VideoListState>(
        builder: (BuildContext context, state) {
      return SlidingUpPanelWidget(
        onTap: () {},
        panelStatus: SlidingUpPanelStatus.hidden,
        panelController: widget.controller,
        controlHeight: MediaQuery.of(context).size.height,
        child: Container(
          width: MediaQuery.of(context).size.width * 0.74.w,
          color: Colors.blueGrey.shade100,
          child: ListView(
            padding: EdgeInsets.symmetric(horizontal: 14.w, vertical: 20.h),
            children: [
              Text(
                'Отфильтровать видеозаписи',
                style: AppTextStyles.normalW600S14
                    .copyWith(color: Colors.blueGrey.shade800),
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 10.h),
              AppDropField(
                description: "Тип видеозаписи",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    type = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Редакция",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    editing = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Редакционный статус",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    editingState = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Статус ОТК",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    otpState = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Статус титров",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    creditsStatus = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Статус коммерции",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    commerceStatus = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Статус оцифровки",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    digitalizationStatus = item ?? '';
                  });
                },
              ),
              AppDropField(
                description: "Статус субтитров",
                itemsList: list1,
                onChanged: (String? item) {
                  setState(() {
                    subtitlesStatus = item ?? '';
                  });
                },
              ),
              SizedBox(height: 20.h),
              AppRedTextButton(
                text: "Применить фильтры",
                indent: 0,
                onPressed: () {
                  log(type);
                },
              ),
            ],
          ),
        ),
      );
    });
  }
}
