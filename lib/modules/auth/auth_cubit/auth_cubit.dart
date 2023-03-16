
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../models/auth_model.dart';

import '../../../models/login_model.dart';
import '../../../shared/end_points/end_points.dart';
import '../../../shared/remote_data_source/remote_data_source.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AppLoginInitialStates());
  static AuthCubit get(context) => BlocProvider.of(context);

  AuthModel ?authModel;

  void userRegister(
      {required String name,
        required String email,
        required String password,
        required String confirmPassword,
        required String phone}) {
    emit(AppRegisterLoadingStates());

    DioHelper.postData(
      path: register,
      data: {
        'name': name,
        'email': email,
        'password': password,
        'password_confirmation': confirmPassword,
        'phone': phone
      },
    ).then((value) {

      authModel = AuthModel.fromJson(value.data);

      emit(AppRegisterSuccessStates(authModel!));

    }).catchError((error) {

      emit(AppRegisterErrorStates());
    });
  }

  LoginModel ?loginModel;


  void userLogin({required String email, required String password}) {
    emit(AppLoginLoadingStates());
    DioHelper.postData(
      path: login,
      data: {"email": email, "password": password},
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);

      emit(AppLoginSuccessStates(loginModel!));
    }).catchError((error) {
      emit(AppLoginErrorStates());
    });
  }

  bool isPassword = true;
  IconData suffix = Icons.visibility_outlined;
  void changePasswordVisibility() {
    isPassword = !isPassword;
    suffix =
    isPassword ? Icons.visibility_outlined : Icons.visibility_off_outlined;
    emit(AppChangePasswordStates());
  }

}
