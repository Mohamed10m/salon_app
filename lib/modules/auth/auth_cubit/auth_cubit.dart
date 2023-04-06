import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salon_app/models/google_auth_model_.dart';
import 'package:sign_in_with_apple/sign_in_with_apple.dart';

import '../../../models/auth_model.dart';

import '../../../models/change_password.dart';
import '../../../models/check_code_model.dart';
import '../../../models/facebook_auth_model.dart';
import '../../../models/login_model.dart';
import '../../../models/reset_password_model.dart';
import '../../../shared/end_points/end_points.dart';
import '../../../shared/remote_data_source/remote_data_source.dart';
import 'auth_states.dart';

class AuthCubit extends Cubit<AuthStates> {
  AuthCubit() : super(AppLoginInitialStates());

  static AuthCubit get(context) => BlocProvider.of(context);

  AuthModel? authModel;

  void userRegister(
      {required String name,
      required String email,
      String? password,
      String? confirmPassword,
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

  ResetPasswordModel? resetPasswordModel;

  void enterEmail({
    required String email,
  }) {
    emit(ResetPasswordLoadingState());

    DioHelper.postData(
      path: resetPassword,
      data: {
        'email': email,
      },
    ).then((value) {
      resetPasswordModel = ResetPasswordModel.fromJson(value.data);

      emit(ResetPasswordSuccessState());
    }).catchError((error) {
      emit(ResetPasswordErrorState());
    });
  }

  LoginModel? loginModel;

  void userLogin({required String email, required String password}) {
    emit(AppLoginLoadingStates());
    DioHelper.postData(
      path: login,
      data: {"email": email, "password": password},
    ).then((value) {
      loginModel = LoginModel.fromJson(value.data);
      emit(AppLoginSuccessStates(loginModel!));
    }).catchError((error) {
      print(error.toString());
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

  ChangePasswordModel? changePasswordModel;

  void changePassword({
    String? email,
    String? code,
    String? newPassword,
    String? newPasswordConfirmation,
  }) {
    emit(ChangePasswordLoadingState());
    DioHelper.postData(
      path: changePass,
      data: {
        'email': email,
        'code': code,
        'new_password': newPassword,
        'new_password_confirmation': newPasswordConfirmation,
      },
    ).then((value) {
      print(value);
      print('dssss${value.toString()}');
      emit(ChangePasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChangePasswordErrorState());
    });
  }

  CheckCodeModel? checkCodeModel;

  void checkCode({
    String? email,
    String? code,
  }) {
    emit(CheckCodeLoadingState());
    DioHelper.postData(
      path: check,
      data: {
        'email': email,
        'code': code,
      },
    ).then((value) {
      emit(CheckCodeSuccessState());
    }).catchError((error) {
      emit(CheckCodeErrorState());
    });
  }

  GoogleDataModel? googleDataModel;

  googleSignIn() async {
    final googleSignInAccount = await GoogleSignIn().signIn();
    final googleSignInAuthentication =
        await googleSignInAccount!.authentication;

    final accessToken = googleSignInAuthentication.accessToken;
    emit(GoogleSignInLoadingState());
    DioHelper.postData(
      path: loginGoogle,
      data: {
        'provider': 'google',
        'access_provider_token': accessToken,
      },
    ).then((value) async{
      googleDataModel = GoogleDataModel.fromJson(value.data);

      emit(GoogleSignInSuccessState(googleDataModel!));
    }).catchError((error) {
      emit(GoogleSignInErrorState());
    });
  }




  FaceLoginModel? faceLoginModel;
  Future<void> facebookSignIn() async {
    final result =
    await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
    print(result);
    final userData = await FacebookAuth.i.getUserData();
    final  accessToken = result.accessToken;
    print(result.accessToken);
    emit(FacebookSignInLoadingState());
      DioHelper.postData(
        path: loginGoogle,
        data: {
          'provider': 'facebook',
          'access_provider_token': accessToken!.token,
        },
      ).then((value) {
        faceLoginModel = FaceLoginModel.fromJson(value.data);
        emit(FacebookSignInSuccessState(faceLoginModel!));
      }).catchError((error) {
        print(error.toString());
        emit(FacebookSignInErrorState());
      });



  }

  // FaceLoginModel? faceLoginModel;
  Future<void> appleSignIn() async {
      final appleIdCredential =
      await SignInWithApple.getAppleIDCredential(scopes:[
          AppleIDAuthorizationScopes.fullName,
          AppleIDAuthorizationScopes.fullName
    ],
          webAuthenticationOptions: WebAuthenticationOptions(
          redirectUri: Uri.parse('https://api.dreamwod.app/auth/callbacks/apple-sign-in'),
          clientId: 'com.dreamwod.app.login',
    ),

      );
      print(appleIdCredential.authorizationCode);

      emit(FacebookSignInLoadingState());
        DioHelper.postData(
          path: loginGoogle,
          data: {
            'provider': 'apple',
            'access_provider_token':appleIdCredential.authorizationCode,
          },
        ).then((value) {
          emit(FacebookSignInSuccessState(faceLoginModel!));
        }).catchError((error) {
          emit(FacebookSignInErrorState());
        });
      }

  }

//
//
// FaceLoginModel? faceLoginModel;
// Future<void> facebookSignIn() async {
//   final fb = FacebookLogin();
//   // Log in
//   final res = await fb.logIn(permissions: [
//     FacebookPermission.publicProfile, // permission to get public profile
//     FacebookPermission.email,// permission to get email address
//   ]);
//   // Check result status
//   switch (res.status) {
//     case FacebookLoginStatus.success:
//       final FacebookAccessToken? accessToken = res.accessToken; // get accessToken for auth login
//       final profile = await fb.getUserProfile(); // get profile of user
//       final imageUrl = await fb.getProfileImageUrl(width: 100); // get user profile image
//       final email = await fb.getUserEmail(); // get user's email address
//
//       print('Access token: ${accessToken?.token}');
//       print('Hello, ${profile!.name}! You ID: ${profile.userId}');
//       print('Your profile image: $imageUrl');
//       if (email != null)
//         print('And your email is $email');
//
//       //push to success page after successfully signed in
//
//
//       break;
//     case FacebookLoginStatus.cancel:
//     // User cancel log in
//       break;
//     case FacebookLoginStatus.error:
//     // Log in failed
//       print('Error while log in: ${res.error}');
//       break;
//   }
//
// }
// }
//
//
//
