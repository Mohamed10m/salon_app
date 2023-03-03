import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';
import 'create_new_password.dart';

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
    return Scaffold(
      body: background(
        child: Padding(
          padding: EdgeInsets.only(
              top: 38.h, bottom: 277.h, left: 20.h, right: 35.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            Align(
              alignment: Alignment.centerLeft,
              child: Directionality(
                  textDirection: TextDirection.ltr,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: const Icon(
                        Icons.arrow_back,
                        color: Colors.black,
                      ))),
            ),
            SizedBox(
              height: 9.h,
            ),
           Padding(
             padding:  EdgeInsets.only(left: 15.0.w),
             child: Column(children: [
               Center(
                 child: Container(
                   width: 112,
                   height: 114,
                   decoration: const BoxDecoration(
                       image: DecorationImage(
                           image: AssetImage("assets/images/Ellipse 2.png"),
                           fit: BoxFit.cover)),
                   child: const Image(
                     image: AssetImage(ImageAssets.onBoardingLogo1),
                   ),
                 ),
               ),
               const SizedBox(
                 height: 24,
               ),
               const Center(
                   child: Text(
                     'هل نسيت كلمة المرور؟',
                     style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                         fontFamily: FontConstants.cairoFontFamily),
                   )),
               const SizedBox(
                 height: 11,
               ),
               Center(
                   child: Text(
                     'استعد كلمة المرور من خلال بريدك الالكتروني',
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
                   const Text(
                     'البريد الالكتروني',
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontFamily: FontConstants.cairoFontFamily),
                   ),
                   SizedBox(
                     height: 11.h,
                   ),
                   customFormField(
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
                         text: 'التالى',
                         onPress: () {
                           Navigator.push(
                               context,
                               MaterialPageRoute(
                                   builder: (context) =>
                                   const CreateNewPassword()));
                         }),
                   ),
                 ],
               ),
             ],),
           )
          ]),
        ),
      ),
    );
  }
}
