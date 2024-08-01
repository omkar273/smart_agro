import 'package:fpdart/fpdart.dart';
import 'package:smart_agro/core/error/failure.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

abstract interface class AuthRepo {
  Future<Either<Failure, bool>> userSignupWithPhone({required String phone});

  Future<Either<Failure, User>> verifyOtp({
    required String phone,
    required String otp,
  });

  Future<User?> checkUser();
}
