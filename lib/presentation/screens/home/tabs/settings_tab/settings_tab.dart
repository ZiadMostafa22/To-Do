import 'package:flutter/material.dart';
import 'package:todo/presentation/screens/home/tabs/settings_tab/Widgets/Language_Dropdown.dart';

class SettingsTab extends StatelessWidget {
  SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding:  EdgeInsets.all(20.0),
      // Adjust padding for a centered layout
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 20), // Spacing between title and dropdowns
          LanguageDropdown(),

        ],
      ),
    );
  }

}
