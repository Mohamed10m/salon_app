import 'package:salon_app/models/auth_model.dart';

import '../../../models/login_model.dart';

abstract class AuthStates {}

// Register States
class AppLoginInitialStates extends AuthStates {}

class AppRegisterLoadingStates extends AuthStates {}

class AppRegisterSuccessStates extends AuthStates {
  final AuthModel authModel;

  AppRegisterSuccessStates(this.authModel);
}

class AppRegisterErrorStates extends AuthStates {}

// LoginStates

class AppLoginSuccessStates extends AuthStates {
  final LoginModel loginModel;

  AppLoginSuccessStates(this.loginModel);
}

class AppLoginLoadingStates extends AuthStates {}

class AppLoginErrorStates extends AuthStates {}


class AppChangePasswordStates extends AuthStates {}
