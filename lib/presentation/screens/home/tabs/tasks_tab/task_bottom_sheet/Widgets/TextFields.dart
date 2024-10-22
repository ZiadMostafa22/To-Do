import 'package:flutter/material.dart';

import '../../../../../../../core/utils/app_styles.dart';


class textFieldsWidget extends StatelessWidget {
  String hintText;
   textFieldsWidget({super.key , required this.hintText});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12),
      child: TextFormField(
        decoration: InputDecoration(hintText: hintText,),
        style: AppLightStyles.hintStyle,
      ),
    );
  }
}
