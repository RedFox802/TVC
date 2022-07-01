import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_sliding_up_panel/sliding_up_panel_widget.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tv/components/search_text_field.dart';
import 'package:tv/features/general_page/domain/state/video_list_state.dart';
import 'package:tv/features/general_page/domain/video_list_cubit.dart';
import 'package:tv/features/general_page/presentation/components/video_recording_container.dart';

import '../../../filters_penel/presentation/filters_panel.dart';
import '../../../login_page/presentation/screens/login_screen.dart';
import '../../../video_details_page/presentation/screens/video_details_screen.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final SlidingUpPanelController _panelController = SlidingUpPanelController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: BlocProvider<VideoListCubit>(
        create: (BuildContext context) => VideoListCubit()..getVideoList(),
        child: BlocConsumer<VideoListCubit, VideoListState>(
          listener: (BuildContext context, VideoListState state) {
            if (state.error) {
              Navigator.pushAndRemoveUntil(context, MaterialPageRoute(
                builder: (BuildContext context) {
                  return const LoginScreen(
                    isErrorScreen: true,
                  );
                },
              ), (route) => true);
            }
          },
          builder: (BuildContext context, state) {
            return Stack(
              children: [
                if (state.loading)
                  SpinKitSpinningLines(color: Colors.red.shade700, size: 100),
                SafeArea(
                  child: Opacity(
                    opacity: state.loading ? 0.2 : 1,
                    child: Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height / 8,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: Colors.grey.shade400,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              AppSearchTextField(
                                width: MediaQuery.of(context).size.width * 0.75,
                              ),
                              Container(
                                width: 50.w,
                                height: 50.w,
                                decoration: BoxDecoration(
                                  color: Colors.grey.shade300,
                                  border: Border.all(color: Colors.white),
                                  borderRadius: BorderRadius.circular(16.r),
                                ),
                                child: IconButton(
                                  icon: const Icon(Icons.filter_alt),
                                  onPressed: () {
                                    log('${_panelController.status}');
                                    if (_panelController.status ==
                                            SlidingUpPanelStatus.expanded ||
                                        _panelController.status ==
                                            SlidingUpPanelStatus.collapsed) {
                                      _panelController.hide();
                                    } else {
                                      _panelController.expand();
                                    }
                                    log('${_panelController.status}');
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.videos.length,
                            padding: EdgeInsets.symmetric(
                                horizontal: 16.w, vertical: 10.h),
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                key: UniqueKey(),
                                onDismissed: (DismissDirection direction) {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          VideoDetailsScreen(
                                        entity: state.videos[index],
                                      ),
                                    ),
                                  );
                                },
                                child: const VideoRecordingContainer(),
                              );
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                FiltersPanel(
                  controller: _panelController,
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
