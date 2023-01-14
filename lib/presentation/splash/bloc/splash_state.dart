part of 'splash_bloc.dart';

@immutable
abstract class SplashState {}

class SplashInitial extends SplashState {}

class Loading extends SplashState {}

class ResetPasswordLinkFetched extends SplashState {
  final String actionCode;

  ResetPasswordLinkFetched({
    required this.actionCode
  });
}

class AuthType extends SplashState {
  final bool isLoggedIn;

  AuthType({
    required this.isLoggedIn
  });
}
