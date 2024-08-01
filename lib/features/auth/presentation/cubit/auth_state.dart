// ignore_for_file: public_member_api_docs, sort_constructors_first
part of 'auth_cubit.dart';

abstract class AuthState extends Equatable {
  const AuthState();

  @override
  List<Object> get props => [];
}

class AuthInitialState extends AuthState {}

class AuthLoadingState extends AuthState {}

class AuthErrorState extends AuthState {
  final String errorMsg;

  const AuthErrorState({required this.errorMsg});
}

class AuthOtpSent extends AuthState {
  final String phone;
  const AuthOtpSent({
    required this.phone,
  });
}

class AuthLoggedIn extends AuthState {
  final User user;

  const AuthLoggedIn(this.user);
}
