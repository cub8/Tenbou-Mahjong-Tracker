import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:tenbou_mahjong/core/database/objectbox.dart';
import 'package:tenbou_mahjong/core/theme/app_colors.dart';
import 'package:tenbou_mahjong/router/app_router.dart';
import 'package:tenbou_mahjong/core/database/objectbox_provider.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final objectBox = await ObjectBox.create();

  runApp(
    ProviderScope(
      overrides: [objectBoxProvider.overrideWithValue(objectBox)],
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Tenbou Mahjong',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: AppColors.mahjongGreen),
        useMaterial3: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: AppColors.lightMahjongTeal,
          elevation: 0,
          surfaceTintColor: Colors.transparent,
        ),
        navigationBarTheme: NavigationBarThemeData(
          backgroundColor: Colors.white,
          indicatorColor: AppColors.mahjongGreen.withValues(alpha: 0.12),
        ),
      ),
      routerConfig: appRouter,
      debugShowCheckedModeBanner: false,
    );
  }
}
