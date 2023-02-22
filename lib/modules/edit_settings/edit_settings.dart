import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import '../../../shared/componants/assets_manager.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';
import '../password/create_new_password.dart';

class EditSettings extends StatefulWidget {
  const EditSettings({Key? key}) : super(key: key);

  @override
  State<EditSettings> createState() => _EditSettingsState();
}

class _EditSettingsState extends State<EditSettings> {
  bool notify1 = false;
  bool notify2 = false;

  @override
  Widget build(BuildContext context) {
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
                    width: 72.w,
                  ),
                  const Text(
                    'المعلومات الشخصية',
                    style: TextStyle(
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.cairoFontFamily,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 44),
              const Text(
                'إدارة كلمة المرور',
                style: TextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontFamily: FontConstants.cairoFontFamily,
                  fontSize: 18,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {
                  navigateTo(context, const CreateNewPassword());
                },
                child: Container(
                    padding: EdgeInsets.only(
                        left: 29.w, right: 14.w, top: 11.h, bottom: 10),
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.04)),
                    child: Center(
                        child: Row(
                      children: [
                        Container(
                            height: 43.h,
                            width: 43.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        ImageAssets.backgroundIcon))),
                            child: const Image(
                                image: AssetImage(ImageAssets.lockIcon))),
                        SizedBox(
                          width: 17.w,
                        ),
                        const Text(
                          'تغير كلمة المرور',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 16),
                        ),
                        const Spacer(),
                        const Image(image: AssetImage(ImageAssets.typeIcon))
                      ],
                    ))),
              ),
              const SizedBox(height: 32),
              const Text(
                'اللغة',
                style: TextStyle(
                  fontWeight: FontWeightManager.medium,
                  fontFamily: FontConstants.cairoFontFamily,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              InkWell(
                onTap: () {},
                child: Container(
                    padding: EdgeInsets.only(
                        left: 29.w, right: 14.w, top: 11.h, bottom: 10),
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.04)),
                    child: Center(
                        child: Row(
                      children: [
                        Container(
                            height: 43.h,
                            width: 43.w,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        ImageAssets.backgroundIcon))),
                            child: const Image(
                                image: AssetImage(
                                    ImageAssets.changeLanguageIcon))),
                        SizedBox(
                          width: 17.w,
                        ),
                        const Text(
                          'العربية',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 16),
                        ),
                        const Spacer(),
                        const Image(image: AssetImage(ImageAssets.typeIcon))
                      ],
                    ))),
              ),
              const SizedBox(height: 32),
              const Text(
                'الاشعارات',
                style: TextStyle(
                  fontWeight: FontWeightManager.medium,
                  fontFamily: FontConstants.cairoFontFamily,
                  fontSize: 16,
                ),
              ),
              const SizedBox(height: 16),
              Container(
                height: 64.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor("#8281F8").withOpacity(0.04)),
                child: Center(
                  child: ListTile(
                    leading: Container(
                        height: 43,
                        width: 43,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage(ImageAssets.backgroundIcon))),
                        child: const Image(
                            image: AssetImage(ImageAssets.notificationImage))),
                    title: Text('اشعارات عامة',
                        style: Theme.of(context).textTheme.bodyLarge),
                    trailing: Directionality(
                        textDirection: TextDirection.ltr,
                        child: Transform.scale(
                            scale: 0.7,
                            child: CupertinoSwitch(
                              trackColor: HexColor('#C5C5C5'),
                              activeColor: HexColor('#8281F8'),
                              value: notify1,
                              onChanged: (bool newValue) {
                                setState(() {
                                  notify1 = newValue;
                                });
                              },
                            ))),
                    onTap: () {},
                  ),
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Container(
                height: 64.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor("#8281F8").withOpacity(0.04)),
                child: Center(
                  child: ListTile(
                      leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: const Image(
                              image:
                                  AssetImage(ImageAssets.notificationImage))),
                      title: Text('المنبة',
                          style: Theme.of(context).textTheme.bodyLarge),
                      trailing: Directionality(
                          textDirection: TextDirection.ltr,
                          child: Transform.scale(
                              scale: 0.7,
                              child: CupertinoSwitch(
                                trackColor: HexColor('#C5C5C5'),
                                activeColor: HexColor('#8281F8'),
                                value: notify2,
                                onChanged: (bool newValue) {
                                  setState(() {
                                    notify2 = newValue;
                                  });
                                },
                              )))),
                ),
              ),
              SizedBox(
                height: 80.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
