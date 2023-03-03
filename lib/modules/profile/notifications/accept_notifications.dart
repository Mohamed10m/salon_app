import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/profile/notifications/widgets.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/fonts_manager.dart';

class AcceptNotifications extends StatefulWidget {
  const AcceptNotifications({Key? key}) : super(key: key);

  @override
  _State createState() => _State();
}

class _State extends State<AcceptNotifications> {
  bool isPressed = false;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        setState(() {
          isPressed = !isPressed;
        });
      },
      child: Column(
        children: [
          buildUserDataItem(
              container:
                  Container(
                height: 26.h,
                width: 27.w,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: HexColor('#8281F8').withOpacity(0.2),
                ),
                child: SvgPicture.asset(
                  ImageAssets.notIcon,
                  fit: BoxFit.scaleDown,
                  width: 14.w,
                  height: 13.h,
                ),
              ),
              nColor: HexColor('#8281F8').withOpacity(0.2),
              title: 'امنية نهاد',
              trailing: '7:00PM',
              color: HexColor('#EC8E6C').withOpacity(0.06),
              sColor: HexColor('#EC8E6C'),
              subtitle: 'example@gmail.com'),
        if  (isPressed)
        buildNotificationsItem(
            container:

                Container(
              width: 87.w,
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
            color: HexColor('#EC8E6C').withOpacity(0.02),
            sColor: HexColor('#EC8E6C').withOpacity(0.02),
            title: 'مكياج',
            subtitle: ' هذا النص مثال يمكن \nان يستيدل',
          )
        ],
      ),
    );
  }
}
