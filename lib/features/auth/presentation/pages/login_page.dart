import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/constants/asset_path.dart';
import 'package:smart_agro/core/route/app_router.dart';
import 'package:smart_agro/core/theme/colors.dart';
import 'package:smart_agro/core/utils/show_text_snackbar.dart';
import 'package:smart_agro/features/auth/presentation/cubit/auth_cubit.dart';
import 'package:smart_agro/features/auth/presentation/pages/otp_verification_page.dart';
import 'package:smart_agro/features/dashbaord/presentation/pages/dashboard_page.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static const routeName = 'AuthPage';
  static const routePath = '/AuthPage';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Column(
            children: [
              BlocListener<AuthCubit, AuthState>(
                listener: (context, state) {
                  handleAuthState(context, state);
                },
                child: Container(),
              ),
              Center(
                child: SvgPicture.asset(
                  AssetPath.mailboxPath,
                  height: 250.h,
                  semanticsLabel: 'Mailbox svg',
                ),
              ),
              Vspacing(25.h),
              const InterText(
                'OTP Verification',
                style: TextStyle(
                  fontSize: 32,
                  color: AppColors.primary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              Vspacing(15.h),
              const InterText(
                'We will send you the OTP on this mobile number',
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 16,
                ),
              ),
              Vspacing(20.h),
              IntlPhoneField(
                decoration: const InputDecoration(
                  labelText: 'Enter Phone Number',
                  border: OutlineInputBorder(
                    borderSide: BorderSide(),
                  ),
                ),
                initialCountryCode: 'IN',
                onChanged: (phone) {
                  log(phone.completeNumber);

                  if (phone.isValidNumber()) {
                    context.read<AuthCubit>().loginWithPhone(
                          phone.completeNumber,
                          'Test@123',
                        );
                  }
                },
              ),
              Vspacing(10.h),
              ElevatedButton(
                onPressed: () {
                  Approuter.router.push(OtpVerificationPage.routePath);
                },
                child: const InterText('Send OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }

  void handleAuthState(BuildContext context, AuthState state) {
    log(state.toString());
    if (state is AuthLoadingState) {
      showLoadingDialog(context, 'Sending OTP');
    } else if (state is AuthOtpSent) {
      Approuter.router.pushNamed(OtpVerificationPage.routeName);
      showTextSnackbar('Otp Sent');
    } else if (state is AuthLoggedIn) {
      Approuter.router.pop();
      Approuter.router.pushNamed(DashboardPage.routeName);
      showTextSnackbar('User logged in');
    } else if (state is AuthErrorState) {
      Approuter.router.pop();
      showTextSnackbar(state.errorMsg);
    }
  }

  void showLoadingDialog(BuildContext context, String message) {
    showDialog(
      context: context,
      useSafeArea: true,
      barrierDismissible: false,
      builder: (context) => AlertDialog(
        contentPadding: const EdgeInsets.all(20),
        content: Row(
          children: [
            const CircularProgressIndicator.adaptive(),
            Hspacing(20.w),
            InterText(
              message,
              style: const TextStyle(
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
