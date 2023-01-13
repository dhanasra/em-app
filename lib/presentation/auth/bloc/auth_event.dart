part of 'auth_bloc.dart';

@immutable
abstract class AuthEvent {}

class CheckIfEmailExists extends AuthEvent{
  final String email;
  CheckIfEmailExists({required this.email});
}
