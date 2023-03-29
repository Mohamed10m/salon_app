import 'package:salon_app/models/auth_model.dart';
import 'package:salon_app/models/google_auth_model_.dart';

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

class ResetPasswordLoadingState extends AuthStates {}

class ResetPasswordSuccessState extends AuthStates {}

class ResetPasswordErrorState extends AuthStates {}

class ChooseBarberInitialStates extends AuthStates {}

class GetSuccessChooseBarberData extends AuthStates {}


class GetErrorChoosesData extends AuthStates {}

abstract class GetBarberStates {}

class ChangePasswordLoadingState extends AuthStates {}

class ChangePasswordSuccessState extends AuthStates {}

class ChangePasswordErrorState extends AuthStates {}
class EnterPasswordLoadingState extends AuthStates {}

class EnterPasswordSuccessState extends AuthStates {}

class EnterPasswordErrorState extends AuthStates {}
class EnterCodeVerificationErrorState extends AuthStates {}
class EnterCodeVerificationSuccessState extends AuthStates {}

// GoogleSignIn
class GoogleSignInLoadingState extends AuthStates {}
class GoogleSignInSuccessState extends AuthStates {
  final GoogleDataModel googleDataModel;

  GoogleSignInSuccessState(this.googleDataModel);
}
class GoogleSignInErrorState extends AuthStates {}
class FacebookSignInLoadingState extends AuthStates {}
class FacebookSignInSuccessState extends AuthStates {
  final GoogleDataModel googleDataModel;

  FacebookSignInSuccessState(this.googleDataModel);
}
class FacebookSignInErrorState extends AuthStates {}
