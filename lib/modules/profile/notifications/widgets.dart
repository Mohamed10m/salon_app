import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/fonts_manager.dart';

Widget buildUserDataItem({
  required Color color,
  required Color sColor,
  required Color nColor,
  required String title,
  required String subtitle,
  required String trailing,
}) =>
    Padding(
      padding: EdgeInsets.only(left: 26.w, bottom: 16.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Expanded(
                  child: Row(
                children: [
                  Container(
                    height: 28.h,
                    width: 29.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: nColor,
                        image: DecorationImage(
                          scale: 1.sp,
                          image:
                              const AssetImage(ImageAssets.notificationImage),
                        )),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Container(
                    height: 28.h,
                    width: 29.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(4),
                        color: HexColor('#8281F8'),
                        image: DecorationImage(
                            scale: 1.sp,
                            image: const AssetImage(ImageAssets.userImage),
                            fit: BoxFit.cover)),
                  ),
                  SizedBox(
                    width: 12.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(title,
                          style: const TextStyle(
                            fontWeight: FontWeightManager.bold,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 18,
                          )),
                      SizedBox(
                        width: 8.w,
                      ),
                      Text(subtitle,
                          style: TextStyle(
                            color: HexColor('#212121').withOpacity(0.5),
                            fontWeight: FontWeightManager.light,
                            fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 11,
                          )),
                    ],
                  ),
                ],
              )),
              Text(trailing,
                  style: TextStyle(
                    color: HexColor('#212121').withOpacity(0.5),
                    fontWeight: FontWeightManager.medium,
                    fontFamily: FontConstants.cairoFontFamily,
                    fontSize: 14,
                  )),
            ],
          ),
        ],
      ),
    );
Widget buildNotificationsItem({
  required Color color,
  required Color sColor,
  required String title,
  required String subtitle,
}) =>
    Row(
      children: [
        _cmponant(),
        Expanded(
            child: Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10.0),
              child: Container(
                height: 41,
                width: 29,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage(ImageAssets.userImage),
                )),
              ),
            ),
            SizedBox(width: 12.w),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                        fontWeight: FontWeightManager.semiBold,
                        fontFamily: FontConstants.cairoFontFamily,
                        fontSize: 16,
                      )),
                  const SizedBox(
                    width: 8,
                  ),
                  Text(subtitle,
                      style: TextStyle(
                        color: HexColor('#212121').withOpacity(0.5),
                        fontSize: 10,
                        fontWeight: FontWeightManager.medium,
                        fontFamily: FontConstants.cairoFontFamily,
                      )),
                ],
              ),
            ),
          ],
        )),
        Container(
          height: 32,
          width: 87,
          decoration: BoxDecoration(
              color: HexColor('#7DBE56').withOpacity(0.2),
              borderRadius: BorderRadius.circular(8)),
          child: const Center(
              child: Text('مقبول',
                  style: TextStyle(
                    fontWeight: FontWeightManager.semiBold,
                    fontFamily: FontConstants.cairoFontFamily,
                    fontSize: 13,
                  ))),
        ),
      ],
    );
TextStyle getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}

Widget _cmponant() => Row(
      children: [
        Column(
          children: [
            Container(
              width: 1.5,
              height: 60.h,
              decoration:
                  BoxDecoration(color: HexColor('#000000').withOpacity(0.2)),
            ),
            SizedBox(
              height: 20.h,
            ),
          ],
        ),
        SizedBox(
          width: 6.w,
        ),
        Column(
          children: [
            Container(
              width: 1.5,
              height: 60.h,
              decoration:
                  BoxDecoration(color: HexColor('#000000').withOpacity(0.2)),
            ),
            SizedBox(
              height: 30.h,
            ),
          ],
        ),
        SizedBox(
          width: 10.w,
        ),
      ],
    );
