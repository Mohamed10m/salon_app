
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/color_manager.dart';
import '../../../shared/componants/componants.dart';
import '../auth_cubit/auth_cubit.dart';
import '../auth_cubit/auth_states.dart';


class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<RegisterScreen> {
  var nameController = TextEditingController();

  var phoneController = TextEditingController();
  var emailController = TextEditingController();

  var passwordController = TextEditingController();
  var confirmPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit, AuthStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Scaffold(
                backgroundColor: ColorManager.scaffoldBackgroundColor,

                body: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.only(top: 73.h,),
                    child: Column(
                      children: [

                        CircleAvatar(
                          radius: 60,
                          backgroundColor:
                          HexColor('#EC8E6C').withOpacity(0.1),
                          child:  const Image(
                            width: 112,
                            height: 114,
                            image: AssetImage(ImageAssets.onBoardingLogo1),
                          ),
                        ),
                        const SizedBox(height: 24,),

                        Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(32),
                                topLeft: Radius.circular(32)),
                            border:  Border.all(color: HexColor('#FCC885').withOpacity(0.30),width: 1),
                            color: HexColor('#FFFFFF'),
                          ),
                          child: Padding(
                            padding:  EdgeInsets.symmetric(horizontal: 35.h,vertical: 32.h),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [

                                Form(
                                    key: formKey,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment.start,
                                      children: [
                                        const Text('الاسم',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: customFormField(
                                            text: "Example",
                                            valueKey: 'Name',
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Name must not be empty";
                                              } else {
                                                return null;
                                              }
                                            },

                                            controller: nameController,
                                            type: TextInputType.name,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),    const Text('رقم الهاتف',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: customFormField(
                                            text: "+966 545 254 ",
                                            valueKey: 'Phone Number',
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Name must not be empty";
                                              } else {
                                                return null;
                                              }
                                            },

                                            controller: phoneController,
                                            type: TextInputType.number,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),     const Text('البريد الالكتروني',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: customFormField(
                                            text: "Example@gmail.com",
                                            valueKey: 'Email',
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Email must not be empty";
                                              } else {
                                                return null;
                                              }
                                            },

                                            controller: emailController,
                                            type: TextInputType.emailAddress,
                                          ),
                                        ),
                                        SizedBox(
                                          height: 32.h,
                                        ),
                                        const Text('كلمة المرور',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: customFormField(

                                            text: "كلمة المرور",
                                            valueKey: 'Password',
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Password must not be empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                            suffix:
                                            AuthCubit.get(context).suffix,
                                            suffixPressed: () {
                                              AuthCubit.get(context)
                                                  .changePasswordVisibility();
                                            },
                                            obSecureText:
                                            AuthCubit.get(context)
                                                .isPassword,
                                            controller: passwordController,
                                          ),
                                        ),  SizedBox(
                                          height: 32.h,
                                        ),
                                        const Text('تأكيد كلمة المرور',style: TextStyle(fontSize: 16,fontWeight: FontWeight.w400),),
                                        Padding(
                                          padding: const EdgeInsets.symmetric(
                                              horizontal: 24.0),
                                          child: customFormField(

                                            text: "تأكيد كلمة المرور",
                                            valueKey: 'Confirm Password',
                                            validate: (String? value) {
                                              if (value!.isEmpty) {
                                                return "Password must not be empty";
                                              } else {
                                                return null;
                                              }
                                            },
                                            suffix:
                                            AuthCubit.get(context).suffix,
                                            suffixPressed: () {
                                              AuthCubit.get(context)
                                                  .changePasswordVisibility();
                                            },
                                            obSecureText:
                                            AuthCubit.get(context)
                                                .isPassword,
                                            controller: confirmPasswordController,
                                          ),
                                        ),
                                      ],
                                    )),

                                SizedBox(height: 39.h,),
                                SizedBox(
                                  height: 64.h,
                                  width: 320.w,
                                  child: ElevatedButton(

                                    onPressed: () {
                                      if (formKey.currentState!.validate()) {
                                        // //
                                      }
                                    },
                                    child: const Text(
                                      'انشاء حساب',
                                      style: TextStyle(fontSize: 18,fontWeight: FontWeight.w700),
                                    ),
                                    style: ElevatedButton.styleFrom(
                                        primary: HexColor('#8281F8'),
                                        shape: RoundedRectangleBorder(
                                            borderRadius:
                                            BorderRadius.circular(10))),
                                  ),
                                ),
                                SizedBox(
                                  height: 24.h,
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
            }
        )
    );

  }
}