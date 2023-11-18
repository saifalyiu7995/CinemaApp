import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../routes/app_navigation.dart';
import '../../../widget/snackBar/snack_bar_widget.dart';
import '../../dashboard/view/screens/dashboard_screen.dart';
import '../../movieDetails/view/screens/movie_details_screen.dart';
import '../../watch/view/screens/watch_screen.dart';

class BottomNavBarProvider extends ChangeNotifier {
  Ref ref;
  BottomNavBarProvider(this.ref) : super();
  List<Widget> _pages = [];
  List<Widget> get pages => _pages;
  DateTime? _currentBackPressTime;
  late TabController? controller;
  int? currentTabIndex = 0;

  void onTabSelect(int index) {
    currentTabIndex = index;
    notifyListeners();
  }

  animateToTabIndex(int index) {
    currentTabIndex = index;
    controller!.animateTo(index,
        duration: const Duration(seconds: 1), curve: Curves.easeOut);
    notifyListeners();
  }

  List<Widget> userTabs = const [
    DashboardScreen(),
    WatchScreen(),
    Scaffold(body: Center(child: Text('Media Library'))),
    Scaffold(body: Center(child: Text('More'))),
  ];
  void initializeBottomNavData(TickerProvider tickerProvider) {
    controller = TabController(
        vsync: tickerProvider, length: userTabs.length, initialIndex: 0);
    _pages = userTabs;
    currentTabIndex = 0;
  }

  Future<bool> onWillPop(BuildContext context) {
    DateTime now = DateTime.now();
    if (AppNavigation.canPop(context)) {
      AppNavigation.goBack();
      return Future.value(false);
    } else {
      if (controller!.index != 0) {
        controller!.index = 0;
        return Future.value(false);
      } else {
        if (_currentBackPressTime == null ||
            now.difference(_currentBackPressTime!) >
                const Duration(seconds: 2)) {
          _currentBackPressTime = now;
          showSnackBar("Double Tap To Exit");
          return Future.value(false);
        }
      }
    }
    return Future.value(true);
  }

  @override
  void dispose() {
    controller!.dispose();
    currentTabIndex = 0;
    super.dispose();
  }
}

final bottomBavBarProvider = ChangeNotifierProvider<BottomNavBarProvider>(
    (ref) => BottomNavBarProvider(ref));
