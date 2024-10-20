import "package:flutter/material.dart";

class MaterialTheme {
  final TextTheme textTheme;

  const MaterialTheme(this.textTheme);

  static ColorScheme lightScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff2d5086),
      surfaceTint: Color(0xff3d5e96),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5475ae),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff183e72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff406198),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff595e6b),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffeff2ff),
      onTertiaryContainer: Color(0xff4c515d),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff444748),
      outline: Color(0xff747878),
      outlineVariant: Color(0xffc4c7c8),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff22467c),
      secondaryFixed: Color(0xffd7e3ff),
      onSecondaryFixed: Color(0xff001b3e),
      secondaryFixedDim: Color(0xffaac7ff),
      onSecondaryFixedVariant: Color(0xff23467c),
      tertiaryFixed: Color(0xffdee2f1),
      onTertiaryFixed: Color(0xff171c26),
      tertiaryFixedDim: Color(0xffc2c6d5),
      onTertiaryFixedVariant: Color(0xff424752),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData light() {
    return theme(lightScheme());
  }

  static ColorScheme lightMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff1d4278),
      surfaceTint: Color(0xff3d5e96),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff5475ae),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff183e72),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff406198),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff3e434e),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff707481),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff8c0009),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffda342e),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff1c1b1b),
      onSurfaceVariant: Color(0xff404344),
      outline: Color(0xff5c6060),
      outlineVariant: Color(0xff787b7c),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffaac7ff),
      primaryFixed: Color(0xff5475ae),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff3a5c93),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff5475ad),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff3b5c93),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff707481),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff575c68),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightMediumContrast() {
    return theme(lightMediumContrastScheme());
  }

  static ColorScheme lightHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.light,
      primary: Color(0xff00214a),
      surfaceTint: Color(0xff3d5e96),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xff1d4278),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xff00214a),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xff1e4278),
      onSecondaryContainer: Color(0xffffffff),
      tertiary: Color(0xff1d222d),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xff3e434e),
      onTertiaryContainer: Color(0xffffffff),
      error: Color(0xff4e0002),
      onError: Color(0xffffffff),
      errorContainer: Color(0xff8c0009),
      onErrorContainer: Color(0xffffffff),
      surface: Color(0xfffdf8f8),
      onSurface: Color(0xff000000),
      onSurfaceVariant: Color(0xff212525),
      outline: Color(0xff404344),
      outlineVariant: Color(0xff404344),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xff313030),
      inversePrimary: Color(0xffe5ecff),
      primaryFixed: Color(0xff1d4278),
      onPrimaryFixed: Color(0xffffffff),
      primaryFixedDim: Color(0xff002c5e),
      onPrimaryFixedVariant: Color(0xffffffff),
      secondaryFixed: Color(0xff1e4278),
      onSecondaryFixed: Color(0xffffffff),
      secondaryFixedDim: Color(0xff002c5e),
      onSecondaryFixedVariant: Color(0xffffffff),
      tertiaryFixed: Color(0xff3e434e),
      onTertiaryFixed: Color(0xffffffff),
      tertiaryFixedDim: Color(0xff282d38),
      onTertiaryFixedVariant: Color(0xffffffff),
      surfaceDim: Color(0xffddd9d8),
      surfaceBright: Color(0xfffdf8f8),
      surfaceContainerLowest: Color(0xffffffff),
      surfaceContainerLow: Color(0xfff7f3f2),
      surfaceContainer: Color(0xfff1edec),
      surfaceContainerHigh: Color(0xffebe7e7),
      surfaceContainerHighest: Color(0xffe5e2e1),
    );
  }

  ThemeData lightHighContrast() {
    return theme(lightHighContrastScheme());
  }

  static ColorScheme darkScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffaac7ff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff002f64),
      primaryContainer: Color(0xff4d6ea6),
      onPrimaryContainer: Color(0xffffffff),
      secondary: Color(0xffaac7ff),
      onSecondary: Color(0xff022f64),
      secondaryContainer: Color(0xff25487d),
      onSecondaryContainer: Color(0xffd7e3ff),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff2b303b),
      tertiaryContainer: Color(0xffd0d4e3),
      onTertiaryContainer: Color(0xff3a3f4b),
      error: Color(0xffffb4ab),
      onError: Color(0xff690005),
      errorContainer: Color(0xff93000a),
      onErrorContainer: Color(0xffffdad6),
      surface: Color(0xff141313),
      onSurface: Color(0xffe5e2e1),
      onSurfaceVariant: Color(0xffc4c7c8),
      outline: Color(0xff8e9192),
      outlineVariant: Color(0xff444748),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff3d5e96),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff001b3e),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff22467c),
      secondaryFixed: Color(0xffd7e3ff),
      onSecondaryFixed: Color(0xff001b3e),
      secondaryFixedDim: Color(0xffaac7ff),
      onSecondaryFixedVariant: Color(0xff23467c),
      tertiaryFixed: Color(0xffdee2f1),
      onTertiaryFixed: Color(0xff171c26),
      tertiaryFixedDim: Color(0xffc2c6d5),
      onTertiaryFixedVariant: Color(0xff424752),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData dark() {
    return theme(darkScheme());
  }

  static ColorScheme darkMediumContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xffb1cbff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff001634),
      primaryContainer: Color(0xff7091cc),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xffb1cbff),
      onSecondary: Color(0xff001635),
      secondaryContainer: Color(0xff7191cb),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff2b303b),
      tertiaryContainer: Color(0xffd0d4e3),
      onTertiaryContainer: Color(0xff1a1f2a),
      error: Color(0xffffbab1),
      onError: Color(0xff370001),
      errorContainer: Color(0xffff5449),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xfffefaf9),
      onSurfaceVariant: Color(0xffc8cbcc),
      outline: Color(0xffa0a3a4),
      outlineVariant: Color(0xff808484),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff24487e),
      primaryFixed: Color(0xffd6e3ff),
      onPrimaryFixed: Color(0xff00112b),
      primaryFixedDim: Color(0xffaac7ff),
      onPrimaryFixedVariant: Color(0xff0a356b),
      secondaryFixed: Color(0xffd7e3ff),
      onSecondaryFixed: Color(0xff00112b),
      secondaryFixedDim: Color(0xffaac7ff),
      onSecondaryFixedVariant: Color(0xff0c356a),
      tertiaryFixed: Color(0xffdee2f1),
      onTertiaryFixed: Color(0xff0c111b),
      tertiaryFixedDim: Color(0xffc2c6d5),
      onTertiaryFixedVariant: Color(0xff313641),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkMediumContrast() {
    return theme(darkMediumContrastScheme());
  }

  static ColorScheme darkHighContrastScheme() {
    return const ColorScheme(
      brightness: Brightness.dark,
      primary: Color(0xfffbfaff),
      surfaceTint: Color(0xffaac7ff),
      onPrimary: Color(0xff000000),
      primaryContainer: Color(0xffb1cbff),
      onPrimaryContainer: Color(0xff000000),
      secondary: Color(0xfffbfaff),
      onSecondary: Color(0xff000000),
      secondaryContainer: Color(0xffb1cbff),
      onSecondaryContainer: Color(0xff000000),
      tertiary: Color(0xffffffff),
      onTertiary: Color(0xff000000),
      tertiaryContainer: Color(0xffd0d4e3),
      onTertiaryContainer: Color(0xff000000),
      error: Color(0xfffff9f9),
      onError: Color(0xff000000),
      errorContainer: Color(0xffffbab1),
      onErrorContainer: Color(0xff000000),
      surface: Color(0xff141313),
      onSurface: Color(0xffffffff),
      onSurfaceVariant: Color(0xfff8fbfc),
      outline: Color(0xffc8cbcc),
      outlineVariant: Color(0xffc8cbcc),
      shadow: Color(0xff000000),
      scrim: Color(0xff000000),
      inverseSurface: Color(0xffe5e2e1),
      inversePrimary: Color(0xff002959),
      primaryFixed: Color(0xffdde7ff),
      onPrimaryFixed: Color(0xff000000),
      primaryFixedDim: Color(0xffb1cbff),
      onPrimaryFixedVariant: Color(0xff001634),
      secondaryFixed: Color(0xffdde7ff),
      onSecondaryFixed: Color(0xff000000),
      secondaryFixedDim: Color(0xffb1cbff),
      onSecondaryFixedVariant: Color(0xff001635),
      tertiaryFixed: Color(0xffe2e6f5),
      onTertiaryFixed: Color(0xff000000),
      tertiaryFixedDim: Color(0xffc6cad9),
      onTertiaryFixedVariant: Color(0xff111620),
      surfaceDim: Color(0xff141313),
      surfaceBright: Color(0xff3a3939),
      surfaceContainerLowest: Color(0xff0e0e0e),
      surfaceContainerLow: Color(0xff1c1b1b),
      surfaceContainer: Color(0xff201f1f),
      surfaceContainerHigh: Color(0xff2b2a2a),
      surfaceContainerHighest: Color(0xff353434),
    );
  }

  ThemeData darkHighContrast() {
    return theme(darkHighContrastScheme());
  }


  ThemeData theme(ColorScheme colorScheme) => ThemeData(
     useMaterial3: true,
     brightness: colorScheme.brightness,
     colorScheme: colorScheme,
     textTheme: textTheme.apply(
       bodyColor: colorScheme.onSurface,
       displayColor: colorScheme.onSurface,
     ),
     scaffoldBackgroundColor: colorScheme.background,
     canvasColor: colorScheme.surface,
  );


  List<ExtendedColor> get extendedColors => [
  ];
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
  const ColorFamily({
    required this.color,
    required this.onColor,
    required this.colorContainer,
    required this.onColorContainer,
  });

  final Color color;
  final Color onColor;
  final Color colorContainer;
  final Color onColorContainer;
}
