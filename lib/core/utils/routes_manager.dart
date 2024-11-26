import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/auth/login/login.dart';
import 'package:todo/presentation/screens/auth/register.dart';
import 'package:todo/presentation/screens/home/home_screen.dart';
import 'package:todo/presentation/screens/home/tabs/edit_screen.dart';
import 'package:todo/presentation/screens/home/tabs/settings_tab/settings_tab.dart';
import 'package:todo/presentation/screens/splash_screen/splashScreen.dart';

class RoutesManager {
  static const String homeRoute = '/home';
  static const String splashRoute = '/splash';
  static const String editTask = '/edit';
  static const String settingsTab = '/settings';
  static const String login = '/login';
  static const String register = '/login';

  static Route<dynamic>? router(RouteSettings settings) {
    // Updated return type
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
      case settingsTab:
        return MaterialPageRoute(
          builder: (context) => SettingsTab(),
        );
      case login:
        return MaterialPageRoute(
          builder: (context) => Login(),
        );

        case register:
        return MaterialPageRoute(
          builder: (context) => Register(),
        );
      default:
        return MaterialPageRoute(
          builder: (context) =>
              Scaffold(
                body: Center(child: Text('Page not found!')),
              ),
        );
    }
  }
}
