import 'package:fpdart/fpdart.dart';
import 'package:smart_agro/core/error/failure.dart';
import 'package:smart_agro/features/auth/domain/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

import 'package:smart_agro/core/usecase/usecase.dart';

class VerifyOtpUsecase implements Usecase<User, VerifyOtpUsecaseParams> {
  final AuthRepo _authRepo;

  VerifyOtpUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, User>> call(VerifyOtpUsecaseParams param) async {
    return await _authRepo.verifyOtp(phone: param.phone, otp: param.otp);
  }
}

class VerifyOtpUsecaseParams {
  String phone;
  String otp;

  VerifyOtpUsecaseParams({
    required this.phone,
    required this.otp,
  });
}
