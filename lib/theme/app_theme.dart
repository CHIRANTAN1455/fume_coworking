import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  AppTheme._();

  // Primary colors
  static const Color primaryDark = Color(0xFF0a0a0a);
  static const Color secondaryColor = Color(0xFF1e40af);
  static const Color accentColor = Color(0xFFfbbf24);

  // Surface colors
  static const Color surfaceDark = Color(0xFF18181b);
  static const Color cardDark = Color(0xFF27272a);
  static const Color borderColor = Color(0xFF3f3f46);

  // Text colors
  static const Color textPrimary = Color(0xFFffffff);
  static const Color textSecondary = Color(0xFFa1a1aa);
  static const Color textMuted = Color(0xFF71717a);

  // Light theme colors
  static const Color backgroundLight = Color(0xFFfafafa);
  static const Color surfaceLight = Color(0xFFffffff);
  static const Color cardLight = Color(0xFFf4f4f5);
  static const Color textHighEmphasisLight = Color(0xFF0a0a0a);
  static const Color textMediumEmphasisLight = Color(0xFF3f3f46);
  static const Color textDisabledLight = Color(0xFF71717a);

  // Dark theme colors
  static const Color backgroundDarkBg = Color(0xFF0a0a0a);
  static const Color textHighEmphasisDark = Color(0xFFffffff);
  static const Color textMediumEmphasisDark = Color(0xFFa1a1aa);
  static const Color textDisabledDark = Color(0xFF71717a);

  // Error colors
  static const Color errorColor = Color(0xFFef4444);
  static const Color errorDark = Color(0xFFfca5a5);

  // Shadow colors
  static const Color shadowLight = Color(0x1F000000);
  static const Color shadowDark = Color(0x3D000000);

  static ThemeData lightTheme = ThemeData(
    brightness: Brightness.light,
    colorScheme: ColorScheme(
      brightness: Brightness.light,
      primary: secondaryColor,
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xFF1e3a8a),
      onPrimaryContainer: Color(0xFFffffff),
      secondary: accentColor,
      onSecondary: Color(0xFF0a0a0a),
      secondaryContainer: Color(0xFFfde68a),
      onSecondaryContainer: Color(0xFF0a0a0a),
      tertiary: accentColor,
      onTertiary: Color(0xFF0a0a0a),
      tertiaryContainer: Color(0xFFfde68a),
      onTertiaryContainer: Color(0xFF0a0a0a),
      error: errorColor,
      onError: Color(0xFFffffff),
      surface: surfaceLight,
      onSurface: textHighEmphasisLight,
      onSurfaceVariant: textMediumEmphasisLight,
      outline: borderColor,
      outlineVariant: Color(0xFFe4e4e7),
      shadow: shadowLight,
      scrim: shadowLight,
      inverseSurface: surfaceDark,
      onInverseSurface: textPrimary,
      inversePrimary: Color(0xFF93c5fd),
    ),
    scaffoldBackgroundColor: backgroundLight,
    cardColor: cardLight,
    dividerColor: Color(0xFFe4e4e7),
    appBarTheme: AppBarThemeData(
      backgroundColor: surfaceLight,
      foregroundColor: textHighEmphasisLight,
      elevation: 0,
      shadowColor: shadowLight,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textHighEmphasisLight,
      ),
    ),
    cardTheme: CardThemeData(
      color: cardLight,
      elevation: 2.0,
      shadowColor: shadowLight,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: Color(0xFFe4e4e7), width: 1),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceLight,
      selectedItemColor: secondaryColor,
      unselectedItemColor: textMediumEmphasisLight,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Color(0xFFffffff),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFFffffff),
        backgroundColor: secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: BorderSide(color: secondaryColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: _buildTextTheme(isLight: true),
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: surfaceLight,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Color(0xFFe4e4e7), width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: Color(0xFFe4e4e7), width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: secondaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: errorColor, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: errorColor, width: 2),
      ),
      labelStyle: GoogleFonts.inter(
        color: textMediumEmphasisLight,
        fontSize: 14,
      ),
      hintStyle: GoogleFonts.inter(color: textDisabledLight, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return secondaryColor;
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return secondaryColor.withValues(alpha: 0.4);
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return secondaryColor;
        return null;
      }),
      checkColor: WidgetStateProperty.all(Color(0xFFffffff)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return secondaryColor;
        return null;
      }),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: secondaryColor),
    sliderTheme: SliderThemeData(
      activeTrackColor: secondaryColor,
      thumbColor: secondaryColor,
      overlayColor: secondaryColor.withValues(alpha: 0.2),
      inactiveTrackColor: secondaryColor.withValues(alpha: 0.3),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: secondaryColor,
      unselectedLabelColor: textMediumEmphasisLight,
      indicatorColor: secondaryColor,
      labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: textHighEmphasisLight.withValues(alpha: 0.9),
        borderRadius: BorderRadius.circular(6),
      ),
      textStyle: GoogleFonts.inter(color: surfaceLight, fontSize: 12),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: textHighEmphasisLight,
      contentTextStyle: GoogleFonts.inter(color: surfaceLight, fontSize: 14),
      actionTextColor: accentColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.0)),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: cardLight,
      selectedColor: secondaryColor.withValues(alpha: 0.15),
      labelStyle: GoogleFonts.inter(fontSize: 13, fontWeight: FontWeight.w500),
      side: BorderSide(color: Color(0xFFe4e4e7)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ), dialogTheme: DialogThemeData(backgroundColor: surfaceLight),
  );

  static ThemeData darkTheme = ThemeData(
    brightness: Brightness.dark,
    colorScheme: ColorScheme(
      brightness: Brightness.dark,
      primary: secondaryColor,
      onPrimary: Color(0xFFffffff),
      primaryContainer: Color(0xFF1e3a8a),
      onPrimaryContainer: Color(0xFFffffff),
      secondary: accentColor,
      onSecondary: Color(0xFF0a0a0a),
      secondaryContainer: Color(0xFF92400e),
      onSecondaryContainer: Color(0xFFfde68a),
      tertiary: accentColor,
      onTertiary: Color(0xFF0a0a0a),
      tertiaryContainer: Color(0xFF92400e),
      onTertiaryContainer: Color(0xFFfde68a),
      error: errorDark,
      onError: Color(0xFF0a0a0a),
      surface: surfaceDark,
      onSurface: textPrimary,
      onSurfaceVariant: textSecondary,
      outline: borderColor,
      outlineVariant: Color(0xFF3f3f46),
      shadow: shadowDark,
      scrim: shadowDark,
      inverseSurface: surfaceLight,
      onInverseSurface: textHighEmphasisLight,
      inversePrimary: Color(0xFF1e40af),
    ),
    scaffoldBackgroundColor: backgroundDarkBg,
    cardColor: cardDark,
    dividerColor: borderColor,
    appBarTheme: AppBarThemeData(
      backgroundColor: surfaceDark,
      foregroundColor: textPrimary,
      elevation: 0,
      shadowColor: shadowDark,
      surfaceTintColor: Colors.transparent,
      titleTextStyle: GoogleFonts.inter(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: textPrimary,
      ),
    ),
    cardTheme: CardThemeData(
      color: cardDark,
      elevation: 2.0,
      shadowColor: shadowDark,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12.0),
        side: BorderSide(color: borderColor, width: 1),
      ),
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
      backgroundColor: surfaceDark,
      selectedItemColor: secondaryColor,
      unselectedItemColor: textSecondary,
      elevation: 8,
      type: BottomNavigationBarType.fixed,
    ),
    floatingActionButtonTheme: FloatingActionButtonThemeData(
      backgroundColor: secondaryColor,
      foregroundColor: Color(0xFFffffff),
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
    ),
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Color(0xFFffffff),
        backgroundColor: secondaryColor,
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    outlinedButtonTheme: OutlinedButtonThemeData(
      style: OutlinedButton.styleFrom(
        foregroundColor: Color(0xFF93c5fd),
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 14),
        side: BorderSide(color: secondaryColor, width: 1.5),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w600),
      ),
    ),
    textButtonTheme: TextButtonThemeData(
      style: TextButton.styleFrom(
        foregroundColor: Color(0xFF93c5fd),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10.0),
        ),
        textStyle: GoogleFonts.inter(fontSize: 15, fontWeight: FontWeight.w500),
      ),
    ),
    textTheme: _buildTextTheme(isLight: false),
    inputDecorationTheme: InputDecorationThemeData(
      fillColor: surfaceDark,
      filled: true,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: borderColor, width: 1),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: secondaryColor, width: 2),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: errorDark, width: 1),
      ),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10.0),
        borderSide: BorderSide(color: errorDark, width: 2),
      ),
      labelStyle: GoogleFonts.inter(color: textSecondary, fontSize: 14),
      hintStyle: GoogleFonts.inter(color: textMuted, fontSize: 14),
      contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
    ),
    switchTheme: SwitchThemeData(
      thumbColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return secondaryColor;
        return null;
      }),
      trackColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) {
          return secondaryColor.withValues(alpha: 0.4);
        }
        return null;
      }),
    ),
    checkboxTheme: CheckboxThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return secondaryColor;
        return null;
      }),
      checkColor: WidgetStateProperty.all(Color(0xFFffffff)),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(4)),
    ),
    radioTheme: RadioThemeData(
      fillColor: WidgetStateProperty.resolveWith((states) {
        if (states.contains(WidgetState.selected)) return secondaryColor;
        return null;
      }),
    ),
    progressIndicatorTheme: ProgressIndicatorThemeData(color: secondaryColor),
    sliderTheme: SliderThemeData(
      activeTrackColor: secondaryColor,
      thumbColor: secondaryColor,
      overlayColor: secondaryColor.withValues(alpha: 0.2),
      inactiveTrackColor: secondaryColor.withValues(alpha: 0.3),
    ),
    tabBarTheme: TabBarThemeData(
      labelColor: textPrimary,
      unselectedLabelColor: textSecondary,
      indicatorColor: secondaryColor,
      labelStyle: GoogleFonts.inter(fontSize: 14, fontWeight: FontWeight.w600),
      unselectedLabelStyle: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
      ),
    ),
    tooltipTheme: TooltipThemeData(
      decoration: BoxDecoration(
        color: cardDark.withValues(alpha: 0.95),
        borderRadius: BorderRadius.circular(6),
        border: Border.all(color: borderColor),
      ),
      textStyle: GoogleFonts.inter(color: textPrimary, fontSize: 12),
    ),
    snackBarTheme: SnackBarThemeData(
      backgroundColor: cardDark,
      contentTextStyle: GoogleFonts.inter(color: textPrimary, fontSize: 14),
      actionTextColor: accentColor,
      behavior: SnackBarBehavior.floating,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10.0),
        side: BorderSide(color: borderColor),
      ),
    ),
    chipTheme: ChipThemeData(
      backgroundColor: cardDark,
      selectedColor: secondaryColor.withValues(alpha: 0.2),
      labelStyle: GoogleFonts.inter(
        fontSize: 13,
        fontWeight: FontWeight.w500,
        color: textPrimary,
      ),
      side: BorderSide(color: borderColor),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
    ), dialogTheme: DialogThemeData(backgroundColor: cardDark),
  );

  static TextTheme _buildTextTheme({required bool isLight}) {
    final Color high = isLight ? textHighEmphasisLight : textHighEmphasisDark;
    final Color medium = isLight
        ? textMediumEmphasisLight
        : textMediumEmphasisDark;
    final Color disabled = isLight ? textDisabledLight : textDisabledDark;

    return TextTheme(
      displayLarge: GoogleFonts.inter(
        fontSize: 96,
        fontWeight: FontWeight.w300,
        color: high,
        letterSpacing: -1.5,
      ),
      displayMedium: GoogleFonts.inter(
        fontSize: 60,
        fontWeight: FontWeight.w300,
        color: high,
        letterSpacing: -0.5,
      ),
      displaySmall: GoogleFonts.inter(
        fontSize: 48,
        fontWeight: FontWeight.w400,
        color: high,
      ),
      headlineLarge: GoogleFonts.inter(
        fontSize: 40,
        fontWeight: FontWeight.w700,
        color: high,
        letterSpacing: -0.5,
      ),
      headlineMedium: GoogleFonts.inter(
        fontSize: 34,
        fontWeight: FontWeight.w700,
        color: high,
        letterSpacing: -0.25,
      ),
      headlineSmall: GoogleFonts.inter(
        fontSize: 24,
        fontWeight: FontWeight.w700,
        color: high,
      ),
      titleLarge: GoogleFonts.inter(
        fontSize: 20,
        fontWeight: FontWeight.w600,
        color: high,
        letterSpacing: 0.15,
      ),
      titleMedium: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w500,
        color: high,
        letterSpacing: 0.15,
      ),
      titleSmall: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: high,
        letterSpacing: 0.1,
      ),
      bodyLarge: GoogleFonts.inter(
        fontSize: 16,
        fontWeight: FontWeight.w400,
        color: high,
        letterSpacing: 0.5,
      ),
      bodyMedium: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w400,
        color: high,
        letterSpacing: 0.25,
      ),
      bodySmall: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w300,
        color: medium,
        letterSpacing: 0.4,
      ),
      labelLarge: GoogleFonts.inter(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: high,
        letterSpacing: 1.25,
      ),
      labelMedium: GoogleFonts.inter(
        fontSize: 12,
        fontWeight: FontWeight.w400,
        color: medium,
        letterSpacing: 0.4,
      ),
      labelSmall: GoogleFonts.inter(
        fontSize: 10,
        fontWeight: FontWeight.w400,
        color: disabled,
        letterSpacing: 1.5,
      ),
    );
  }
}