import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial());

  @override
  Stream<AuthState> mapEventToState(AuthEvent event) async* {
    if (event is AppStart) {
      yield* mapAppStartToState();
    }
    if (event is LoginEvent) {
      yield* mapLoginEventToState(event);
    }
    if (event is RegisterEvent) {
      yield* mapRegisterEventToState(event);
    }
    if (event is LogoutEvent) {}
  }

  /// when [AppStart] event is the current event,
  /// check if the user is signed in, and update the state
  Stream<AuthState> mapAppStartToState() async* {
    try {
      // check if logged-in
      bool isAuthenticated = false;
      if (isAuthenticated) {
        yield Authenticated();
      } else {
        yield UnAuthenticated();
      }
    } catch (e) {
      yield UnAuthenticated();
    }
  }

  Stream<AuthState> mapLoginEventToState(event) async* {
    try {
      if (event is LoginEvent) {
        /// login with username and pin
        /// var token  = backend.post({"username": event.username,"pin":event.pin});
        /// var user = firebase.signinWithToken(token);
        if (event.username == "cynergy" && event.pin == "1234") {
          yield Authenticated();
        } else {
          yield UnAuthenticated();
        }
      }
    } catch (e) {
      yield UnAuthenticated();
    }
  }

  Stream<AuthState> mapRegisterEventToState(RegisterEvent event) async* {
    try {
      if (event is RegisterEvent) {
        yield Authenticated();
      } else {
        yield UnAuthenticated();
      }
    } catch (e) {
      yield UnAuthenticated();
    }
  }
}
