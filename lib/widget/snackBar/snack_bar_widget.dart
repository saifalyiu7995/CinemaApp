import 'package:flutter/material.dart';

import '../../routes/app_navigation.dart';
import '../../theme/app_colors.dart';

ScaffoldFeatureController<SnackBar, SnackBarClosedReason> showSnackBar(
        String message,
        {Color? color,
        BuildContext? context}) =>
    ScaffoldMessenger.of(context ?? AppNavigation.currentContext).showSnackBar(
        SnackBar(
            behavior: SnackBarBehavior.floating,
            content: Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: AppColors.whiteColor)),
            backgroundColor: color ?? const Color.fromRGBO(245, 104, 123, 1),
            duration: const Duration(seconds: 2)));
