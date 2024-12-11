import 'package:yashvi_graphql/presentation/screens/login/bloc/login_bloc.dart';
import 'package:yashvi_graphql/presentation/widgets/textbox_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  static final TextEditingController _userController = TextEditingController();
  static final TextEditingController _passController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final String updatedUsername =
        context.select((LoginBloc bloc) => bloc.state.currentUsername);
    final String updatedPassword =
        context.select((LoginBloc bloc) => bloc.state.currentPassword);
    final bool updatedVisibility =
        context.select((LoginBloc bloc) => bloc.state.currentVisibility);
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          TextBoxWidget(
            text: 'Username',
            icon: Icons.person_2_outlined,
            controller: _userController..text = updatedUsername.toString(),
            onChanged: ({String? newVal}) {
              if (newVal != null) {
                context
                    .read<LoginBloc>()
                    .add(UserInputLoginEvent(username: newVal));
              }
            },
          ),
          const SizedBox(
            height: 30,
          ),
          TextBoxWidget(
            text: 'Password',
            suffix: IconButton(
                onPressed: () {
                  context.read<LoginBloc>().add(
                      ObscurePassLoginEvent(isVisible: !updatedVisibility));
                },
                icon: Icon(updatedVisibility
                    ? Icons.remove_red_eye_outlined
                    : Icons.remove)),
            obscureText: updatedVisibility,
            icon: Icons.lock_outlined,
            controller: _passController..text = updatedPassword.toString(),
            onChanged: ({String? newVal}) {
              if (newVal != null) {
                context
                    .read<LoginBloc>()
                    .add(PasswordInputLoginEvent(password: newVal));
              }
            },
          ),
          const SizedBox(
            height: 40,
          ),
          ElevatedButton(
              onPressed: () {
                context
                    .read<LoginBloc>()
                    .add(PasswordInputLoginEvent(password: ""));
                _passController.clear();

                context
                    .read<LoginBloc>()
                    .add(UserInputLoginEvent(username: ""));
                _userController.clear();
              },
              child: const Text('Submit'))
        ],
      ),
    );
  }
}
