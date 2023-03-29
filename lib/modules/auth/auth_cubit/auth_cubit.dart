import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:salon_app/models/google_auth_model_.dart';
import 'package:salon_app/models/user_data_model.dart';
import 'package:salon_app/shared/componants/app_constane.dart';


import '../../../models/auth_model.dart';

import '../../../models/change_password.dart';
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
      print(error.toString());
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




  // void changePassword({
  //   required String password,
  //   required String confirmPassword,
  // }) {
  //   emit(ChangePasswordLoadingState());
  //
  //   DioHelper.postData(
  //     path: changePass,
  //     data: {
  //       'new_password': password,
  //       'new_password_confirmation': confirmPassword,
  //     },
  //   ).then((value) {
  //     resetPasswordModel = ResetPasswordModel.fromJson(value.data);
  //
  //     emit(ChangePasswordSuccessState());
  //   }).catchError((error) {
  //     print(error.toString());
  //     emit(ChangePasswordErrorState());
  //   });
  // }

//   ChangePasswordModel ? enterCode;
//
//   void enterCodeVerification({
//     required String code,
//     required String password,
//     required String confirmPassword,
//     required String code,
//   }) {
//     emit(EnterPasswordLoadingState());
// print('ppppppppppppppppppppppppppppppppp123');
//     DioHelper.postData(
//       token: token,
//       path: changePass,
//       data: {
//         'code': code,
//         'new_password': code,
//         'new_password_confirmation': code,
//         'code': code,
//       },
//     ).then((value) {
//       print('ppppppppppppppppppppppppppppppppp456');
//
//       enterCode = ChangePasswordModel.fromJson(value.data);
//       print('ppppppppppppppppppppppppppppppppp789');
//
//       emit(EnterPasswordSuccessState());
//     }).catchError((error) {
//       print(error.toString());
//       emit(EnterPasswordErrorState());
//     });
//   }



  ChangePasswordModel? changePasswordModel;

  void changePassword({
     String? email,
     String ?code ,
     String? newPassword,
     String? newPasswordConfirmation,

  }) {
    emit(ChangePasswordLoadingState());
    print('888888888888888');
    DioHelper.postData(
      path: changePass,
      data: {
        'email': email,
        'code': code,
        'new_password':newPassword,
        'new_password_confirmation':newPasswordConfirmation,
      },
    ).then((value) {
      print(value.data);
      emit(ChangePasswordSuccessState());
    }).catchError((error) {
      print(error.toString());
      emit(ChangePasswordErrorState());
    });
  }


GoogleDataModel ?googleDataModel;

   googleSignIn()async{
   final  googleSignInAccount = await GoogleSignIn().signIn();
    final googleSignInAuthentication =  await googleSignInAccount!.authentication;

  final  accessToken = googleSignInAuthentication.accessToken;

    print('${ googleSignInAuthentication.accessToken}');
    emit(GoogleSignInLoadingState());
    DioHelper.postData(
      path: loginGoogle,
      data: {
        'provider': 'google',
        'access_provider_token': accessToken,
      },
    ).then((value) {
      googleDataModel = GoogleDataModel.fromJson(value.data);
      print(googleDataModel!.user!.name);
      print(value.data);
         print('1111111111');
      emit(GoogleSignInSuccessState(googleDataModel!));
    }).catchError((error) {
      print(error.toString());
      emit(GoogleSignInErrorState());
    });
   }




  // Future<UserCredential> signInWithFacebook() async {
  //   // Trigger the sign-in flow
  //   final LoginResult loginResult = await FacebookAuth.instance.login();
  //
  //   // Create a credential from the access token
  //   final OAuthCredential facebookAuthCredential =
  //   FacebookAuthProvider.credential(loginResult.accessToken!.token);
  //
  //   // Once signed in, return the UserCredential
  //   return FirebaseAuth.instance.signInWithCredential(facebookAuthCredential);
  // }

  // Future<void> _facebookSignIn() async {
  //   try {
  //     final result =
  //     await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
  //     if (result.status == LoginStatus.success) {
  //       final userData = await FacebookAuth.i.getUserData();
  //       print(userData);
  //     }
  //   } catch (error) {
  //     print(error);
  //   }
  Future<void> facebookSignIn()async{
          final result =
          await FacebookAuth.i.login(permissions: ['public_profile', 'email']);
          print(result);
            final userData = await FacebookAuth.i.getUserData();
          final  accessToken = result.accessToken;
            print(result.accessToken);


    emit(FacebookSignInLoadingState());
    print('lllllll');
    DioHelper.postData(
      path: loginGoogle,
      data: {
        'provider': 'facebook',
        'access_provider_token':accessToken,
      },
    ).then((value) {
      print('hhhhhhhhhhhhh${value.data.toString()}');
      googleDataModel = GoogleDataModel.fromJson(value.data);
      print('hhhhhhhhhhhhh${googleDataModel!.token}');
      emit(FacebookSignInSuccessState(googleDataModel!));
    }).catchError((error) {
      print(error.toString());
      emit(FacebookSignInErrorState());
    });
   }


}

