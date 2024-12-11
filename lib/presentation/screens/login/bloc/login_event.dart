part of 'login_bloc.dart';

abstract class LoginEvent {}

class UserInputLoginEvent extends LoginEvent {
  final String username;

  UserInputLoginEvent({required this.username});
}

class PasswordInputLoginEvent extends LoginEvent {
  final String password;

  PasswordInputLoginEvent({required this.password});
}

class ObscurePassLoginEvent extends LoginEvent {
  final bool isVisible;

  ObscurePassLoginEvent({required this.isVisible});
}
