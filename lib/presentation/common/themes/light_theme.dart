import 'package:flutter/material.dart';

import '../../../utils/color_constants.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    background: kLightBaseColor,
    onBackground: kPrimaryColor,
    primary: kPrimaryColor,
    onPrimary: kLightBaseColor,
    secondary: kSecondaryColor,
    onSecondary: kLightBaseColor,
    error: kWarningRedColor,
    onError: kLightBaseColor,
    surface: kLightSurfaceColor,
    onSurface: kPrimaryColor,
  ),
);