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
  required FittedBox container,
  required String image,
}) =>
    FittedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Row(
                children: [
              container,

              SizedBox(
                width: 12.w,
              ),

              Container(
                height: 26.h,
                width: 27.w,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: HexColor('#8281F8'),
                    image: const DecorationImage(
                      image: AssetImage(ImageAssets.userImage),
                    )),
              ),
              SizedBox(
                width: 12.w,
              ),
              Padding(
                padding: EdgeInsets.only(top: 22.0.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(title,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.cairoFontFamily,
                          fontSize: 18,
                        )),
                    SizedBox(
                      width: 8.w,
                    ),
                    Text(subtitle,
                        style: TextStyle(
                          color: HexColor('#212121').withOpacity(0.5),
                          fontWeight: FontWeightManager.medium,
                          fontFamily: FontConstants.cairoFontFamily,
                          fontSize: 11,
                        )),
                  ],
                ),
              ),
                ],
              ),
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
  required Container container,
  required int leftWidth,
  required int rightWidth,
  required Color iconColor
}) =>
    FittedBox(
      child: Row(
        children: [
          _cmponant(),
          SizedBox(width: 20.w,),
          Container(
            color: HexColor('#FFFFFF').withOpacity(0.11),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 48.0.h, right:rightWidth.w, left:leftWidth.w),
                  child: Container(
                    height: 21.h,
                    width: 21.w,
                    decoration:  BoxDecoration(
                      color: iconColor
                    ),
                    child: const Image(image: AssetImage(ImageAssets.type,))
                  ),
                ),
                Padding(
                  padding:  EdgeInsets.only(bottom: 24.0.h),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(title,
                              style: const TextStyle(
                                fontWeight: FontWeightManager.semiBold,
                                fontFamily: FontConstants.cairoFontFamily,
                                fontSize: 16,
                              )),
                           SizedBox(
                            width: 8.w,
                          ),
                          Row(
                            children: [
                              Text(subtitle,
                                  style: TextStyle(
                                    color: HexColor('#212121').withOpacity(0.5),
                                    fontSize: 11,
                                    fontWeight: FontWeightManager.medium,
                                    fontFamily: FontConstants.cairoFontFamily,
                                  )),
                              SizedBox(width: 21.w,),
                              container
                            ],
                          ),
                        ],
                      ),

                    ],
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );

Widget _cmponant() => Row(
  children: [
    Column(
      children: [
        Container(
          width: 1.w,
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
          width: 1.w,
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
