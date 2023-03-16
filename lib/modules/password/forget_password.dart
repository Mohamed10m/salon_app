import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/app_strings.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';
import '../../shared/componants/language_type.dart';
import 'create_new_password.dart';
import 'dart:math' as math;

class ForgetPasswordScreen extends StatefulWidget {
  const ForgetPasswordScreen({Key? key}) : super(key: key);

  @override
  State<ForgetPasswordScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<ForgetPasswordScreen> {
  var emailController = TextEditingController();

  var formKey = GlobalKey<FormState>();
  @override
  void dispose() {
    emailController.dispose();
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }

    return Scaffold(
      body: background(
          child: Padding(
        padding:
            EdgeInsets.only(top: 38.h, bottom: 277.h, left: 20.h, right: 35.w),
        child: Column(crossAxisAlignment:isRtl() ? CrossAxisAlignment.end:CrossAxisAlignment.start, children: [
          IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Transform(
                  alignment:
                      isRtl() ? Alignment.bottomLeft : Alignment.bottomLeft,
                  transform: Matrix4.rotationY(isRtl() ? math.pi : 0),
                  child: Padding(
                    padding: EdgeInsets.only(right: 35.0.w),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  ))),
          SizedBox(
            height: 9.h,
          ),
          Padding(
            padding: EdgeInsets.only(left: 15.0.w),
            child: Column(
              children: [
                Center(
                  child: Container(
                    width: 152,
                    height: 152,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage("assets/images/Ellipse 2.png"),
                            fit: BoxFit.cover)),
                    child: const Image(
                      image: AssetImage(ImageAssets.forgetPasswordIcon),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 24,
                ),
                Center(
                    child: Text(
                  AppStrings.forgetPasswordText.tr(),
                  style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontFamily: FontConstants.cairoFontFamily),
                )),
                const SizedBox(
                  height: 11,
                ),
                Center(
                    child: Text(
                  AppStrings.restorePassword.tr(),
                  style: TextStyle(
                      fontWeight: FontWeightManager.medium,
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
                    Text(
                      AppStrings.emailAddress.tr(),
                      style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.cairoFontFamily),
                    ),
                    SizedBox(
                      height: 11.h,
                    ),
                    customFormField(
                      valueKey:'Email' ,
                      text: "Example@gmail.com",
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
                    SizedBox(
                      height: 32.h,
                    ),
                    SizedBox(
                      height: 64,
                      width: double.infinity,
                      child: elevatedButton(
                          text: AppStrings.next.tr(),
                          onPress: () {
                            navigateTo(context,const CreateNewPassword() );

                          }),
                    ),
                  ],
                ),
              ],
            ),
          )
        ]),
      )),
    );
  }
}
