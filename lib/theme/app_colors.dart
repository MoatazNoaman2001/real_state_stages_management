import 'package:flutter/material.dart';

/// ألوان التطبيق - تدعم الوضع النهاري والليلي
class AppColors {
  // الألوان الأساسية (ثابتة)
  static const Color primary = Color(0xFF4F46E5);
  static const Color secondary = Color(0xFF6366F1);

  // ألوان الحالات (ثابتة)
  static const Color success = Color(0xFF10B981);
  static const Color warning = Color(0xFFF59E0B);
  static const Color danger = Color(0xFFEF4444);
  static const Color pink = Color(0xFFEC4899);

  // التدرج اللوني (ثابت)
  static const LinearGradient primaryGradient = LinearGradient(
    colors: [primary, secondary],
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
  );
}

/// ألوان الثيم الفاتح
class LightColors {
  static const Color background = Color(0xFFF9FAFB);
  static const Color cardBackground = Color(0xFFFFFFFF);
  static const Color inputBackground = Color(0xFFF3F4F6);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF6B7280);
  static const Color divider = Color(0xFFE5E7EB);
  static const Color shadow = Color(0x0D000000);
}

/// ألوان الثيم الداكن
class DarkColors {
  static const Color background = Color(0xFF111827);
  static const Color cardBackground = Color(0xFF1F2937);
  static const Color inputBackground = Color(0xFF374151);
  static const Color textPrimary = Color(0xFFF9FAFB);
  static const Color textSecondary = Color(0xFF9CA3AF);
  static const Color divider = Color(0xFF374151);
  static const Color shadow = Color(0x33000000);
}
