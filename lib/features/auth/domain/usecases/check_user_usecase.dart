import 'dart:developer';

import 'package:fpdart/fpdart.dart';
import 'package:smart_agro/core/error/failure.dart';
import 'package:smart_agro/core/usecase/usecase.dart';
import 'package:smart_agro/features/auth/domain/repositories/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class CheckUserUsecase implements Usecase<User, NoParams> {
  final AuthRepo _authRepo;

  CheckUserUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;
  @override
  Future<Either<Failure, User>> call(NoParams param) async {
    try {
      final User? user = await _authRepo.checkUser();
      log('inisde check user usecase');
      if (user != null) {
        return right(user);
      } else {
        return left(Failure('User not logged in yet'));
      }
    } catch (e) {
      log(e.toString());
      return left(Failure('Error in check user usecase : ${e.toString()}'));
    }
  }
}
