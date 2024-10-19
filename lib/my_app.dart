import 'package:flutter/material.dart';
import 'package:todo/config/theme/app_theme.dart';
import 'package:todo/core/utils/routes_manager.dart';

class myApp extends StatelessWidget {
  const myApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      onGenerateRoute: RoutesManager.router ,
      initialRoute: RoutesManager.splashRoute,
    theme: AppTheme.light,
    );
  }
}
