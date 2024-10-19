import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:todo/core/utils/color_manager.dart';

class AppLightStyles
{
  static TextStyle? appBarTextStyle = GoogleFonts.poppins(
    fontSize: 22,
    fontWeight: FontWeight.w700,
    color: ColorsManeger.black,
  );
  static TextStyle? bottomSheetTitle = GoogleFonts.poppins(
    fontSize: 18,
    fontWeight: FontWeight.w700,
    color: ColorsManeger.black,
  );
  static TextStyle? hintStyle = GoogleFonts.inter(
    fontSize: 15,
    fontWeight: FontWeight.w400,
    color: ColorsManeger.hintColor,
  );
  static TextStyle? dateLabel = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManeger.black,
  );
  static TextStyle? datePicker = GoogleFonts.inter(
    fontSize: 16,
    fontWeight: FontWeight.w700,
    color: ColorsManeger.black,
  );
}