import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'app_colors.dart';

/// ثيمات التطبيق
class AppTheme {
  AppTheme._();

  /// الثيم الفاتح
  static ThemeData get light {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.light,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.light,
        surface: LightColors.cardBackground,
      ),
      scaffoldBackgroundColor: LightColors.background,
      cardColor: LightColors.cardBackground,
      dividerColor: LightColors.divider,
      textTheme: _buildTextTheme(LightColors.textPrimary, LightColors.textSecondary),
      appBarTheme: AppBarTheme(
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black26,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        color: LightColors.cardBackground,
        elevation: 2,
        shadowColor: LightColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: LightColors.inputBackground,
        hintStyle: GoogleFonts.cairo(
          color: LightColors.textSecondary,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: const IconThemeData(
        color: LightColors.textSecondary,
      ),
      extensions: const [
        AppColorsExtension(
          background: LightColors.background,
          cardBackground: LightColors.cardBackground,
          inputBackground: LightColors.inputBackground,
          textPrimary: LightColors.textPrimary,
          textSecondary: LightColors.textSecondary,
          divider: LightColors.divider,
          shadow: LightColors.shadow,
        ),
      ],
    );
  }

  /// الثيم الداكن
  static ThemeData get dark {
    return ThemeData(
      useMaterial3: true,
      brightness: Brightness.dark,
      colorScheme: ColorScheme.fromSeed(
        seedColor: AppColors.primary,
        brightness: Brightness.dark,
        surface: DarkColors.cardBackground,
      ),
      scaffoldBackgroundColor: DarkColors.background,
      cardColor: DarkColors.cardBackground,
      dividerColor: DarkColors.divider,
      textTheme: _buildTextTheme(DarkColors.textPrimary, DarkColors.textSecondary),
      appBarTheme: AppBarTheme(
        backgroundColor: const Color(0xFF1A237E),
        foregroundColor: Colors.white,
        elevation: 2,
        shadowColor: Colors.black45,
        titleTextStyle: GoogleFonts.cairo(
          fontSize: 18,
          fontWeight: FontWeight.w600,
          color: Colors.white,
        ),
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      cardTheme: CardThemeData(
        color: DarkColors.cardBackground,
        elevation: 2,
        shadowColor: DarkColors.shadow,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      inputDecorationTheme: InputDecorationTheme(
        filled: true,
        fillColor: DarkColors.inputBackground,
        hintStyle: GoogleFonts.cairo(
          color: DarkColors.textSecondary,
          fontSize: 14,
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      ),
      iconTheme: const IconThemeData(
        color: DarkColors.textSecondary,
      ),
      extensions: const [
        AppColorsExtension(
          background: DarkColors.background,
          cardBackground: DarkColors.cardBackground,
          inputBackground: DarkColors.inputBackground,
          textPrimary: DarkColors.textPrimary,
          textSecondary: DarkColors.textSecondary,
          divider: DarkColors.divider,
          shadow: DarkColors.shadow,
        ),
      ],
    );
  }

  /// بناء أنماط النصوص
  static TextTheme _buildTextTheme(Color primary, Color secondary) {
    return TextTheme(
      headlineLarge: GoogleFonts.cairo(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: primary,
      ),
      headlineMedium: GoogleFonts.cairo(
        fontSize: 24,
        fontWeight: FontWeight.bold,
        color: primary,
      ),
      titleLarge: GoogleFonts.cairo(
        fontSize: 18,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      titleMedium: GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.w600,
        color: primary,
      ),
      bodyLarge: GoogleFonts.cairo(
        fontSize: 16,
        fontWeight: FontWeight.normal,
        color: primary,
      ),
      bodyMedium: GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.normal,
        color: primary,
      ),
      bodySmall: GoogleFonts.cairo(
        fontSize: 12,
        fontWeight: FontWeight.normal,
        color: secondary,
      ),
      labelLarge: GoogleFonts.cairo(
        fontSize: 14,
        fontWeight: FontWeight.w500,
        color: primary,
      ),
    );
  }
}

/// امتداد للوصول لألوان الثيم المخصصة
class AppColorsExtension extends ThemeExtension<AppColorsExtension> {
  final Color background;
  final Color cardBackground;
  final Color inputBackground;
  final Color textPrimary;
  final Color textSecondary;
  final Color divider;
  final Color shadow;

  const AppColorsExtension({
    required this.background,
    required this.cardBackground,
    required this.inputBackground,
    required this.textPrimary,
    required this.textSecondary,
    required this.divider,
    required this.shadow,
  });

  @override
  ThemeExtension<AppColorsExtension> copyWith({
    Color? background,
    Color? cardBackground,
    Color? inputBackground,
    Color? textPrimary,
    Color? textSecondary,
    Color? divider,
    Color? shadow,
  }) {
    return AppColorsExtension(
      background: background ?? this.background,
      cardBackground: cardBackground ?? this.cardBackground,
      inputBackground: inputBackground ?? this.inputBackground,
      textPrimary: textPrimary ?? this.textPrimary,
      textSecondary: textSecondary ?? this.textSecondary,
      divider: divider ?? this.divider,
      shadow: shadow ?? this.shadow,
    );
  }

  @override
  ThemeExtension<AppColorsExtension> lerp(
    covariant ThemeExtension<AppColorsExtension>? other,
    double t,
  ) {
    if (other is! AppColorsExtension) return this;
    return AppColorsExtension(
      background: Color.lerp(background, other.background, t)!,
      cardBackground: Color.lerp(cardBackground, other.cardBackground, t)!,
      inputBackground: Color.lerp(inputBackground, other.inputBackground, t)!,
      textPrimary: Color.lerp(textPrimary, other.textPrimary, t)!,
      textSecondary: Color.lerp(textSecondary, other.textSecondary, t)!,
      divider: Color.lerp(divider, other.divider, t)!,
      shadow: Color.lerp(shadow, other.shadow, t)!,
    );
  }
}

/// امتداد للوصول السريع لألوان الثيم
extension AppColorsExtensionBuildContext on BuildContext {
  AppColorsExtension get colors =>
      Theme.of(this).extension<AppColorsExtension>()!;
}
