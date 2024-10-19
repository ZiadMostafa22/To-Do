import 'dart:async';

import 'package:flutter/material.dart';
import 'package:todo/core/utils/assets_manager.dart';
import 'package:todo/core/utils/routes_manager.dart';


class Splashscreen extends StatefulWidget {
  const Splashscreen({super.key});

  @override
  State<Splashscreen> createState() => _SplashscreenState();

}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {      // build the state of the screen  execute the logic before the build
    super.initState();
    Timer(Duration(seconds: 3) , () {
      Navigator.pushReplacementNamed(context, RoutesManager.homeRoute);
    },);
  }
  @override
  Widget build(BuildContext context) {

    return Container(
      child:Image.asset(AssetsManager.splash),
    );
  }
}
