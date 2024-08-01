import 'package:flutter/material.dart';
import 'package:smart_agro/core/constants/keys.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/core/theme/app_theme.dart';

class AndroidApp extends StatelessWidget {
  const AndroidApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Smart Society',
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme,
      scaffoldMessengerKey: scaffoldMessangerKey,
      themeMode: ThemeMode.light,
      routerConfig: Approuter.router,
    );
  }
}
