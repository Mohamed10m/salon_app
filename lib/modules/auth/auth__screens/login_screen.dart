import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/layout/cubut/home_layout_cubit.dart';
import 'package:salon_app/shared/componants/app_strings.dart';
import '../../../shared/componants/app_constane.dart';
import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import '../../../shared/componants/fonts_manager.dart';
import '../../../shared/componants/language_type.dart';
import '../../../shared/local_data_source/locale_data_source.dart';
import '../../chose_place/choose_place.dart';
import '../../password/forget_password.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_states.dart';
import 'register_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  // void validateEmail(){
  //   final bool isValid =  EmailValidator.validate(emailController.text.trim());
  //
  //   if(isValid)
  // {
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('valid email'))));
  // }
  // else{
  //   ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Center(child: Text('Not A valid email'))));
  //
  // }
  // }

  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }

    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: BlocConsumer<AuthCubit, AuthStates>(
        listener: (context, state) {

           if(state is GoogleSignInSuccessState){
            AppPreferences.saveData('token', state.googleDataModel.token!)
                .then((value) {
              print(value.toString());
              token = state.googleDataModel.token!;
              print('2');

              print(token);
              print('2');
              print('2');
              navigateAndFinish(
                  context,
                  BlocProvider.value(
                    value: HomeLayoutCubit.get(context)..getBarberData(),
                    child: const ChosePlace(),
                  ));
            });

          }
          if (state is AppLoginSuccessStates) {
          if (state.loginModel.status!) {
          AppPreferences.saveData('token', state.loginModel.token)
              .then((value) {
          token = state.loginModel.token;
          print(token);
          navigateAndFinish(
          context,
          BlocProvider.value(
          value: HomeLayoutCubit.get(context)..getBarberData(),
          child: const ChosePlace(),
          ));
          });
          }

          }
        },
        builder: (context, state) {
          return Scaffold(
            body: background(
                child: Padding(
              padding: EdgeInsets.only(top: 68.h),
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundColor: HexColor('#EC8E6C').withOpacity(0.1),
                    child: const Image(
                      width: 152,
                      height: 152,
                      image: AssetImage(ImageAssets.onBoardingLogo1),
                    ),
                  ),
                  SizedBox(
                    height: 19.h,
                  ),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(32),
                          topLeft: Radius.circular(32)),
                      border: Border.all(
                          color: HexColor('#FCC885').withOpacity(0.30),
                          width: 1),
                      color: HexColor('#FFFFFF').withOpacity(0.40),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: 35.h, vertical: 32.h),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            AppStrings.emailAddress.tr(),
                            style: const TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeightManager.regular,
                                fontFamily: FontConstants.cairoFontFamily),
                          ),
                          const SizedBox(
                            height: 8,
                          ),
                          Form(
                              key: formKey,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  customFormField(
                                    valueKey: 'Email',
                                    text: "Example@gmail.com",
                                    hintStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeightManager.medium,
                                        fontFamily:
                                            FontConstants.poppinsFontFamily),
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return 'Email must not be empty';
                                      } else if (!RegExp(
                                              "^[a-zA-Z0-9+_.-]+@[a-zA-Z0-9.-]+.[a-z]")
                                          .hasMatch(value)) {
                                        return 'Please a valid Email';
                                      }
                                      return null;
                                    },
                                    controller: emailController,
                                    type: TextInputType.emailAddress,
                                  ),
                                  SizedBox(
                                    height: 32.h,
                                  ),
                                  Text(
                                    AppStrings.passwordText.tr(),
                                    style: const TextStyle(
                                        fontWeight: FontWeightManager.regular,
                                        fontFamily:
                                            FontConstants.poppinsFontFamily),
                                  ),
                                  const SizedBox(
                                    height: 8,
                                  ),
                                  customFormField(
                                    valueKey: 'Password',
                                    text: "*********",
                                    hintStyle: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeightManager.medium,
                                        fontFamily:
                                            FontConstants.poppinsFontFamily),
                                    validate: (String? value) {
                                      if (value!.isEmpty) {
                                        return "Password must not be empty";
                                      } else {
                                        return null;
                                      }
                                    },
                                    suffix: AuthCubit.get(context).suffix,
                                    suffixPressed: () {
                                      AuthCubit.get(context)
                                          .changePasswordVisibility();
                                    },
                                    obSecureText:
                                        AuthCubit.get(context).isPassword,
                                    controller: passwordController,
                                    type: TextInputType.number,
                                  ),
                                ],
                              )),
                          SizedBox(
                            height: 11.h,
                          ),
                          Transform(
                              transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                              child: Align(
                                  alignment: isRtl()
                                      ? Alignment.bottomLeft
                                      : Alignment.bottomRight,
                                  child: TextButton(
                                      onPressed: () {
                                        navigateTo(
                                            context,
                                            BlocProvider.value(
                                              value: AuthCubit.get(context),
                                              child:
                                                  const ForgetPasswordScreen(),
                                            ));
                                      },
                                      child: Text(
                                        AppStrings.forgetPasswordText.tr(),
                                        style: TextStyle(
                                            color: HexColor('#8281F8'),
                                            fontSize: 14.sp,
                                            fontWeight:
                                                FontWeightManager.semiBold,
                                            fontFamily:
                                                FontConstants.cairoFontFamily),
                                      )))),
                          SizedBox(
                            height: 39.h,
                          ),
                          SizedBox(
                            height: 64.h,
                            width: 320.w,
                            child: ElevatedButton(
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  // validateEmail();
                                  AuthCubit.get(context).userLogin(
                                    email: emailController.text,
                                    password: passwordController.text,
                                  );
                                } else {}
                              },
                              child: ConditionalBuilder(
                                  condition: state is! AppLoginLoadingStates &&
                                      state is! AppLoginSuccessStates,
                                  builder: (BuildContext context) => Text(
                                        AppStrings.loginText.tr(),
                                        style: const TextStyle(
                                            fontSize: 18,
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                FontConstants.cairoFontFamily),
                                      ),
                                  fallback: (BuildContext context) =>
                                      const CircularProgressIndicator(
                                        color: Colors.white,
                                      )),
                              style: ElevatedButton.styleFrom(
                                  elevation: 0.0,
                                  backgroundColor: HexColor('#8281F8'),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(14))),
                            ),
                          ),
                          SizedBox(height: 24.h),
                          Center(
                              child: Text(
                            AppStrings.orSignInWith.tr(),
                            style: const TextStyle(
                                fontSize: 13,
                                fontWeight: FontWeightManager.medium,
                                fontFamily: FontConstants.cairoFontFamily),
                          )),
                          SizedBox(height: 24.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color:
                                          HexColor('#EC8E6C').withOpacity(0.1)),
                                  child: IconButton(
                                    icon: Image.asset(
                                        'assets/images/facebook_icon.png'),
                                    onPressed: () async{
                                      AuthCubit.get(context).facebookSignIn();
                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color:
                                          HexColor('#EC8E6C').withOpacity(0.1)),
                                  child: IconButton(
                                    icon:
                                        Image.asset('assets/images/apple.png'),
                                    onPressed: () {

                                    },
                                  ),
                                ),
                                Container(
                                  padding: const EdgeInsets.all(10),
                                  decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.all(
                                          Radius.circular(10)),
                                      color:
                                          HexColor('#EC8E6C').withOpacity(0.1)),
                                  child: IconButton(
                                    icon:
                                        Image.asset('assets/images/google.png'),
                                    onPressed: () {
                                      AuthCubit.get(context).googleSignIn();
                                    },
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 52.h),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                AppStrings.doNotHaveAccount.tr(),
                                style: const TextStyle(
                                    fontWeight: FontWeightManager.medium,
                                    fontFamily: FontConstants.cairoFontFamily,
                                    fontSize: 16),
                              ),
                              TextButton(
                                  onPressed: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                const RegisterScreen()));
                                  },
                                  child: Text(
                                    AppStrings.createAccount.tr(),
                                    style: TextStyle(
                                        color: HexColor('#8281F8'),
                                        fontSize: 16.sp,
                                        decoration: TextDecoration.underline,
                                        fontWeight: FontWeightManager.medium,
                                        fontFamily:
                                            FontConstants.cairoFontFamily),
                                  ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            ),
          );
        },
      ),
    );
  }
}
