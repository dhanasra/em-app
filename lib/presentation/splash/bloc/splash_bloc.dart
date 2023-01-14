import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:uni_links/uni_links.dart';

part 'splash_event.dart';
part 'splash_state.dart';

class SplashBloc extends Bloc<SplashEvent, SplashState> {
  SplashBloc() : super(SplashInitial()) {
    on<InitApp>(_onInitApp);
  }

  void _onInitApp(InitApp event, Emitter emit)async{
    emit(Loading());

    try{
      var initialLink = await getInitialLink();
      var uri = Uri.parse(initialLink!);
      var mode = uri.queryParameters["mode"];

      if(mode=="resetPassword"){
        var actionCode = uri.queryParameters["oobCode"];
        emit(ResetPasswordLinkFetched(actionCode: actionCode!));
      }else if(mode=="signIn"){
        var user = FirebaseAuth.instance.currentUser;
        await FirebaseAuth.instance.signInWithEmailLink(email: user!.email!, emailLink: initialLink);
        emit(AuthType(isLoggedIn: true));
      }
      
    }catch(e){
      var user = FirebaseAuth.instance.currentUser;
      emit(AuthType(isLoggedIn: user!=null));
    }
    
  }
}
