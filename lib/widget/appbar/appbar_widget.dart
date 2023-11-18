import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../provider/appbar/appbar_provider.dart';
import '../../theme/app_colors.dart';

class AppBarWidget extends ConsumerWidget implements PreferredSizeWidget {
  const AppBarWidget({
    super.key,
    required this.title,
  });

  final String title;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final TextTheme textTheme = Theme.of(context).textTheme;

    final appbarRead = ref.read(appbarProvider);
    final appbarWatch = ref.watch(appbarProvider);
    return AppBar(
      backgroundColor: AppColors.whiteColor,
      elevation: 0,
      centerTitle: false,
      title: AnimatedContainer(
          duration: const Duration(milliseconds: 1000),
          width: appbarWatch.isSearchActive ? 900.w : 200,
          child: !appbarWatch.isSearchActive
              ? Text(
                  title,
                  style: textTheme.bodyLarge!
                      .copyWith(color: AppColors.blackColor, fontSize: 16),
                )
              : TextFormField(
                  controller: TextEditingController(),
                  style: textTheme.bodySmall!.copyWith(
                    color: AppColors.charcoalColor,
                    fontSize: 14,
                  ),
                  decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColors.backgroundColor, // Grey filled color
                    contentPadding: const EdgeInsets.all(12),
                    hintText: 'TV shows, movies and more...',
                    hintStyle: textTheme.bodySmall!.copyWith(
                      color: AppColors.charcoalColor,
                      fontSize: 14,
                    ),

                    prefixIcon: const Icon(Icons.search,
                        color: AppColors.blackColor), // Search icon
                    suffixIcon: GestureDetector(
                      onTap: () {
                        appbarRead.toggleSearchActive(false);
                      },
                      child:
                          const Icon(Icons.clear, color: AppColors.blackColor),
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(20), // Rounded border
                      borderSide: BorderSide.none,
                    ),
                  ),
                )),
      actions: appbarWatch.isSearchActive
          ? []
          : [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: GestureDetector(
                  onTap: () => appbarRead.toggleSearchActive(true),
                  child: const Icon(
                    Icons.search,
                    color: AppColors.blackColor,
                  ),
                ),
              ),
            ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
