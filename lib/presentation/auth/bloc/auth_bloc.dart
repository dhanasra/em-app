import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<CheckIfEmailExists>(_onCheckIfEmailExists);
  }

  void _onCheckIfEmailExists(CheckIfEmailExists event, Emitter emit)async{
    emit(Loading());
    try{
      var auth = FirebaseAuth.instance;
      var methods = await auth.fetchSignInMethodsForEmail(event.email);
      var isEmailExists = methods.contains('password');
      emit(EmailState(isExists: isEmailExists));
    }on FirebaseException catch(e){
      emit(AuthFailure(message: _getErrorMessage(e.code)));
    }
  }

  String _getErrorMessage(String errorCode, {String? param}){
    switch(errorCode){
      case "mismatch": return "password & confirm password does not match";
      case "unknown": return "$param is empty!";
      case "user-not-found": return "Sorry buddy, The email address not found";
      case "invalid-email": return "Please enter the valid email address";
      case "email-already-in-use": return "The given email address is already registered.";
      case "wrong-password": return "Wrong password";
      case "account-exists-with-different-credential": return "Email already associated with another account";
      case "weak-password": return "Password is too easy. Password should contain minimum 8 letters";
      case "operation-not-allowed": case "user-disabled": return "Something went wrong try different email address";
      default: return "Sorry buddy, Something went wrong. Try again later!";
    }
  }
}