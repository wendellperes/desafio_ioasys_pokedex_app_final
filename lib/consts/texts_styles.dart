import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pekedex_ioasys/consts/colors_type.dart';

//Minha Class Responsavel por Styles de texto
class AppTextStyles {
  static final TextStyle title = GoogleFonts.poppins(
      color: Colors.white,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal);
  static final TextStyle titlePink = GoogleFonts.poppins(
      color: AppColors.pinkBackground,
      fontSize: 24,
      fontWeight: FontWeight.w700,
      fontStyle: FontStyle.normal);

  static final TextStyle titleFavorit = GoogleFonts.poppins(
    color: AppColors.pinkBackground,
    fontSize: 18,
    fontWeight: FontWeight.w500,
    fontStyle: FontStyle.normal,
  );
}
