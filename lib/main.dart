import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/android_app.dart';
import 'package:smart_agro/core/get_it/service_locator.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:smart_agro/ios_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await servicelocatorInit();
  Approuter.instance;

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      child: MultiBlocProvider(
        providers: [
          BlocProvider<AuthCubit>(
            create: (context) => AuthCubit(
              checkUserUsecase: locator(),
              sendOtpUsecase: locator(),
              verifyOtpUsecase: locator(),
            ),
          ),
        ],
        child: Platform.isIOS ? const IosApp() : const AndroidApp(),
      ),
    );
  }
}
