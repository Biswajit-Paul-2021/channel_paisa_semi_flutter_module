import 'package:channel_paisa_semi_flutter_module/constants/app_colors.dart';
import 'package:flutter/material.dart';

class AppTheme {
  final ThemeData _baseTheme = ThemeData();

  ThemeData get theme {
    return _baseTheme.copyWith(
      primaryColor: AppColors.primaryColor,
      accentColor: AppColors.primaryDarkColor,
    );
  }
}
