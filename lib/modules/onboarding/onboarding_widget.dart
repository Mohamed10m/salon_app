import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../shared/componants/app_strings.dart';
import '../../shared/componants/assets_manager.dart';
import 'onboarding_screen.dart';

List<BoardingModel> boarding = [
  BoardingModel(
      container: Container(
        height: 210,
        width: 210,
        decoration:  const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.backgroundLogoImage1),
                fit: BoxFit.cover)),
        child:  const SizedBox(
            height: 50,
            width: 50,
            child: Image(
              image: AssetImage(ImageAssets.onBoardingLogo1),
            )),
      ),
      title: AppStrings.onBoardingTitle1,
      subTitle1: AppStrings.onBoardingSubTitle1,
      subTitle2: AppStrings.onBoardingSubTitle2,
      subTitle3: AppStrings.onBoardingSubTitle3),
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
      title: AppStrings.onBoardingTitle1,
      subTitle1: AppStrings.onBoardingSubTitle1,
      subTitle2: AppStrings.onBoardingSubTitle2,
      subTitle3: AppStrings.onBoardingSubTitle3),
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
      title: AppStrings.onBoardingTitle1,
      subTitle1: AppStrings.onBoardingSubTitle1,
      subTitle2: AppStrings.onBoardingSubTitle2,
      subTitle3: AppStrings.onBoardingSubTitle3),
];

Widget buildBoardingItem(BoardingModel model) => Column(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    model.container,
    const SizedBox(
      height: 80,
    ),
    Text(
      model.title,
      style: TextStyle(
          color: HexColor('#212121'),
          fontWeight: FontWeight.w700,
          fontSize: 25.sp),
    ),
    Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          model.subTitle1,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          model.subTitle2,
          style: TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
        Text(
          model.subTitle3,
          style:  TextStyle(
            fontSize: 14.sp,
            fontWeight: FontWeight.w600,
          ),
        ),
      ],
    ),
  ],
);