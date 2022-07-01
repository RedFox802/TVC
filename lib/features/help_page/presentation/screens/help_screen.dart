import 'package:flutter/material.dart';
import 'package:flutter_onboarding_slider/flutter_onboarding_slider.dart';
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
        totalPage: 6,
        speed: 1,
        headerBackgroundColor: Colors.grey.shade200,
        finishButtonText: 'Перейти к базе данных',
        finishButtonColor: Colors.red.shade800,
        finishButtonTextStyle:
            AppTextStyles.normalW600S14.copyWith(color: Colors.white),
        onFinish: () {
          Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(
              builder: (BuildContext context) {
                return GeneralScreen();
              },
            ),
            (route) => true,
          );
        },
        skipTextButton: Text(
          'Пропустить',
          style: AppTextStyles.normalW700S16,
        ),
        background: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Assets.images.imLogo.image(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Assets.images.imLogo.image(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Assets.images.imLogo.image(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Assets.images.imLogo.image(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Assets.images.imLogo.image(),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 2,
            child: Assets.images.imLogo.image(),
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
            title: 'Возвращение к главному экрану',
            subTitle:
                'С помощью спайпа вправо можно закрыть страницу с подробной информацией',
          ),
          SliderItem(
            title: 'Сортировка',
            subTitle:
                'Вы можете сортировать данные по возрастанию и убыванию с помощью данной кнопки',
          ),
          SliderItem(
            title: 'Фильтры',
            subTitle:
                'Для отбора данных, найдите нужный фильтр и выберите нужное значение из предложенных',
          ),
          SliderItem(
            title: 'Приступить к работе',
          ),
        ],
      ),
    );
  }
}
