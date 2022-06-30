import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';
import 'app_text_style.dart';

class AppError{

  static void showError(String text,BuildContext context){
    showToast(
      text,
      context: context,
      textStyle: AppTextStyles.normalW600S14.copyWith(color: Colors.white),
      backgroundColor: Colors.red.shade700,
      animation: StyledToastAnimation.fade,
      reverseAnimation: StyledToastAnimation.fade,
      position: StyledToastPosition.center,
      animDuration: const Duration(seconds: 2),
      duration: const Duration(seconds: 4),
      curve: Curves.elasticOut,
      reverseCurve: Curves.linear,
    );
  }
}