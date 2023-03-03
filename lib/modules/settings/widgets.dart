import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/componants/assets_manager.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';

Widget buildSettingsCardItem(
        {required text,
          TextStyle style = const TextStyle(
fontWeight: FontWeight.bold,
fontFamily: FontConstants.cairoFontFamily,
fontSize: 16,
),
         required  HexColor  iconColor ,
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
                child: SvgPicture.asset(image,fit: BoxFit.scaleDown,width: 19.w,height: 19.h,)),
            SizedBox(
              width: 16.w,
            ),
            Text(
              text,
              style: style
            ),
            const Spacer(),
            Directionality(
                textDirection: TextDirection.ltr,
                child: Icon(Icons.arrow_back, color: iconColor)),
          ],
        ),
      ),
      onTap: () {
        navigateTo(context, widget);
      },
    );
