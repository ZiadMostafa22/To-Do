import 'package:flutter/material.dart';
import 'package:todo/core/utils/app_styles.dart';

class Login extends StatelessWidget {
  const Login({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade900,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),body: Column(
      children: [
        Text('Full Name' , style: AppLightStyles.hintStyle,)
      ],
    ),
    );
  }
}
