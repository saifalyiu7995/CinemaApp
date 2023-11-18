import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../theme/app_colors.dart';
import '../../../../utils/app_constant.dart';
import '../../provider/bottom_navbar_provider.dart';
import '../widgets/bottom_nav_bar_tab_widget.dart';

class BottomNavBarScreenUI extends ConsumerStatefulWidget {
  const BottomNavBarScreenUI({super.key});

  @override
  BottomNavBarScreenUIState createState() => BottomNavBarScreenUIState();
}

class BottomNavBarScreenUIState extends ConsumerState<BottomNavBarScreenUI>
    with SingleTickerProviderStateMixin, WidgetsBindingObserver {
  @override
  void initState() {
    ref.read(bottomBavBarProvider).initializeBottomNavData(this);
    super.initState();
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        bottomNavigationBar: ClipRRect(
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(40),
            topRight: Radius.circular(40),
          ),
          child: BottomAppBar(
            color: AppColors.primaryColor,
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                BottomNavBarTab(
                  imgPath: 'dashboard.svg',
                  title: AppConstant.dashboard,
                  onTap: () => ref.read(bottomBavBarProvider).onTabSelect(0),
                  isActive:
                      ref.watch(bottomBavBarProvider).currentTabIndex == 0,
                ),
                BottomNavBarTab(
                  imgPath: 'watch.svg',
                  title: AppConstant.watch,
                  onTap: () => ref.read(bottomBavBarProvider).onTabSelect(1),
                  isActive:
                      ref.watch(bottomBavBarProvider).currentTabIndex == 1,
                ),
                BottomNavBarTab(
                  imgPath: 'media_library.svg',
                  title: AppConstant.mediaLibrary,
                  onTap: () => ref.read(bottomBavBarProvider).onTabSelect(2),
                  isActive:
                      ref.watch(bottomBavBarProvider).currentTabIndex == 2,
                ),
                BottomNavBarTab(
                  imgPath: 'more.svg',
                  title: AppConstant.more,
                  onTap: () => ref.read(bottomBavBarProvider).onTabSelect(3),
                  isActive:
                      ref.watch(bottomBavBarProvider).currentTabIndex == 3,
                ),
              ],
            ),
          ),
        ),
        body: ref
            .read(bottomBavBarProvider)
            .userTabs[ref.watch(bottomBavBarProvider).currentTabIndex!],
      ),
      onWillPop: () => ref.read(bottomBavBarProvider).onWillPop(context),
    );
  }
}
