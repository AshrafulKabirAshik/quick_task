import "package:flutter/material.dart";
import "../values/app_values.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff005590),
      surfaceTint: Color(0xff0061a3),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff146eb4),
      onPrimaryContainer: Color(0xffe2edff),
      secondary: Color(0xff48607d),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffc3dcfe),
      onSecondaryContainer: Color(0xff49617d),
      tertiary: Color(0xff000000),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff1b1b1b),
      onTertiaryContainer: Color(0xff848484),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff93000a),
      surface: Color(0xfff8f9ff),
      onSurface: Color(0xff191c20),
      onSurfaceVariant: Color(0xff414751),
      outline: Color(0xff717782),
      outlineVariant: Color(0xffc1c7d2),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff2d3135),
      inversePrimary: Color(0xff9ecaff),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9ecaff),
      onPrimaryFixedVariant: Color(0xff00497c),
      secondaryFixed: Color(0xffd1e4ff),
      onSecondaryFixed: Color(0xff001d36),
      secondaryFixedDim: Color(0xffb0c9e9),
      onSecondaryFixedVariant: Color(0xff304864),
      tertiaryFixed: Color(0xffe2e2e2),
      onTertiaryFixed: Color(0xff1b1b1b),
      tertiaryFixedDim: Color(0xffc6c6c6),
      onTertiaryFixedVariant: Color(0xff474747),
      surfaceDim: Color(0xffd8dae0),
      surfaceBright: Color(0xfff8f9ff),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff2f3fa),
      surfaceContainer: Color(0xffeceef4),
      surfaceContainerHigh: Color(0xffe6e8ee),
      surfaceContainerHighest: Color(0xffe0e2e9),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffffffff),
      surfaceTint: Color(0xffffffff),
      onPrimary: Color(0xff003258),
      primaryContainer: Color(0xff146eb4),
      onPrimaryContainer: Color(0xffe2edff),
      secondary: Color(0xffb0c9e9),
      onSecondary: Color(0xff19324c),
      secondaryContainer: Color(0xff304864),
      onSecondaryContainer: Color(0xff9fb7d7),
      tertiary: Color(0xffc6c6c6),
      onTertiary: Color(0xff303030),
      tertiaryContainer: Color(0xff000000),
      onTertiaryContainer: Color(0xff757575),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff101418),
      onSurface: Color(0xffe0e2e9),
      onSurfaceVariant: Color(0xffc1c7d2),
      outline: Color(0xff8b919c),
      outlineVariant: Color(0xff414751),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe0e2e9),
      inversePrimary: Color(0xff0061a3),
      primaryFixed: Color(0xffd1e4ff),
      onPrimaryFixed: Color(0xff001d36),
      primaryFixedDim: Color(0xff9ecaff),
      onPrimaryFixedVariant: Color(0xff00497c),
      secondaryFixed: Color(0xffd1e4ff),
      onSecondaryFixed: Color(0xff001d36),
      secondaryFixedDim: Color(0xffb0c9e9),
      onSecondaryFixedVariant: Color(0xff304864),
      tertiaryFixed: Color(0xffe2e2e2),
      onTertiaryFixed: Color(0xff1b1b1b),
      tertiaryFixedDim: Color(0xffc6c6c6),
      onTertiaryFixedVariant: Color(0xff474747),
      surfaceDim: Color(0xff101418),
      surfaceBright: Color(0xff36393e),
      surfaceContainerLowest: Color(0xff0b0e13),
      surfaceContainerLow: Color(0xff191c20),
      surfaceContainer: Color(0xff1d2024),
      surfaceContainerHigh: Color(0xff272a2f),
      surfaceContainerHighest: Color(0xff32353a),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  ThemeData theme(ColorScheme colorScheme) => ThemeData(
    useMaterial3: true,
    brightness: colorScheme.brightness,
    colorScheme: colorScheme,
    textTheme: textTheme.apply(bodyColor: colorScheme.onSurface, displayColor: colorScheme.onSurface),
    scaffoldBackgroundColor: colorScheme.brightness == Brightness.light ? Colors.white : Color(0xFF1E1F22),
    canvasColor: colorScheme.surface,
    appBarTheme: AppBarTheme(
      backgroundColor: colorScheme.brightness == Brightness.light ? Colors.white : Color(0xFF2B2D30),
      surfaceTintColor: colorScheme.brightness == Brightness.light ? Colors.white : Colors.black,
      actionsIconTheme: IconThemeData(color: colorScheme.brightness == Brightness.light ? Colors.black : Colors.white),
      iconTheme: IconThemeData(color: colorScheme.brightness == Brightness.light ? Colors.black : Colors.white),
      elevation: 6,
      shadowColor: colorScheme.brightness == Brightness.light ? colorScheme.primary.withAlpha(40) : Colors.black,
      titleTextStyle: textTheme.titleLarge?.copyWith(
        color: colorScheme.brightness == Brightness.light ? Colors.black : Colors.white,
        fontFamily: 'FontBold',
      ),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: colorScheme.brightness == Brightness.light ? Colors.black : Colors.white),
    chipTheme: ChipThemeData(
      backgroundColor: colorScheme.brightness == Brightness.light ? Colors.white : Color(0xFF1E1F22),
      deleteIconColor: Colors.red,
      shape: RoundedRectangleBorder(borderRadius: BorderRadiusGeometry.circular(AppValues.childCornerRadius)),
      side: BorderSide(width: 1, color: colorScheme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.white10),
    ),
    dividerTheme: DividerThemeData(color: colorScheme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.white),
    checkboxTheme: CheckboxThemeData(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(AppValues.childCornerRadius)),
      visualDensity: VisualDensity(horizontal: -4, vertical: -4),
      side: BorderSide(color: colorScheme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.white, width: 1),
      fillColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.brightness == Brightness.light ? Colors.black : Colors.white;
        } else {
          return Colors.transparent;
        }
      }),
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: colorScheme.brightness == Brightness.light ? Colors.black : Colors.white,
    ),
    switchTheme: SwitchThemeData(
      trackOutlineColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return Colors.transparent;
        } else {
          return Colors.grey.shade300;
        }
      }),
      trackColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.brightness == Brightness.light ? Colors.black : Colors.grey.shade300;
        } else {
          return Colors.transparent;
        }
      }),
      thumbColor: WidgetStateColor.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return colorScheme.brightness == Brightness.light ? Colors.grey.shade300 : Colors.black;
        } else {
          return colorScheme.brightness == Brightness.light ? Colors.black : Colors.grey.shade300;
        }
      }),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: colorScheme.brightness == Brightness.light ? Colors.black : Color(0xFF26282B),
      selectedLabelStyle: textTheme.labelMedium?.copyWith(fontFamily: 'FontBold'),
      unselectedLabelStyle: textTheme.labelMedium?.copyWith(),
      selectedItemColor: Colors.white,
      unselectedItemColor: Colors.white54,
    ),
  );

  List<ExtendedColor> get extendedColors => [];
}

class ExtendedColor {
  final Color seed, value;
  final ColorFamily light;
  final ColorFamily lightHighContrast;
  final ColorFamily lightMediumContrast;
  final ColorFamily dark;
  final ColorFamily darkHighContrast;
  final ColorFamily darkMediumContrast;

  const ExtendedColor({
    required this.seed,
    required this.value,
    required this.light,
    required this.lightHighContrast,
    required this.lightMediumContrast,
    required this.dark,
    required this.darkHighContrast,
    required this.darkMediumContrast,
  });
}

class ColorFamily {
  const ColorFamily({required this.color, required this.onColor, required this.colorContainer, required this.onColorContainer});

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
