import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/profile/notifications/widgets.dart';

import '../../../layout/cubut/home_layout_cubit.dart';
import '../../../layout/cubut/home_layout_states.dart';
import '../../../shared/componants/app_strings.dart';
import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/fonts_manager.dart';
import '../../../shared/componants/language_type.dart';

class AcceptNotifications extends StatefulWidget {
  const AcceptNotifications({Key? key,required this.index}) : super(key: key);
final int index;
  @override
  _State createState() => _State(index: index);
}

class _State extends State<AcceptNotifications> {
  _State({required this.index});
  bool isPressed = false;
final int index;
  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }

    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = HomeLayoutCubit.get(context).userModel;

          return InkWell(
            onTap: () {
              setState(() {
                isPressed = !isPressed;
              });
            },
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(
                      left: isRtl() ? 26 : 0,
                      bottom: 16.h,
                      right: isRtl() ? 0 : 26),
                  child: buildUserDataItem(
                      image: ImageAssets.notIcon,
                      container: FittedBox(
                        child: Container(
                          height: 26.h,
                          width: 27.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(4),
                            color: HexColor('#8281F8').withOpacity(0.2),
                          ),
                          child: SvgPicture.asset(
                            ImageAssets.notIcon,
                            fit: BoxFit.scaleDown,
                            width: 14.w,
                            height: 13.h,
                          ),
                        ),
                      ),
                      nColor: HexColor('#8281F8').withOpacity(0.2),
                      title: cubit!.name,
                      trailing: '7:00 PM',
                      color: HexColor('#EC8E6C').withOpacity(0.06),
                      sColor: HexColor('#EC8E6C'),
                      subtitle:cubit.email),
                ),
                if (isPressed)
                  buildNotificationsItem(
                    leftWidth: isRtl() ? 20 : 0,
                    rightWidth: isRtl() ? 0 : 20,
                    container: Container(
                      width: 87.w,
                      height: 32.h,
                      decoration: BoxDecoration(
                          color: HexColor('#7DBE56').withOpacity(0.2),
                          borderRadius: BorderRadius.circular(8)),
                      child: Center(
                          child: Text(AppStrings.accept.tr(),
                              style: const TextStyle(
                                fontWeight: FontWeightManager.semiBold,
                                fontFamily: FontConstants.cairoFontFamily,
                                fontSize: 13,
                              ))),
                    ),
                    iconColor: HexColor('#8281F8').withOpacity(0.20),
                    color: HexColor('#EC8E6C').withOpacity(0.02),
                    sColor: HexColor('#EC8E6C').withOpacity(0.02),
                    title:  HomeLayoutCubit.get(context).getNotificationModel!.data![index].title!,
                    subtitle: AppStrings.cardNotText.tr(),
                  )
              ],
            ),
          );
        });
  }
}
