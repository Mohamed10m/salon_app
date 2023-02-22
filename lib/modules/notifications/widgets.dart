import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/assets_manager.dart';

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
              Container(
                height: 28.h,
                width: 29.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8),
                    color: nColor,
                    image: DecorationImage(
                      scale: 1.sp,
                      image: const AssetImage(ImageAssets.notificationImage),
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
                    )),
              ),
              SizedBox(
                width: 12.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 18,
                          fontFamily:
                              'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                  SizedBox(
                    width: 8.w,
                  ),
                  Text(subtitle,
                      style: TextStyle(
                          color: HexColor('#212121').withOpacity(0.5),
                          fontWeight: FontWeight.w400,
                          fontSize: 11,
                          fontFamily:
                              'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                ],
              ),
              SizedBox(
                width: 59.w,
              ),
              Directionality(
                  textDirection: TextDirection.ltr,
                  child: Text(trailing,
                      style: TextStyle(
                          color: HexColor('#212121').withOpacity(0.5),
                          fontWeight: FontWeight.w500,
                          fontSize: 14,
                          fontFamily:
                              'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'))),
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
    Padding(
      padding: EdgeInsets.only(left: 26.w, bottom: 16.h),
      child: Container(
        decoration: BoxDecoration(color: HexColor('#EC8E6C').withOpacity(0.02)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                SizedBox(
                  width: 20.w,
                ),
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
                Padding(
                  padding:
                      const EdgeInsets.only(top: 20.0, bottom: 15, left: 19),
                  child: Row(
                    children: [
                      SizedBox(
                        width: 12.w,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 16,
                                  fontFamily:
                                      'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                          const SizedBox(
                            width: 8,
                          ),
                          Text(subtitle,
                              style: TextStyle(
                                  color: HexColor('#212121').withOpacity(0.5),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 10,
                                  fontFamily:
                                      'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 90.0),
                        child: Container(
                          height: 32,
                          width: 87,
                          decoration: BoxDecoration(
                              color: HexColor('#7DBE56').withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8)),
                          child: const Center(
                              child: Text('مقبول',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                      fontFamily:
                                          'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'))),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
TextStyle getTextStyle(
    double fontSize, FontWeight fontWeight, Color color, fontFamily) {
  return TextStyle(
      fontSize: fontSize,
      fontFamily: fontFamily,
      color: color,
      fontWeight: fontWeight);
}
