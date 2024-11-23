import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/home/home_screen.dart';
import 'package:todo/presentation/screens/home/tabs/edit_screen.dart';
import 'package:todo/presentation/screens/splash_screen/splashScreen.dart';

class RoutesManager {
  static const String homeRoute = '/home';
  static const String splashRoute = '/splash';
  static const String editTask = '/edit';

  static Route? router(RouteSettings settings) {
    switch (settings.name) {
      case homeRoute:
        return MaterialPageRoute(
          builder: (context) => HomeScreen(),
        );
      case splashRoute:
        return MaterialPageRoute(
          builder: (context) => Splashscreen(),
        );

        case editTask:
        return MaterialPageRoute(
          settings: settings,
          builder: (context) => EditScreen(),
        );
    }
  }
}
