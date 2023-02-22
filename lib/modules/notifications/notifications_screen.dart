import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/profile/notifications/widgets.dart';
import 'package:salon_app/shared/componants/componants.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold( body:background(child: Padding(
              padding: EdgeInsets.only(top: 50.0.h, right: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 90.0),
                        child: IconButton(
                            onPressed: () {},
                            icon: (const Icon(Icons.arrow_back))),
                      ),
                      const Text('الاشعارات',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 18,
                              fontFamily:
                                  'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                    ],
                  ),
                  const SizedBox(height: 32),
                  const Text('اليوم',
                      style: TextStyle(
                          fontWeight: FontWeight.w700,
                          fontSize: 20,
                          fontFamily:
                              'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                  const SizedBox(height: 32),
                  buildUserDataItem(
                      nColor: HexColor('#8281F8').withOpacity(0.2),

                      title: 'امنية نهاد',
                      trailing: '7 :00 PM',
                      color: HexColor('#EC8E6C').withOpacity(0.06),
                      sColor: HexColor('#EC8E6C'),
                      subtitle: 'example@gmail.com'),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 1.5,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: HexColor('#000000').withOpacity(0.2)),
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
                              width: 1.5,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: HexColor('#000000').withOpacity(0.2)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        buildNotificationsItem(
                          color: HexColor('#EC8E6C').withOpacity(0.02),
                          sColor: HexColor('#EC8E6C').withOpacity(0.02),
                          title: 'مكياج',
                          subtitle: ' هذا النص مثال ',
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 32),
                  buildUserDataItem(
                      title: 'امنية نهاد',
                      trailing: '7 :00 PM',
                      nColor: HexColor('#EC8E6C').withOpacity(0.20),
                      color: HexColor('#EC8E6C').withOpacity(0.06),
                      sColor: HexColor('#EC8E6C'),
                      subtitle: 'example@gmail.com'),
                  Padding(
                    padding: const EdgeInsets.only(right: 5.0),
                    child: Row(
                      children: [
                        Column(
                          children: [
                            Container(
                              width: 1.5,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: HexColor('#000000').withOpacity(0.2)),
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
                              width: 1.5,
                              height: 60.h,
                              decoration: BoxDecoration(
                                  color: HexColor('#000000').withOpacity(0.2)),
                            ),
                            SizedBox(
                              height: 30.h,
                            ),
                          ],
                        ),
                        SizedBox(
                          width: 12.w,
                        ),
                        buildNotificationsItem(
                          color: HexColor('#EC8E6C').withOpacity(0.02),
                          sColor: HexColor('#EC8E6C').withOpacity(0.02),
                          title: 'مكياج',
                          subtitle: ' هذا النص مثال ',
                        ),
                      ],
                    ),
                  )
                ],
              ),
    )),

    );
  }
}
