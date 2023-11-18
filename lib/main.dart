import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'routes/app_navigation.dart';
import 'routes/app_navigation_routes.dart';
import 'routes/route_generator.dart';
import 'theme/app_themes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(
      const ProviderScope(
        child: MyApp(),
      ),
    );
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        minTextAdapt: true,
        builder: (_, child) {
          return MaterialApp(
              title: 'TAQA - BTMS',
              theme: AppThemes.lightTheme,
              debugShowCheckedModeBanner: false,
              initialRoute: AppNavRoutes.initialRoute,
              navigatorKey: AppNavigation.navigatorKey,
              onGenerateRoute: RouteGenerator.generateRoute);
        });
  }
}
