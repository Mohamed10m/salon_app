import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/home/widgets.dart';
import 'package:salon_app/shared/componants/app_strings.dart';
import 'package:salon_app/shared/componants/componants.dart';

import '../../layout/cubut/home_layout_cubit.dart';
import '../../layout/cubut/home_layout_states.dart';
import '../../shared/componants/assets_manager.dart';
import '../../shared/componants/fonts_manager.dart';
import '../appointment/add_appointment.dart';
import '../profile/notifications/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context).userModel;
          return ConditionalBuilder(
              condition: cubit != null,
              builder: (BuildContext context) => Column(children: [
                    Padding(
                      padding: EdgeInsets.only(
                          top: 60.h, right: 34.w, left: 36.w, bottom: 40.h),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 59.h,
                            width: 58.w,
                            child: const Image(
                              image: AssetImage(ImageAssets.userImage),
                            ),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          Text(
                            HomeLayoutCubit.get(context).userModel!.name,
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 16,
                            ),
                          ),
                          const Spacer(),
                          InkWell(
                            child: Container(
                              height: 19,
                              width: 21,
                              decoration: const BoxDecoration(
                                  image: DecorationImage(
                                image:
                                    AssetImage(ImageAssets.notificationImage),
                              )),
                            ),
                            onTap: () {
                              navigateTo(
                                  context,
                                  BlocProvider.value(
                                      value: HomeLayoutCubit.get(context)
                                        ..getUserData(),
                                      child: const NotificationsScreen()));
                            },
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(right: 34.w, left: 36.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Text(AppStrings.myAppointment.tr(),
                                  style: const TextStyle(
                                    fontWeight: FontWeightManager.semiBold,
                                    fontFamily: FontConstants.cairoFontFamily,
                                    fontSize: 16,
                                  )),
                              const Spacer(),
                              InkWell(
                                child: Row(
                                  children: [
                                    Container(
                                      height: 13,
                                      width: 13,
                                      decoration: const BoxDecoration(
                                          image: DecorationImage(
                                        image: AssetImage(ImageAssets.vector),
                                      )),
                                    ),
                                    const SizedBox(
                                      width: 6,
                                    ),
                                    Text(AppStrings.add.tr(),
                                        style: TextStyle(
                                          color: HexColor('#8281F8'),
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                          fontSize: 12,
                                        ))
                                  ],
                                ),
                                onTap: () {
                                  navigateTo(
                                      context, const AddAppointmentScreen());
                                },
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          Container(
                              height: 146.h,
                              width: 320.w,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: HexColor('#FFFFFF').withOpacity(0.32),
                              ),
                              child: Padding(
                                padding: EdgeInsets.only(
                                  top: 16.h,
                                  right: 16.w,
                                  left: 16.w,
                                  bottom: 19.h,
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      children: [
                                        Container(
                                          height: 43.h,
                                          width: 43.w,
                                          decoration: BoxDecoration(
                                            color: HexColor('#FFC57B'),
                                            borderRadius:
                                                BorderRadius.circular(25),
                                          ),
                                          child: const Image(
                                            image: AssetImage(
                                                ImageAssets.barberName),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 13.h,
                                        ),
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              AppStrings.barberName.tr(),
                                              style: const TextStyle(
                                                fontWeight: FontWeight.bold,
                                                fontFamily: FontConstants
                                                    .cairoFontFamily,
                                              ),
                                            ),
                                            SizedBox(
                                              height: 5.h,
                                            ),
                                            const Text(
                                              'التاريخ: 2023 ,oct 9',
                                              style: TextStyle(
                                                fontWeight:
                                                    FontWeightManager.semiBold,
                                                fontFamily: FontConstants
                                                    .cairoFontFamily,
                                              ),
                                            ),
                                          ],
                                        ),
                                        const Spacer(),
                                        Text(
                                          '11:00 AM',
                                          style: TextStyle(
                                            color: HexColor('#EC8E6C'),
                                            fontWeight: FontWeight.bold,
                                            fontFamily:
                                                FontConstants.cairoFontFamily,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 21.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 28.h,
                                          width: 71.w,
                                          decoration: BoxDecoration(
                                              color: HexColor('#EC8E6C'),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: FittedBox(
                                            child: Text(
                                              AppStrings.makeup.tr(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                    FontWeightManager.medium,
                                                fontFamily: FontConstants
                                                    .cairoFontFamily,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 19.w),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 28.h,
                                          width: 74.w,
                                          decoration: BoxDecoration(
                                              color: HexColor('#8281F8'),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: FittedBox(
                                            child: Text(
                                              AppStrings.hairStyle.tr(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                    FontWeightManager.medium,
                                                fontFamily: FontConstants
                                                    .cairoFontFamily,
                                              ),
                                            ),
                                          ),
                                        ),
                                        SizedBox(width: 19.w),
                                        Container(
                                          alignment: Alignment.center,
                                          height: 28.h,
                                          width: 74.w,
                                          decoration: BoxDecoration(
                                              color: HexColor('#FFC57B'),
                                              borderRadius:
                                                  BorderRadius.circular(8)),
                                          child: FittedBox(
                                            child: Text(
                                              AppStrings.shaving.tr(),
                                              style: const TextStyle(
                                                color: Colors.white,
                                                fontWeight:
                                                    FontWeightManager.medium,
                                                fontFamily: FontConstants
                                                    .cairoFontFamily,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                            height: 16.h,
                          ),
                          Text(
                            AppStrings.bookAService.tr(),
                            style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: FontConstants.cairoFontFamily,
                                fontSize: 16),
                          ),
                          SizedBox(
                            height: 16.h,
                          ),
                          buildCardItem(
                              title: AppStrings.hairdressing.tr(),
                              trailing: AppStrings.date.tr(),
                              tColor: HexColor('#EC8E6C'),
                              color: HexColor('#FCC885').withOpacity(0.06),
                              sColor: HexColor('#FCC885'),
                              subtitle: AppStrings.shaveText1.tr()),
                          const SizedBox(
                            height: 16,
                          ),
                          buildCardItem(
                              title: AppStrings.shaving.tr(),
                              trailing: AppStrings.date.tr(),
                              tColor: HexColor('#8281F8'),
                              color: HexColor('#8281F8').withOpacity(0.06),
                              sColor: HexColor('#8281F8'),
                              subtitle: AppStrings.shaveText1.tr()),
                          const SizedBox(
                            height: 16,
                          ),
                          buildCardItem(
                              title: AppStrings.makeup.tr(),
                              trailing: AppStrings.date.tr(),
                              tColor: HexColor('#EC8E6C'),
                              color: HexColor('#EC8E6C').withOpacity(0.06),
                              sColor: HexColor('#EC8E6C'),
                              subtitle: AppStrings.shaveText1.tr()),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 24.h,
                    ),
                  ]),
              fallback: (context) =>
                  Column(
                    children: const [
                      Center(child: CircularProgressIndicator()),
                    ],
                  ));
        });
  }
}
