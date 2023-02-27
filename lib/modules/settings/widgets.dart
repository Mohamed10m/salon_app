import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/componants/assets_manager.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

Widget buildSettingsCardItem(
        {required text,
        required image,
        required widget,
        context,
        required Color color}) =>
    InkWell(
      child: Container(
        padding:
            EdgeInsets.only(bottom: 10.h, top: 10.h, right: 10.w, left: 27.w),
        height: 64.h,
        width: 320.w,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16), color: color),
        child: Row(
          children: [
            Container(
                height: 43,
                width: 43,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage(ImageAssets.backgroundIcon))),
                child: Image(image: AssetImage(image))),
            SizedBox(
              width: 16.w,
            ),
            Text(
              text,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontFamily: FontConstants.cairoFontFamily,
                fontSize: 16,
              ),
            ),
            const Spacer(),
            Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(Icons.arrow_back, color: HexColor('#8281F8'))),
          ],
        ),
      ),
      onTap: () {
        navigateTo(context, widget);
      },
    );
