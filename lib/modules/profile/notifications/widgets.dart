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
  required Container container,
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
                  SizedBox(
                    width: 10.w,
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
                              fontWeight: FontWeightManager.light,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 11,
                            )),
                      ],
                    ),
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
  required Container container,
}) =>
    Row(
      children: [
        _cmponant(),
        Expanded(
          child: Container(
            color: HexColor('#FFFFFF').withOpacity(0.11),
            child: Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(bottom: 48.0.h, right: 19.w),
                  child: Container(
                    height: 21.h,
                    width: 21.w,
                    decoration:  BoxDecoration(
                      color: HexColor('#8281F8').withOpacity(0.20)
                    ),
                    child: const Image(image: AssetImage(ImageAssets.type,))
                  ),
                ),
                SizedBox(width: 12.w),
                Row(
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
                        Text(subtitle,
                            style: TextStyle(
                              color: HexColor('#212121').withOpacity(0.5),
                              fontSize: 10,
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
                            )),
                      ],
                    ),
                    SizedBox(width: 21.w,),
                    container
                  ],
                ),
              ],
            ),
          ),
        ),

      ],
    );

Widget _cmponant() => Padding(
      padding: EdgeInsets.only(right: 9.0.w),
      child: Row(
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
      ),
    );
