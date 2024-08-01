import 'dart:developer';

import 'package:smart_agro/core/error/exception.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthDatasource {
  Future<bool> userSignupWithPhone({required String phone});

  Future<User> verifyOtp({
    required String phone,
    required String otp,
  });
  Future<User?> checkUser();
}

class AuthDatasourceImpl implements AuthDatasource {
  final SupabaseClient _client;

  AuthDatasourceImpl({required SupabaseClient client}) : _client = client;

  @override
  Future<bool> userSignupWithPhone({required String phone}) async {
    try {
      await _client.auth.signInWithOtp(phone: phone);
      return true;
    } on AuthException catch (e) {
      log(e.toString());
      throw ServerException(message: e.message);
    } catch (e) {
      log(e.toString());
      throw ServerException(message: e.toString());
    }
  }

  @override
  Future<User> verifyOtp({required String phone, required String otp}) async {
    try {
      final res = await _client.auth.verifyOTP(
        phone: phone,
        token: otp,
        type: OtpType.sms,
      );

      if (res.user == null) {
        throw ServerException(message: 'User is null');
      }
      return res.user!;
    } on AuthException catch (e) {
      log(e.toString());
      throw ServerException(message: e.message);
    }
  }

  @override
  Future<User?> checkUser() async {
    return _client.auth.currentUser;
  }
}
