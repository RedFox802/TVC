import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tv/features/search_page/domain/search_cubit.dart';
import 'package:tv/features/search_page/domain/state/search_state.dart';

import '../../../../components/search_text_field.dart';
import '../../../general_page/presentation/components/video_recording_container.dart';
import '../../../login_page/presentation/screens/login_screen.dart';
import '../../../video_details_page/presentation/screens/video_details_screen.dart';

class SearchScreen extends StatefulWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  State<SearchScreen> createState() => _SearchScreenState();
}

class _SearchScreenState extends State<SearchScreen> {
  @override
  Widget build(BuildContext context) {
    final TextEditingController controller = TextEditingController();

    return BlocProvider<SearchCubit>(
      create: (BuildContext context) => SearchCubit(),
      child: BlocConsumer<SearchCubit, SearchState>(
        listener: (BuildContext context, SearchState state) {
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
          return Dismissible(
            onDismissed: (DismissDirection dismissDirection) {
              Navigator.maybePop(context);
            },
            key: UniqueKey(),
            child: Scaffold(
              backgroundColor: Colors.blueGrey.shade50,
              body: SafeArea(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.symmetric(
                          vertical: 16.h, horizontal: 10.w),
                      height: MediaQuery.of(context).size.height / 8,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        color: Colors.red.shade700,
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(20.r),
                          bottomRight: Radius.circular(20.r),
                        ),
                      ),
                      child: AppSearchTextField(
                        readOnly: false,
                        textEditingController: controller,
                        onChanged: (String str) {},
                        onComplete: () {
                          context
                              .read<SearchCubit>()
                              .searchVideoRecording(controller.text);
                        },
                      ),
                    ),
                    Expanded(
                      child: Stack(
                        children: [
                          if (state.loading)
                            SpinKitSpinningLines(
                                color: Colors.red.shade700, size: 100),
                          if (state.video.name != '' && !state.loading)
                            Padding(
                              padding: EdgeInsets.symmetric(
                                  horizontal: 10.w, vertical: 10.h),
                              child: GestureDetector(
                                child: VideoRecordingContainer(
                                    entity: state.video),
                                onTap: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          VideoDetailsScreen(
                                        entity: state.video,
                                      ),
                                    ),
                                  );
                                },
                              ),
                            )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
