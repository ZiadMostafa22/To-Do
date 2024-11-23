import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/app_styles.dart';
import '../../../../../../core/utils/color_manager.dart';

class LanguageDropdown extends StatefulWidget {
  const LanguageDropdown({super.key});

  @override
  State<LanguageDropdown> createState() => _LanguageDropdownState();
}

class _LanguageDropdownState extends State<LanguageDropdown> {
  final List<String> langList = [
    'English',
    'العربية',
  ];

  String selectedLanguage = 'English';

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Language',
          style: AppLightStyles.bottomSheetTitle, // Added style to maintain consistency
        ),
        const SizedBox(height: 10),
        Container(
          width: double.infinity, // Make it responsive
          height: 48,
          padding: const EdgeInsets.symmetric(horizontal: 12.0),
          decoration: BoxDecoration(
            color: ColorsManager.white,
            borderRadius: BorderRadius.circular(8), // Increased for better UI
            border: Border.all(
              color: ColorsManager.blue,
              width: 1.5,
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              value: selectedLanguage,
              isExpanded: true, // Make the dropdown take full width
              icon: Icon(
                Icons.arrow_drop_down,
                color: ColorsManager.blue,
              ),
              onChanged: (String? newValue) {
                if (newValue != null) {  // Add null check to prevent errors
                  setState(() {
                    selectedLanguage = newValue;
                  });
                }
              },
              items: langList.map<DropdownMenuItem<String>>((String language) {
                return DropdownMenuItem<String>(
                  value: language,
                  child: Text(
                    language,
                    style: GoogleFonts.inter(
                      color: language == selectedLanguage
                          ? ColorsManager.blue // Selected color
                          : ColorsManager.black, // Unselected color
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                );
              }).toList(),
            ),
          ),
        ),
      ],
    );
  }
}
