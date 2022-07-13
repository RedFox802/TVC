import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv/components/app_text_style.dart';
import 'package:tv/features/general_page/presentation/screens/general_screen.dart';
import 'package:tv/features/help_page/presentation/components/slider_item.dart';

import '../../../../gen/assets.gen.dart';

class HelpScreen extends StatelessWidget {
  const HelpScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: OnBoardingSlider(
        totalPage: 4,
        speed: 1,
        headerBackgroundColor: Colors.grey.shade200,
        pageBackgroundColor: Colors.blueGrey.shade50,
        finishButtonText: 'Перейти к базе данных',
        finishButtonColor: Colors.red.shade800,
        finishButtonTextStyle: AppTextStyles.normalW600S14.copyWith(color: Colors.white),
        onFinish: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return const GeneralScreen();
              },
            ),
            (route) => false,
          );
        },
        skipTextButton: Text(
          'Пропустить',
          style: AppTextStyles.normalW700S16,
        ),
        background: [
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Assets.images.imVideo.image(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Assets.images.imSwipe.image(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h),
            child: SizedBox(
              height: MediaQuery.of(context).size.height / 2,
              width: MediaQuery.of(context).size.width,
              child: Assets.images.imFilters.image(),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 10.h,),
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height / 2,
              child: Center(child: Assets.images.imLogo.image()),
            ),
          ),
        ],
        pageBodies: const [
          SliderItem(
            title: 'Главная страница',
            subTitle: 'Перед вами будут элементы базы данных с видео записями',
          ),
          SliderItem(
            title: 'Таблица с эфирами',
            subTitle:
                'Чтобы открыть таблицу достаточно нажать на нужную видеозапись или использовать свайп влево',
          ),
          SliderItem(
            title: 'Фильтры и сортировка',
            subTitle:
                'Для отбора данных, найдите нужный фильтр и выберите значение из предложенных',
          ),
          SliderItem(
            title: 'Приступить к работе',
          ),
        ],
      ),
    );
  }
}
