import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:smart_agro/core/route/app_router.dart';

class IosApp extends StatelessWidget {
  const IosApp({super.key});

  @override
  Widget build(BuildContext context) {
    return CupertinoApp.router(
      title: 'Flutter Demo',
      theme: const CupertinoThemeData(
        applyThemeToAll: true,
        primaryColor: Colors.purple,
      ),
      routerConfig: Approuter.router,
    );
  }
}
