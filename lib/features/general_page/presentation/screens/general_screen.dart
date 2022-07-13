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
import '../components/app_button_container.dart';

class GeneralScreen extends StatefulWidget {
  const GeneralScreen({Key? key}) : super(key: key);

  @override
  State<GeneralScreen> createState() => _GeneralScreenState();
}

class _GeneralScreenState extends State<GeneralScreen> {
  final SlidingUpPanelController _panelController = SlidingUpPanelController();
  String selectedItem = '';

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.grey.shade50,
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
              ), (route) => false);
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
                          height: 80.h,
                          width: width,
                          decoration: BoxDecoration(
                            color: Colors.red.shade700,
                            borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(20.r),
                              bottomRight: Radius.circular(20.r),
                            ),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              AppSearchTextField(
                                width: width * 0.75,
                              ),
                              AppButtonContainer(
                                icon: Icons.filter_alt,
                                onPressed: () {
                                  if (_panelController.status ==
                                          SlidingUpPanelStatus.expanded ||
                                      _panelController.status ==
                                          SlidingUpPanelStatus.collapsed) {
                                    _panelController.hide();
                                  } else {
                                    _panelController.expand();
                                  }
                                },
                              ),
                            ],
                          ),
                        ),
                        Expanded(
                          child: ListView.builder(
                            itemCount: state.videos.length,
                            padding: EdgeInsets.symmetric(
                                horizontal: 12.w, vertical: 10.h),
                            itemBuilder: (BuildContext context, int index) {
                              return Dismissible(
                                direction: DismissDirection.endToStart,
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
                                child: VideoRecordingContainer(
                                  entity: state.videos[index],
                                ),
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
