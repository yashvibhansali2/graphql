import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  LoginBloc() : super(const LoginState()) {
    on<LoginEvent>((event, emit) async {
      await mapEventToState(event, emit);
    });
  }

  Future mapEventToState(LoginEvent event, Emitter<LoginState> emit) async {
    if (event is UserInputLoginEvent) {
      emit(state.copyWith(newUsername: event.username));
    }
    if (event is PasswordInputLoginEvent) {
      emit(state.copyWith(newPassword: event.password));
    }
    if (event is ObscurePassLoginEvent) {
      emit(state.copyWith(newVisibility: event.isVisible));
    }
  }
}
