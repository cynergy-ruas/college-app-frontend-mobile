part of 'auth_bloc.dart';

abstract class AuthEvent extends Equatable {
  const AuthEvent();

  @override
  List<Object> get props => [];
}

class AppStart extends AuthEvent {}

class LoginEvent extends AuthEvent {
  final String username;
  final String pin;

  LoginEvent(this.username, this.pin);
}

class RegisterEvent extends AuthEvent {}

class LogoutEvent extends AuthEvent {}
