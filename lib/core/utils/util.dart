import 'package:flutter/material.dart';

TextTheme createTextTheme(BuildContext context) {
  TextTheme baseTextTheme = Theme.of(context).textTheme;

  // Apply the custom font family
  TextTheme textTheme = baseTextTheme.copyWith(
    displayLarge: baseTextTheme.displayLarge?.copyWith(fontFamily: 'FontRegular'),
    displayMedium: baseTextTheme.displayMedium?.copyWith(fontFamily: 'FontRegular'),
    displaySmall: baseTextTheme.displaySmall?.copyWith(fontFamily: 'FontRegular'),
    headlineLarge: baseTextTheme.headlineLarge?.copyWith(fontFamily: 'FontRegular'),
    headlineMedium: baseTextTheme.headlineMedium?.copyWith(fontFamily: 'FontRegular'),
    headlineSmall: baseTextTheme.headlineSmall?.copyWith(fontFamily: 'FontRegular'),
    titleLarge: baseTextTheme.titleLarge?.copyWith(fontFamily: 'FontRegular'),
    titleMedium: baseTextTheme.titleMedium?.copyWith(fontFamily: 'FontRegular'),
    titleSmall: baseTextTheme.titleSmall?.copyWith(fontFamily: 'FontRegular'),
    bodyLarge: baseTextTheme.bodyLarge?.copyWith(fontFamily: 'FontRegular'),
    bodyMedium: baseTextTheme.bodyMedium?.copyWith(fontFamily: 'FontRegular'),
    bodySmall: baseTextTheme.bodySmall?.copyWith(fontFamily: 'FontRegular'),
    labelLarge: baseTextTheme.labelLarge?.copyWith(fontFamily: 'FontRegular'),
    labelMedium: baseTextTheme.labelMedium?.copyWith(fontFamily: 'FontRegular'),
    labelSmall: baseTextTheme.labelSmall?.copyWith(fontFamily: 'FontRegular'),
  );

  return textTheme;
}
