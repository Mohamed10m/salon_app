import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/forget_password/forget_password/password_changed_successfuly.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/color_manager.dart';
import '../../../shared/componants/componants.dart';

class CreateNewPassword extends StatefulWidget {
  const CreateNewPassword({Key? key}) : super(key: key);

  @override
  State<CreateNewPassword> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<CreateNewPassword> {
  var newPasswordController = TextEditingController();


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
        backgroundColor: ColorManager.scaffoldBackgroundColor,

        body: SingleChildScrollView(
          child: Padding(
            padding:  EdgeInsets.only(top: 96.h,bottom: 277.h,left: 35.h,right: 35.h),
            child: Column(
                children:  [
                  Container(
                    width: 151,
                    height: 151,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(
                                "assets/images/Ellipse 2.png"),
                            fit: BoxFit.cover)),                        child: const Image(

                    image: AssetImage(ImageAssets.newPasswordLogo),
                  ),
                  ),
                  const SizedBox(height: 24,),
                  const Center(child: Text('انشئ كلمة مرور جديده',style: TextStyle(fontWeight:FontWeight.w600,fontSize: 20),)),
                  const SizedBox(height: 11,),
                  Center(child: Text('تغير كلمة المرور',style: TextStyle(fontWeight:FontWeight.w600,fontSize: 12,color: HexColor('#212121').withOpacity(0.30)),)),
                  const SizedBox(
                    height: 48,
                  ),


                  Column(
                    crossAxisAlignment:
                    CrossAxisAlignment.start,
                    children: [
                      const Text('كلمة المرور الجديدة'),
                      SizedBox(
                        height: 11.h,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 25.0),
                        child: customFormField(
                          text: "Example@gmail.com",
                          valueKey: 'Email',
                          validate: (String? value) {
                            if (value!.isEmpty) {
                              //
                            } else {
                              return null;
                            }
                            return null;
                          },

                          controller: newPasswordController,
                        ),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      SizedBox(
                        height: 64,
                        width: double.infinity,
                        child: elevatedButton(
                            text: 'التالى',
                            onPress: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const PasswordChangedSuccessfully()));
                            }
                        ),
                      ),
                    ],
                  ),
                ]),
          ),
        )
    );
  }
}