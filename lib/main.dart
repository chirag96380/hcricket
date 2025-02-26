import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hcricket/config/routes.dart';
import 'package:hcricket/config/routes_name.dart';
import 'utils/theme/theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(360, 690),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'hcricket',
            theme: AppTheme.lightTheme,
            initialRoute: RoutesName.Splashscreen,
            onGenerateRoute: Routes.genreteRoute,
          );
        });
  }
}
