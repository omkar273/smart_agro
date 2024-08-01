import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/constants/asset_path.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/core/theme/colors.dart';
import 'package:smart_agro/features/auth/presentation/pages/login_page.dart';

class LandingPage extends StatelessWidget {
  static const routeName = 'LandingPage';
  static const routePath = '/LandingPage';
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                AssetPath.logoPath,
                width: 200.w,
                height: 175.w,
              ),
              Vspacing(0.h),
              Vspacing(25.h),
              const InterText(
                'Welcome!',
                style: TextStyle(
                  fontSize: 28,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Vspacing(50.h),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Checkout latest offer'),
              ),
              Vspacing(20.h),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Register your society'),
              ),
              Vspacing(20.h),
              ElevatedButton(
                onPressed: () {},
                child: const Text('Register as User'),
              ),
              Vspacing(20.h),
              ElevatedButton(
                onPressed: () => Approuter.router.push(LoginPage.routePath),
                child: const Text('Login'),
              ),
              Vspacing(20.h),
            ],
          ),
        ),
      ),
    );
  }
}
