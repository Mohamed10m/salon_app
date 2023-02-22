import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var nameController = TextEditingController();
    var emailController = TextEditingController();

    var phoneController = TextEditingController();
    return Scaffold(
        body: background(
      child: Padding(
        padding: EdgeInsets.only(top: 53.h, right: 38.w, left: 36.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Icon(Icons.arrow_back)),
                SizedBox(
                  width: 84.w,
                ),
                const Text(
                  'المعلومات الشخصية',
                  style: TextStyle(
                    fontWeight: FontWeightManager.bold,
                    fontFamily: FontConstants.cairoFontFamily,                    fontSize: 16,
                  ),
                ),
              ],
            ),
            SizedBox(height: 67.h),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                const Image(image: AssetImage(ImageAssets.userImage)),
                SizedBox(
                  height: 16.h,
                ),
                const Text('امنية نهاد',style: TextStyle(  fontWeight: FontWeightManager.bold,
                    fontFamily: FontConstants.cairoFontFamily,fontSize: 20),),
                SizedBox(
                  height: 11.h,
                ),
                 Text('example@gmail.com',style: TextStyle(fontSize: 12,  fontWeight: FontWeightManager.semiBold,
    fontFamily: FontConstants.cairoFontFamily,color: HexColor('#212121').withOpacity(0.50)),),
                SizedBox(
                  height: 32.h,
                ),
                Form(
                    key: formKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'الاسم',
                          style: TextStyle(
                              fontSize: 16 , fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,),
                        ),
                         SizedBox(
                          height: 8.h,
                        ),
                        customFormField(
                          text: "Example",
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
                        SizedBox(
                          height: 32.h,
                        ),
                        const Text(
                          'البريد الالكتروني',
                          style: TextStyle(
                              fontSize: 16,  fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily,),
                        ),
                         SizedBox(
                          height: 8.h,
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
                        const Text(
                          'رقم الهاتف',
                          style: TextStyle(
                              fontSize: 16,  fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily,),
                        ),
                         SizedBox(
                          height: 8.h,
                        ),
                        customFormField(
                          text: "+966 545 254 ",
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
                      ],
                    )),
              ],
            )
          ],
        ),
      ),
    ));
  }
}
