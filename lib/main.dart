import 'dart:ui' as ui;
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:window_manager/window_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:real_state_management_stages/core/di/service_locator.dart';
import 'presentation/app_shell.dart' show AppShell, appShellKey;
import 'theme/app_theme.dart';
import 'theme/theme_cubit.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Load environment variables
  await dotenv.load(fileName: '.env');

  // Initialize window manager
  await windowManager.ensureInitialized();

  // Configure window with hidden title bar for custom implementation
  WindowOptions windowOptions = const WindowOptions(
    size: Size(1400, 600),
    minimumSize: Size(800, 600),
    center: true,
    backgroundColor: Colors.transparent,
    title: 'نظام إدارة المشاريع العقارية',
    titleBarStyle: TitleBarStyle.hidden,
  );

  await windowManager.waitUntilReadyToShow(windowOptions, () async {
    await windowManager.show();
    await windowManager.focus();
  });

  await initDependencies();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: BlocBuilder<ThemeCubit, ThemeState>(
        builder: (context, state) {
          return MaterialApp(
            title: 'نظام إدارة المشاريع العقارية',
            debugShowCheckedModeBanner: false,
            locale: const Locale('ar'),
            theme: AppTheme.light,
            darkTheme: AppTheme.dark,
            themeMode: state.themeMode,
            builder: (context, child) {
              return Directionality(
                textDirection: TextDirection.rtl,
                child: _buildWindowFrame(context, child, state),
              );
            },
            home: AppShell(key: appShellKey),
          );
        },
      ),
    );
  }

  Widget _buildWindowFrame(BuildContext context, Widget? child, ThemeState themeState) {
    final isDark = themeState.themeMode == ThemeMode.dark;
    final titleBarColor = isDark
        ? const Color(0xFF1A237E)
        : const Color(0xFF1565C0);

    return Directionality(
      textDirection: ui.TextDirection.ltr,
      child: Stack(
        children: [
          // Main content with margin for title bar
          Container(
            margin: const EdgeInsets.only(top: 36),
            child: child,
          ),

          // Custom Window Title Bar
          Container(
            width: double.infinity,
            height: 36,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  titleBarColor,
                  titleBarColor.withOpacity(0.9),
                ],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight,
              ),
            ),
            child: WindowCaption(
              brightness: Brightness.dark,
              title: Row(
                children: [
                  const SizedBox(width: 12),
                  // App Icon
                  Container(
                    width: 24,
                    height: 24,
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: const Icon(
                      Icons.apartment,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  // App Title
                  Text(
                    'نظام إدارة المشاريع العقارية',
                    style: GoogleFonts.cairo(
                      fontSize: 14,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // Resizable Border
          const DragToResizeArea(
            enableResizeEdges: [
              ResizeEdge.topLeft,
              ResizeEdge.top,
              ResizeEdge.topRight,
              ResizeEdge.left,
              ResizeEdge.right,
              ResizeEdge.bottomLeft,
              ResizeEdge.bottom,
              ResizeEdge.bottomRight,
            ],
            child: SizedBox(),
          ),
        ],
      ),
    );
  }
}
