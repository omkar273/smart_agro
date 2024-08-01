import 'package:fpdart/fpdart.dart';
import 'package:smart_agro/core/error/failure.dart';
import 'package:smart_agro/core/usecase/usecase.dart';
import 'package:smart_agro/features/auth/domain/repositories/auth_repo.dart';

class SendOtpUsecase implements Usecase<bool, String> {
  final AuthRepo _authRepo;

  SendOtpUsecase({required AuthRepo authRepo}) : _authRepo = authRepo;

  @override
  Future<Either<Failure, bool>> call(String phone) async {
    return await _authRepo.userSignupWithPhone(phone: phone);
  }
}
