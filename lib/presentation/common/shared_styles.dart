import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../utils/color_constants.dart';

TextStyle get ktsTitleText => GoogleFonts.roboto(
      fontSize: 24,
      height: 0.95,
      fontWeight: FontWeight.w800,
      color: kBlackColor,
    );

TextStyle get ktsBodyRegular => GoogleFonts.roboto(
      fontSize: 15,
      color: kBlackColor,
    );

TextStyle get ktsBodyMedium => GoogleFonts.roboto(
      fontSize: 13,
      color: kBlackColor,
    );

TextStyle get ktsBodySmall => GoogleFonts.roboto(
  fontSize: 11,
  color: kLightBaseColor,
  fontWeight: FontWeight.w400
);

TextStyle get ktsBodyLarge => GoogleFonts.roboto(
      fontSize: 20,
      color: kBlackColor,
    );

TextStyle get ktsCardNumber => GoogleFonts.roboto(
      fontSize: 24,
      color: kLightBaseColor,
      letterSpacing: 5,
      fontWeight: FontWeight.w700,
    );
