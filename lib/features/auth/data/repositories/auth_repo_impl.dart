import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:smart_agro/core/error/exception.dart';
import 'package:smart_agro/core/error/failure.dart';
import 'package:smart_agro/features/auth/data/datasources/auth_datasource.dart';
import 'package:smart_agro/features/auth/domain/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class AuthRepoImpl implements AuthRepo {
  final AuthDatasource _datasource;

  AuthRepoImpl({required AuthDatasource datasource}) : _datasource = datasource;

  @override
  Future<Either<Failure, bool>> userSignupWithPhone(
      {required String phone}) async {
    try {
      final otpSent = await _datasource.userSignupWithPhone(phone: phone);
      if (otpSent) {
        return right(true);
      } else {
        return left(Failure('OTP not sent'));
      }
    } on ServerException catch (e) {
      log(e.message);
      return left(Failure(e.message));
    } catch (e) {
      log(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, User>> verifyOtp({
    required String phone,
    required String otp,
  }) async {
    try {
      final user = await _datasource.verifyOtp(phone: phone, otp: otp);

      return right(user);
    } on ServerException catch (e) {
      log(e.message);
      return left(Failure(e.message));
    } catch (e) {
      log(e.toString());
      return left(Failure(e.toString()));
    }
  }

  @override
  Future<User?> checkUser() async {
    return await _datasource.checkUser();
  }
}
