import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:salon_app/shared/componants/componants.dart';

import '../../../shared/componants/fonts_manager.dart';
import 'accept_notifications.dart';
import 'refuse_notifications.dart';

class NotificationsScreen extends StatefulWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  State<NotificationsScreen> createState() => _NotificationsScreenState();
}


class _NotificationsScreenState extends State<NotificationsScreen> {
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
                SizedBox(
                  width: 76.w,
                ),
                const Text(
                  'الاشعارات',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: FontConstants.cairoFontFamily,
                    fontSize: 18,
                  ),
                )
              ],
            ),
            SizedBox(
              height: 20.h,
            ),
            Padding(
              padding: EdgeInsets.only(right: 15.0.w),
              child: ListView.separated(
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
                          ListView.separated(
                              shrinkWrap: true,
                              physics: const NeverScrollableScrollPhysics(),
                              itemBuilder: (_, int index) =>index == 0 ?const AcceptNotifications():const RefuseNotifications2(),
                              separatorBuilder: (_, __) =>
                                  SizedBox(height: 2.h),
                              itemCount: 2)
                        ],
                      ),
                  separatorBuilder: (_, __) => SizedBox(height: 16.h),
                  itemCount: 2),
            )
          ],
        ),
      )),
    );
  }
}
