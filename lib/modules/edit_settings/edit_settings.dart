import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/color_manager.dart';
import '../../../shared/componants/assets_manager.dart';
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
      backgroundColor: ColorManager.scaffoldBackgroundColor,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.background), fit: BoxFit.cover)),
        child: SingleChildScrollView(
          child: Directionality(
            textDirection: TextDirection.rtl,
            child: Padding(
              padding: const EdgeInsets.only(
                top: 53,
                left: 38,
                right: 35,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 104.0),
                        child: IconButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            icon: (const Icon(Icons.arrow_back))),
                      ),
                      const Text(
                        'الاعدادات',
                        style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: 16,
                            fontFamily:
                                'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                      ),
                    ],
                  ),
                  const SizedBox(height: 44),
                  const Text(
                    'إدارة كلمة المرور',
                    style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 18,
                        fontFamily:
                            'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('تغير كلمة المرور',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const CreateNewPassword()));
                        },
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'اللغة',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily:
                            'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('العربية',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {},
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  const Text(
                    'الاشعارات',
                    style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 16,
                        fontFamily:
                            'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                  ),
                  const SizedBox(height: 16),
                  Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
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
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                          leading: Container(
                            height: 43,
                            width: 43,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: AssetImage(
                                        ImageAssets.backgroundIcon))),
                            child: Icon(
                              Icons.person,
                              color: HexColor('#8281F8'),
                            ),
                          ),
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
        ),
      ),
    );
  }
}
