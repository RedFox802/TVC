import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tv/features/help_page/presentation/screens/help_screen.dart';

import '../../../../components/app_text_style.dart';
import '../../../../gen/assets.gen.dart';
import '../../domain/login_cubit.dart';
import '../../domain/state/login_state.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

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
          listener: (BuildContext context, LoginState state) {},
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
                  Padding(
                    padding:
                        EdgeInsets.only(bottom: 40.h, right: 20.w, left: 20.w),
                    child: SizedBox(
                      height: 50.h,
                      width: MediaQuery.of(context).size.width,
                      child: ElevatedButton(
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

                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (BuildContext context) {
                                  return HelpScreen();
                                },
                              ),
                              (route) => true,
                            );
                          }
                        },
                        style: ButtonStyle(
                          backgroundColor: MaterialStateProperty.all<Color>(
                              Colors.red.shade800),
                          shape: MaterialStateProperty.all<OutlinedBorder>(
                            RoundedRectangleBorder(
                              borderRadius: BorderRadius.all(
                                Radius.circular(8.r),
                              ),
                            ),
                          ),
                        ),
                        child: Text(
                          "Создать подключение",
                          style: AppTextStyles.normalW600S14
                              .copyWith(color: Colors.white),
                        ),
                      ),
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
