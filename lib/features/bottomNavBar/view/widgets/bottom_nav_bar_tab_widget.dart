import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../../theme/app_colors.dart';
import '../../../../utils/app_constant.dart';

class BottomNavBarTab extends StatelessWidget {
  final String imgPath;
  final String title;
  final bool isActive;
  final VoidCallback? onTap;

  const BottomNavBarTab({
    required this.imgPath,
    required this.title,
    required this.isActive,
    this.onTap,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Tab(
        iconMargin: const EdgeInsets.symmetric(vertical: 5),
        icon: SvgPicture.asset(
          '${AppConstant.assetImageIcons}$imgPath',
          height: 17,
          color: isActive ? AppColors.whiteColor : AppColors.charcoalColor,
        ),
        child: Text(
          title,
          style: TextStyle(
            color: isActive ? AppColors.whiteColor : AppColors.charcoalColor,
            fontWeight: isActive ? FontWeight.w600 : FontWeight.w500,
            fontSize: 11,
          ),
        ),
      ),
    );
  }
}
