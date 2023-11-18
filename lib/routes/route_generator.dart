import 'package:flutter/material.dart';
import 'package:tentwenty_cinema/features/dashboard/view/screens/dashboard_screen.dart';
import 'package:tentwenty_cinema/features/movieDetails/view/screens/movie_details_screen.dart';
import 'package:tentwenty_cinema/features/watch/view/screens/watch_screen.dart';

import '../features/bottomNavBar/view/screens/bottom_nav_bar_screen.dart';
import 'app_navigation_routes.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    //final args = settings.arguments;
    switch (settings.name) {
      case AppNavRoutes.initialRoute:
        return routeScreen(child: const BottomNavBarScreenUI());
      case AppNavRoutes.dashboardRoute:
        return routeScreen(child: const DashboardScreen());
      case AppNavRoutes.watchRoute:
        return routeScreen(child: const WatchScreen());
      case AppNavRoutes.detailsRoute:
        return routeScreen(child: const DetailScreen());
      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Error'),
        ),
      );
    });
  }

  static Route<dynamic> routeScreen(
      {Widget? child, bool fullScreenDialog = false}) {
    return MaterialPageRoute(
      builder: (context) => child!,
      fullscreenDialog: fullScreenDialog,
    );
  }
}
