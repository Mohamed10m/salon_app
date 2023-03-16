import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/app_strings.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import '../../layout/cubut/home_layout_cubit.dart';
import '../../layout/cubut/home_layout_states.dart';
import '../../shared/componants/fonts_manager.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);



  @override
  Widget build(BuildContext context) {

    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController phoneController = TextEditingController();


    var formKey=GlobalKey<FormState>();
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {

          var cubit =  HomeLayoutCubit.get(context).userModel;

          if(cubit !=null) {
            nameController.text = cubit.name;
            emailController.text = cubit.email;
            phoneController.text = cubit.phone;
          }

          return Scaffold(
              body: background(
                child: Padding(
                  padding: EdgeInsets.only(top: 54.h, right: 35.w, left: 35.w),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(0.0),
                            child: InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: const Icon(Icons.arrow_back)),
                          ),
                          SizedBox(width: 62.w,),

                          Text(
                            AppStrings.personalInformation.tr(),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.only(top: 67.0.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            const Image(image: AssetImage(ImageAssets.userImage)),
                            SizedBox(
                              height: 16.h,
                            ),
                            Text(
                              HomeLayoutCubit.get(context).userModel!.name,
                              style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: FontConstants.cairoFontFamily,
                                  fontSize: 20),
                            ),

                            Text(
                              HomeLayoutCubit.get(context).userModel!.email,
                              style: TextStyle(
                                  fontSize: 12,
                                  fontWeight: FontWeightManager.semiBold,
                                  fontFamily: FontConstants.cairoFontFamily,
                                  color: HexColor('#212121').withOpacity(0.50)),
                            ),
                            SizedBox(
                              height: 32.h,
                            ),
                            Form(
                                key: formKey,
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      AppStrings.name.tr(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeightManager.medium,
                                        fontFamily: FontConstants.cairoFontFamily,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),


                                    customFormField(
                                      valueKey: 'Name',
                                      text: 'name',
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
                                    Text(
                                      AppStrings.emailAddress.tr(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeightManager.medium,
                                        fontFamily: FontConstants.cairoFontFamily,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    customFormField(
                                      valueKey: 'Email',

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
                                    Text(
                                      AppStrings.phoneText.tr(),
                                      style: const TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeightManager.medium,
                                        fontFamily: FontConstants.cairoFontFamily,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 8.h,
                                    ),
                                    customFormField(
                                      valueKey: 'Phone',

                                      text: "+05xxxxxxxx ",
                                      hintStyle: const TextStyle(
                                        fontFamily: FontConstants.cairoFontFamily,
                                      ),
                                      validate: (String? value) {
                                        if (value!.isEmpty) {
                                          return "Phone must not be empty";
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
                        ),
                      )
                    ],
                  ),
                ),
              ));
        }
    );
  }
}
