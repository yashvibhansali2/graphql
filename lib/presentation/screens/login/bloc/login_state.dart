part of 'login_bloc.dart';

final class LoginState extends Equatable {
  final String currentUsername;
  final String currentPassword;
  final bool currentVisibility;

  const LoginState(
      {this.currentUsername = "",
      this.currentPassword = "",
      this.currentVisibility = true});

  @override
  List<Object?> get props =>
      [currentUsername, currentPassword, currentVisibility];

  LoginState copyWith(
      {String? newUsername, String? newPassword, bool? newVisibility}) {
    return LoginState(
      currentUsername: newUsername ?? currentUsername,
      currentPassword: newPassword ?? currentPassword,
      currentVisibility: newVisibility ?? currentVisibility,
    );
  }
}
