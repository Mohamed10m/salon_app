import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/app_strings.dart';

import '../../shared/componants/assets_manager.dart';
import '../../shared/componants/fonts_manager.dart';

Widget buildCardItem({
  required Color color,
  required Color sColor,
  required Color tColor,
  required String title,
  required String subtitle,
  required String trailing,
}) =>
    FittedBox(
      child: Container(
          height: 132.h,
          width: 320.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: color,
          ),
          child: Padding(
            padding:
                EdgeInsets.only(top: 16.h, right: 17.w, left: 16.w, bottom: 16.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Container(
                      height: 51.h,
                      width: 51.w,
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                        image: AssetImage(ImageAssets.hairImage),
                      )),
                    ),
                    SizedBox(
                      width: 15.w,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(title,
                            style: const TextStyle(
                            fontWeight: FontWeightManager.semiBold,
                            fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 14,
                            )),
                        Text(subtitle,
                            style: TextStyle(
                            fontWeight: FontWeightManager.regular,
                            fontFamily: FontConstants.cairoFontFamily,
                              color: HexColor('#212121').withOpacity(0.60),
                              fontSize: 11,
                            )),
                      ],
                    ),
                    const Spacer(),
                    Text(
                      trailing,
                      style: TextStyle(
                      fontWeight: FontWeightManager.bold,
                      fontFamily: FontConstants.cairoFontFamily,
                        color:tColor,
                        fontSize: 13,
                      ),
                    ),
                     SizedBox(
                      height: 18.h,
                    )
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(right: 64.w, top: 16.h),
                  child: Container(
                    height: 32.h,
                    width: 98.w,
                    decoration: BoxDecoration(
                        color: sColor, borderRadius: BorderRadius.circular(8)),
                    child:  Center(
                      child: Text(AppStrings.bookService.tr(),
                          style: const TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeightManager.medium,
                          fontFamily: FontConstants.cairoFontFamily,
                            fontSize: 12,
                          )),
                    ),
                  ),
                ),
              ],
            ),
          )),
    );
