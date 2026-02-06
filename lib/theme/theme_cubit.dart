import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

/// حالة الثيم
enum AppThemeMode { light, dark, system }

/// Cubit لإدارة الثيم
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState());

  /// تبديل الثيم
  void toggleTheme() {
    if (state.mode == AppThemeMode.light) {
      emit(state.copyWith(mode: AppThemeMode.dark));
    } else {
      emit(state.copyWith(mode: AppThemeMode.light));
    }
  }

  /// تعيين الثيم الفاتح
  void setLightTheme() {
    emit(state.copyWith(mode: AppThemeMode.light));
  }

  /// تعيين الثيم الداكن
  void setDarkTheme() {
    emit(state.copyWith(mode: AppThemeMode.dark));
  }

  /// تعيين ثيم النظام
  void setSystemTheme() {
    emit(state.copyWith(mode: AppThemeMode.system));
  }

  /// تعيين وضع معين
  void setThemeMode(AppThemeMode mode) {
    emit(state.copyWith(mode: mode));
  }
}

/// حالة الثيم
class ThemeState {
  final AppThemeMode mode;

  const ThemeState({this.mode = AppThemeMode.light});

  ThemeState copyWith({AppThemeMode? mode}) {
    return ThemeState(mode: mode ?? this.mode);
  }

  /// الحصول على ThemeMode للـ MaterialApp
  ThemeMode get themeMode {
    switch (mode) {
      case AppThemeMode.light:
        return ThemeMode.light;
      case AppThemeMode.dark:
        return ThemeMode.dark;
      case AppThemeMode.system:
        return ThemeMode.system;
    }
  }

  /// هل الوضع داكن؟
  bool get isDark => mode == AppThemeMode.dark;

  /// هل الوضع فاتح؟
  bool get isLight => mode == AppThemeMode.light;
}
