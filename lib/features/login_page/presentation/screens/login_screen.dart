import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:tv/components/app_errors_handler.dart';
import 'package:tv/features/help_page/presentation/screens/help_screen.dart';

import '../../../../components/app_text_button.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/login_cubit.dart';
import '../../domain/state/login_state.dart';

class LoginScreen extends StatefulWidget {
  final bool isErrorScreen;

  const LoginScreen({
    Key? key,
    this.isErrorScreen = false,
  }) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  late TextEditingController _serverController;
  late TextEditingController _databaseController;
  late TextEditingController _loginController;
  late TextEditingController _passwordController;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade500,
      body: BlocProvider<LoginCubit>(
        create: (BuildContext context) => LoginCubit()..loadLoginData(),
        child: BlocConsumer<LoginCubit, LoginState>(
          listener: (BuildContext context, LoginState state) {
            if (widget.isErrorScreen || state.error) {
              AppError.showError(
                  'Произошла ошибка! Попробуйте повторно подключиться к базе данных!',
                  context);
            }
            if (state.connect) {
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return const HelpScreen();
                  },
                ),
                (route) => true,
              );
            }
          },
          builder: (BuildContext context, state) {
            _serverController =
                TextEditingController(text: state.loginEntity.server);
            _databaseController =
                TextEditingController(text: state.loginEntity.database);
            _loginController =
                TextEditingController(text: state.loginEntity.login);
            _passwordController =
                TextEditingController(text: state.loginEntity.password);

            return SafeArea(
              child: Stack(
                children: [
                  if (state.loading)
                    SpinKitSpinningLines(color: Colors.red.shade700, size: 100),
                  Opacity(
                    opacity: state.loading ? 0.2 : 1,
                    child: Column(
                      children: [
                        Assets.images.imBigLogo.image(),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.h),
                          child: Column(
                            children: [
                              TextFormField(
                                controller: _serverController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red.shade800),
                                  ),
                                  labelText: 'Введите имя сервера',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _databaseController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red.shade800),
                                  ),
                                  labelText: 'Введите имя базы данных',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                              TextFormField(
                                controller: _loginController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red.shade800),
                                  ),
                                  labelText: 'Введите ваш логин',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                              TextFormField(
                                obscureText: true,
                                controller: _passwordController,
                                decoration: InputDecoration(
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.red.shade800),
                                  ),
                                  labelText: 'Введите ваш пароль',
                                  labelStyle: TextStyle(
                                    color: Colors.grey.shade800,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        AppRedTextButton(
                          text: "Создать подключение",
                          onPressed: () async {
                            if (_serverController.text.isNotEmpty &&
                                _databaseController.text.isNotEmpty &&
                                _loginController.text.isNotEmpty &&
                                _passwordController.text.isNotEmpty) {
                              await context.read<LoginCubit>().saveLoginData(
                                  _serverController.text,
                                  _databaseController.text,
                                  _loginController.text,
                                  _passwordController.text);

                              await context.read<LoginCubit>().loginIn(
                                  _loginController.text,
                                  _passwordController.text);
                            } else {
                              AppError.showError(
                                  'Необходимо заполнить все текстовые поля!',
                                  context);
                            }
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
