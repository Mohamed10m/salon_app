import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/auth/auth_cubit/auth_cubit.dart';
import 'package:salon_app/modules/auth/auth_cubit/auth_states.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';
import 'password_changed_successfully.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CreateNewPassword> {
  var newPasswordController = TextEditingController();
  var verifyNewPasswordController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    newPasswordController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body:


        background(
      child: BlocProvider(
        create: (BuildContext context) => AuthCubit(),
        child: BlocConsumer<AuthCubit,AuthStates>(builder: (context,state){
          return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Padding(
              padding: EdgeInsets.only(left: 26.w, top: 37.h),
              child: Align(
                  alignment: Alignment.centerLeft,
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back)))),
            ),
            SizedBox(
              height: 9.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 35.w, left: 36.w, bottom: 154.h),
              child: Column(
                children: [
                  Center(
                    child: Container(
                      width: 151,
                      height: 151,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage("assets/images/Ellipse 2.png"),
                              fit: BoxFit.cover)),
                      child: const Image(
                        image: AssetImage(ImageAssets.newPasswordLogo),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  const Center(
                      child: Text(
                        'انشئ كلمة مرور جديدة',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 20),
                      )),
                  const SizedBox(
                    height: 11,
                  ),
                  Center(
                      child: Text(
                        'تغير كلمة المرور',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 12,
                            color: HexColor('#212121').withOpacity(0.30)),
                      )),
                  const SizedBox(
                    height: 48,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'كلمة المرور الجديدة',
                        style: TextStyle(
                            fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      customFormField(
                        text: "كلمة المرور الجديدة",
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            //
                          } else {
                            return null;
                          }
                          return null;
                        },

                        suffix: AuthCubit.get(context).suffix,
                        suffixPressed: () {
                          AuthCubit.get(context)
                              .changePasswordVisibility();
                        },
                        obSecureText:
                        AuthCubit.get(context).isPassword,
                        controller: newPasswordController,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      const Text('تاكيد كلمة المرور الجديدة',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily)),
                      SizedBox(
                        height: 11.h,
                      ),
                      customFormField(
                        text: "تاكيد كلمة المرور الجديدة",
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            //
                          } else {
                            return null;
                          }
                          return null;
                        },
                        suffix: AuthCubit.get(context).suffix,
                        suffixPressed: () {
                          AuthCubit.get(context)
                              .changePasswordVisibility();
                        },
                        obSecureText:
                        AuthCubit.get(context).isPassword,
                        controller: verifyNewPasswordController,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      SizedBox(
                        height: 64,
                        width: double.infinity,
                        child: elevatedButton(
                            text: 'تغير كلمة المرور',
                            onPress: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) =>
                                      const PasswordChangedSuccessfully()));
                            }),
                      ),
                    ],
                  ),
                ],
              ),
            )
          ]);
        }, listener: ((context, state) {

        })),
      )
    ));
  }
}
