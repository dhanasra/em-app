part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckIfEmailExists extends AuthEvent{
  final String email;
  CheckIfEmailExists({required this.email});
}

class EmailLogin extends AuthEvent {
  final String email;
  final String password;

  EmailLogin({
    required this.email,
    required this.password
  });
}

class EmailSignUp extends AuthEvent {
  final String email;
  final String password;
  final String name;

  EmailSignUp({
    required this.email,
    required this.password,
    required this.name
  });
}