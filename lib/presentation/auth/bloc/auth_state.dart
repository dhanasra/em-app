part of 'auth_bloc.dart';

@immutable
abstract class AuthState {}

class AuthInitial extends AuthState {}

class Loading extends AuthState {}

class EmailState extends AuthState {
  final bool isExists;
  EmailState({ required this.isExists });
}

class AuthSuccess extends AuthState {}
class AuthFailure extends AuthState {
  final String message;
  AuthFailure({ required this.message });
}