import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tv/features/general_page/domain/state/video_list_state.dart';

class VideoListCubit extends Cubit<VideoListState> {

  VideoListCubit() : super(const VideoListState());

  Future<void> getVideoList() async {
    try {
      emit(state.copyWith(loading: true));
      await Future.delayed(const Duration(seconds: 3));
      emit(state.copyWith(loading: false));
    }
    catch(e){
    emit(state.copyWith(error: true));
    }
  }
}
