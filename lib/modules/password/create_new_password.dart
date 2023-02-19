import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/color_manager.dart';
import '../../../shared/componants/componants.dart';
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
        backgroundColor: ColorManager.scaffoldBackgroundColor,
        body: Container(
          height:double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.background),
                  fit: BoxFit.cover)),
          child: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                  child: Padding(
                padding: EdgeInsets.only(
                    top: 86.h, bottom: 24.h, left: 35.h, right: 35.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 9.h,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.pop(context);
                          },
                          child: const Icon(Icons.arrow_back)),
                      Center(
                        child: Container(
                          width: 151,
                          height: 151,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/Ellipse 2.png"),
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
                        'انشئ كلمة مرور جديده',
                        style: TextStyle(
                            fontWeight: FontWeight.w600, fontSize: 20),
                      )),
                      const SizedBox(
                        height: 11,
                      ),
                      Center(
                          child: Text(
                        'تغير كلمة المرور',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 12,
                            color: HexColor('#212121').withOpacity(0.30)),
                      )),
                      const SizedBox(
                        height: 48,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('كلمة المرور الجديدة'),
                          SizedBox(
                            height: 11.h,
                          ),
                          customFormField(
                            text: "كلمة المرور الجديده",
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
                          SizedBox(
                            height: 32.h,
                          ),
                          const Text('تاكيد كلمة المرور الجديدة'),
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
                            controller: verifyNewPasswordController,
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
                                              const PasswordChangedSuccessfully()));
                                }),
                          ),
                        ],
                      ),
                    ]),
              ))),
        ));
  }
}
