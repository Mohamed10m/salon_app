import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/help_center/help_center.dart';
import 'package:salon_app/modules/payment/payment_screen.dart';
import 'package:salon_app/modules/settings/widgets.dart';
import 'package:salon_app/shared/componants/app_strings.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';
import 'package:salon_app/shared/componants/componants.dart';
import 'package:salon_app/shared/componants/language_type.dart';

import '../../layout/cubut/home_layout_cubit.dart';
import '../../layout/cubut/home_layout_states.dart';
import '../../shared/componants/app_constane.dart';
import '../../shared/componants/fonts_manager.dart';
import '../appointment/my_appointment.dart';
import '../edit_settings/edit_settings.dart';
import '../profile/profile_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }
    var cubit = HomeLayoutCubit.get(context).userModel;

    return ConditionalBuilder(
        condition: cubit != null,
        builder: (BuildContext context) =>  BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
            listener: (context, state) {},
            builder: (context, state) {
              return Padding(
                  padding: EdgeInsets.only(right: 20.0.w, left: 20.w),
                  child: Column(
                    children: [
                      SizedBox(
                        height: 81.h,
                      ),
                      const Image(image: AssetImage(ImageAssets.userImage)),
                      SizedBox(
                        height: 16.h,
                      ),
                      Text(
                        HomeLayoutCubit.get(context).userModel!.name,
                        // cubit.userDataModel!.name!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          fontFamily: FontConstants.cairoFontFamily,
                          fontSize: 20,
                        ),
                      ),
                      SizedBox(
                        height: 11.h,
                      ),
                      Text(
                        HomeLayoutCubit.get(context).userModel!.email,
                        style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 12,
                            color: HexColor('#212121').withOpacity(0.5),
                            fontFamily: 'Poppins'),
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      Transform(
                          transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                          child:  buildSettingsCardItem(
                              leftWidth: isRtl() ? 27 : 10,
                              rightWidth: isRtl() ? 10 : 27,
                              color: HexColor("#8281F8").withOpacity(0.04),
                              iconColor: HexColor('#8281F8'),
                              text: AppStrings.personalInformation.tr(),
                              image: ImageAssets.personIconSvg,
                              context: context,
                              function: (){
                                navigateTo(context,  BlocProvider.value(
                                    value: HomeLayoutCubit.get(context)..getUserData(),
                                child: const ProfileScreen())
                                );
                              },
                            ),
                          ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                          child: buildSettingsCardItem(
                            leftWidth: isRtl() ? 27 : 10,
                            rightWidth: isRtl() ? 10 : 27,
                            color: HexColor("#8281F8").withOpacity(0.04),
                            text: AppStrings.setting.tr(),
                            iconColor: HexColor('#8281F8'),
                            image: ImageAssets.settingsIcon,
                            context: context,
                            function: (){
                              navigateTo(context, const EditSettings());
                            },
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                          child: buildSettingsCardItem(
                            leftWidth: isRtl() ? 27 : 10,
                            rightWidth: isRtl() ? 10 : 27,
                            color: HexColor("#8281F8").withOpacity(0.04),
                            text: AppStrings.appointments.tr(),
                            iconColor: HexColor('#8281F8'),
                            image: ImageAssets.appointmentIcon,
                            context: context,
                            function: (){
                              navigateTo(context,BlocProvider.value(
                                value: HomeLayoutCubit.get(context)..getChooseServicesData(),
                                child:  const MyAppointments(),));
                            },
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                          child: buildSettingsCardItem(
                            leftWidth: isRtl() ? 27 : 10,
                            rightWidth: isRtl() ? 10 : 27,
                            color: HexColor("#8281F8").withOpacity(0.04),
                            text: AppStrings.payment.tr(),
                            iconColor: HexColor('#8281F8'),
                            image: ImageAssets.cardIcon,
                            context: context,
                            function: (){
                              navigateTo(context, const PaymentScreen());
                            },
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                          child: buildSettingsCardItem(
                            leftWidth: isRtl() ? 27 : 10,
                            rightWidth: isRtl() ? 10 : 27,
                            color: HexColor("#8281F8").withOpacity(0.04),
                            text: AppStrings.helpCenter.tr(),
                            iconColor: HexColor('#8281F8'),
                            image: ImageAssets.helpIcon,
                            context: context,
                            function: (){
                              navigateTo(context, const HelpCenterScreen());
                            },
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      Transform(
                          alignment: Alignment.centerLeft,
                          transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                          child: buildSettingsCardItem(
                            leftWidth: isRtl() ? 27 : 10,
                            rightWidth: isRtl() ? 10 : 27,
                            color: HexColor("#FF725E").withOpacity(0.06),
                            text: AppStrings.logout.tr(),
                            style: TextStyle(
                              color: HexColor('#FF725E'),
                              fontWeight: FontWeight.bold,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 16,
                            ),
                            iconColor: HexColor('#FF725E'),
                            image: ImageAssets.logoutIcon,
                            context: context,
                            function:(){
                              signOut(context);
                            },
                          )),
                    ],
                  ));
            }), fallback: (context)=>const Center(
        child: CircularProgressIndicator()));



  }
}
