import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/profile/notifications/widgets.dart';
import 'package:salon_app/shared/componants/componants.dart';

import '../../../shared/componants/fonts_manager.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
          child: Padding(
        padding: EdgeInsets.only(top: 50.0.h, right: 20.w, left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                IconButton(
                    onPressed: () => Navigator.of(context).pop(),
                    icon: (const Icon(Icons.arrow_back))),
                const Text(
                  'الاشعارات',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontConstants.cairoFontFamily,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            ListView.separated(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) => Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(index == 0 ? 'اليوم' : 'الاسبوع الماضي',
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 20,
                            )),
                        const SizedBox(height: 8),
                        ListView.separated(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemBuilder: (_, int index) => Column(
                                  children: [
                                    buildUserDataItem(
                                        nColor: HexColor('#8281F8')
                                            .withOpacity(0.2),
                                        title: 'امنية نهاد',
                                        trailing: '7:00PM',
                                        color: HexColor('#EC8E6C')
                                            .withOpacity(0.06),
                                        sColor: HexColor('#EC8E6C'),
                                        subtitle: 'example@gmail.com'),
                                    buildNotificationsItem(
                                      color:
                                          HexColor('#EC8E6C').withOpacity(0.02),
                                      sColor:
                                          HexColor('#EC8E6C').withOpacity(0.02),
                                      title: 'مكياج',
                                      subtitle:
                                          ' هذا النص مثال هذا النص مثال هذا النص مثال هذا النص مثال هذا النص مثال  ',
                                    )
                                  ],
                                ),
                            separatorBuilder: (_, __) =>
                                const SizedBox(height: 12),
                            itemCount: 2)
                      ],
                    ),
                separatorBuilder: (_, __) => const SizedBox(height: 12),
                itemCount: 2)
          ],
        ),
      )),
    );
  }
}
