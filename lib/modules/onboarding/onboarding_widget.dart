import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/fonts_manager.dart';

import '../../shared/componants/app_strings.dart';
import '../../shared/componants/assets_manager.dart';
import 'onboarding_screen.dart';

List<BoardingModel> boarding = [
  BoardingModel(
      container: Container(
        height: 210,
        width: 210,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.backgroundLogoImage1),
                fit: BoxFit.cover)),
        child: const SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage(ImageAssets.onBoardingLogo1),
            )),
      ),
      title: AppStrings.onBoardingTitle1,
      subTitle: AppStrings.onBoardingSubTitle),
  BoardingModel(
      container: Container(
        height: 210,
        width: 210,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.backgroundLogoImage2),
                fit: BoxFit.cover)),
        child: const SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage(ImageAssets.onBoardingLogo2),
            )),
      ),
      title: AppStrings.onBoardingTitle2,
      subTitle: AppStrings.onBoardingSubTitle),
  BoardingModel(
      container: Container(
        height: 210,
        width: 210,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.backgroundLogoImage3),
                fit: BoxFit.cover)),
        child: const SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage(ImageAssets.onBoardingLogo3),
            )),
      ),
      title: AppStrings.onBoardingTitle3,
      subTitle: AppStrings.onBoardingSubTitle)
];

Widget buildBoardingImage(BoardingModel model) => Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        model.container,
        const SizedBox(height: 30),
        Text(
          model.title,
          style: TextStyle(
              color: HexColor('#212121'),
              fontWeight: FontWeightManager.bold,
              fontFamily: FontConstants.cairoFontFamily,
              fontSize: 25.sp),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 60.0.w),
          child: Text(
            model.subTitle,
            style: TextStyle(
                fontSize: 14.sp,
                fontWeight: FontWeightManager.semiBold,
                fontFamily: FontConstants.cairoFontFamily),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
