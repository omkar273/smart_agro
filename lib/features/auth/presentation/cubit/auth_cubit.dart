import 'dart:developer';

import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:smart_agro/core/get_it/service_locator.dart';
import 'package:smart_agro/core/usecase/usecase.dart';
import 'package:smart_agro/features/auth/domain/usecases/check_user_usecase.dart';
import 'package:smart_agro/features/auth/domain/usecases/send_otp_usecase.dart';
import 'package:smart_agro/features/auth/domain/usecases/verify_otp_usecase.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

part 'auth_state.dart';

class AuthCubit extends Cubit<AuthState> {
  final SendOtpUsecase _sendOtpUsecase;
  final VerifyOtpUsecase _verifyOtpUsecase;
  final CheckUserUsecase _checkUserUsecase;

  AuthCubit({
    required SendOtpUsecase sendOtpUsecase,
    required VerifyOtpUsecase verifyOtpUsecase,
    required CheckUserUsecase checkUserUsecase,
  })  : _sendOtpUsecase = sendOtpUsecase,
        _verifyOtpUsecase = verifyOtpUsecase,
        _checkUserUsecase = checkUserUsecase,
        super(AuthInitialState()) {
    init();
  }

  void init() async {
    final userRes = await _checkUserUsecase.call(NoParams());
    userRes.fold(
      (l) {},
      (user) {
        emit(AuthLoggedIn(user));
      },
    );
  }

  void signupUsingPhone(String phone, String password) async {
    try {
      emit(AuthLoadingState());
      final AuthResponse res = await locator<SupabaseClient>().auth.signUp(
            password: password,
            email: '$phone@gmail.com',
          );

      if (res.user == null) {
        emit(const AuthErrorState(errorMsg: 'Signup failed'));
      } else {
        emit(AuthLoggedIn(res.user!));
      }
    } catch (e) {
      emit(AuthErrorState(errorMsg: e.toString()));

      log(e.toString());
    }
  }

  void loginWithPhone(String phone, String password) async {
    try {
      final AuthResponse res =
          await locator<SupabaseClient>().auth.signInWithPassword(
                password: password,
                email: '$phone@gmail.com',
              );

      // final AuthResponse res =
      //     await locator<SupabaseClient>().auth.signInWithPassword(
      //           password: password,
      //           phone: phone,
      //         );
      if (res.user == null) {
        emit(const AuthErrorState(errorMsg: 'Signup failed'));
      } else {
        emit(AuthLoggedIn(res.user!));
      }
    } catch (e) {
      log(e.toString());
    }
  }

  void sendOtp(String phone) async {
    emit(AuthLoadingState());
    final res = await _sendOtpUsecase.call(phone);
    res.fold(
      (failure) {
        emit(AuthErrorState(errorMsg: failure.errorMsg));
      },
      (otpSent) {
        emit(AuthOtpSent(phone: phone));
      },
    );
  }

  void verifyOtp(String otp) async {
    if (state is AuthOtpSent) {
      final authOtpSentState = state as AuthOtpSent;
      final phone = authOtpSentState.phone;

      emit(AuthLoadingState());
      final res = await _verifyOtpUsecase.call(
        VerifyOtpUsecaseParams(phone: phone, otp: otp),
      );
      res.fold(
        (failure) {
          emit(AuthErrorState(errorMsg: failure.errorMsg));
        },
        (user) {
          emit(AuthLoggedIn(user));
        },
      );
    } else {
      emit(const AuthErrorState(errorMsg: 'OTP not sent yet.'));
    }
  }
}
