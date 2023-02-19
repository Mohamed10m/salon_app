import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_app/shared/componants/color_manager.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var nameController = TextEditingController();
    var emailController = TextEditingController();

    var phoneController = TextEditingController();
    return Scaffold(
        backgroundColor: ColorManager.scaffoldBackgroundColor,
        body: SingleChildScrollView(
          child: Container(
              decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(ImageAssets.background),
                      fit: BoxFit.cover)),
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(
                    top: 53,
                    left: 38,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left: 65.0),
                            child: IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: (const Icon(Icons.arrow_back))),
                          ),
                          const Text(
                            'المعلومات الشخصية',
                            style: TextStyle(
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily:
                                    'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 44),
                      const Image(image: AssetImage(ImageAssets.userImage)),
                      SizedBox(
                        height: 16.h,
                      ),
                      const Text('امنية نهاد'),
                      SizedBox(
                        height: 11.h,
                      ),
                      const Text('example@gmail.com'),
                      SizedBox(
                        height: 32.h,
                      ),
                      Form(
                          key: formKey,
                          child: Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 20.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'الاسم',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 8,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 8,
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
                                      fontSize: 16,
                                      fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(
                                  height: 8,
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
                                SizedBox(
                                  height: 90.h,
                                ),
                              ],
                            ),
                          )),
                    ],
                  ),
                ),
              )),
        ));
  }
}
