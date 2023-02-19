import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/color_manager.dart';

class PasswordChangedSuccessfully extends StatelessWidget {
  const PasswordChangedSuccessfully({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManager.scaffoldBackgroundColor,
      body: Center(
          child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.background), fit: BoxFit.cover)),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          Container(
            height: 294,
            width: 294,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.backgroundLogoImage2),
                    fit: BoxFit.cover)),
            child: const SizedBox(
                height: 165,
                width: 166,
                child: Image(
                  image: AssetImage(ImageAssets.changePasswordSuccessfully),
                )),
          ),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'تم تغير كلمة المرور بنجاح',
                style: TextStyle(
                  fontSize: 19.sp,
                  fontWeight: FontWeight.w700,
                ),
              )),
          SizedBox(
            height: 5.h,
          ),
          Directionality(
              textDirection: TextDirection.rtl,
              child: Text(
                'سجل الدخول الان لحجز موعدك',
                style: TextStyle(
                  color: HexColor('#212121').withOpacity(0.5),
                  fontSize: 14.0.sp,
                  fontWeight: FontWeight.w500,
                ),
              ))
        ]),
      )),
    );
  }
}
