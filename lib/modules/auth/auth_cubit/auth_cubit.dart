import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AppLoginInitialStates());
  static AuthCubit get(context) => BlocProvider.of(context);

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
        isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangePasswordStates());
  }
}
