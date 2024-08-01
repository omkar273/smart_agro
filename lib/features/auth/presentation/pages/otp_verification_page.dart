import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:smart_agro/core/components/inter_text.dart';
import 'package:smart_agro/core/components/spacing.dart';
import 'package:smart_agro/core/constants/asset_path.dart';
import 'package:smart_agro/core/theme/colors.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';

class OtpVerificationPage extends StatelessWidget {
  static const routeName = 'OtpVerificationPage';
  static const routePath = '/OtpVerificationPage';
  const OtpVerificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 12.w, vertical: 20.h),
          child: Column(
            children: [
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
              OtpTextField(
                numberOfFields: 5,
                borderColor: const Color(0xFF512DA8),
                //set to true to show as box or false to show as dash
                showFieldAsBox: true,
                //runs when a code is typed in
                onCodeChanged: (String code) {
                  //handle validation or checks here
                },
                //runs when every textfield is filled
                onSubmit: (String verificationCode) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const Text("Verification Code"),
                          content: Text('Code entered is $verificationCode'),
                        );
                      });
                }, // end onSubmit
              ),
              Vspacing(50.h),
              ElevatedButton(
                onPressed: () {},
                child: const InterText('Verify OTP'),
              )
            ],
          ),
        ),
      ),
    );
  }
}
