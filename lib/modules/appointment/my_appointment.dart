import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/app_strings.dart';

import '../../shared/componants/color_manager.dart';
import '../../shared/componants/componants.dart';
import '../../shared/componants/language_type.dart';
import 'booking_widget.dart';

class MyAppointments extends StatefulWidget {
  const MyAppointments({Key? key}) : super(key: key);

  @override
  State<MyAppointments> createState() => _MyAppointmentsState();
}

class _MyAppointmentsState extends State<MyAppointments> {
  int currentStep = 0;
  List<DateTime> dates = <DateTime>[];

  DateTime selectedDateTime = DateTime.now();

  @override
  void initState() {
    DateTime now = DateTime.now();
    dates.add(now.subtract(const Duration(days: 3)));
    dates.add(now.subtract(const Duration(days: 2)));
    dates.add(now.subtract(const Duration(days: 1)));
    dates.add(now);
    dates.add(now.add(const Duration(days: 1)));
    dates.add(now.add(const Duration(days: 2)));
    dates.add(now.add(const Duration(days: 3)));
    dates.add(now.add(const Duration(days: 4)));
    dates.add(now.add(const Duration(days: 5)));

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    bool isRtl() {
      return context.locale == arabicLocal;
    }

    Locale myLocale = Localizations.localeOf(context);

    return Scaffold(
        body: background(
            child: Column(children: [
      Padding(
        padding: EdgeInsets.only(
          top: 30.h,
          right: isRtl() ? 0.w : 0,
          left: isRtl() ? 0 : 22.w,
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Transform(
                  alignment:
                      isRtl() ? Alignment.bottomLeft : Alignment.bottomRight,
                  transform: Matrix4.rotationY(isRtl() ? 0 : 0),
                  child: Padding(
                    padding: EdgeInsets.only(right: isRtl() ? 24.0.w : 0),
                    child: const Icon(
                      Icons.arrow_back,
                      color: Colors.black,
                    ),
                  )),
            ),
            SizedBox(
              width: isRtl() ? 84.w : 100.w,
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Column(
                children: [
                  Text(
                    AppStrings.myAppointments.tr(),
                    style: const TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Text(
                    'may 5, 2023',
                    style: TextStyle(
                      color: HexColor('#212121').withOpacity(0.5),
                      fontWeight: FontWeight.w400,
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      Column(children: [
        Padding(
            padding: EdgeInsets.only(right: 30.w, left: 30.w),
            child: Column(
              children: [
                SizedBox(height: 20.h),
                SizedBox(
                  height: 70.h,
                  child: ListView.separated(
                    itemBuilder: (_, int index) => Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: InkWell(
                        onTap: () {
                          selectedDateTime = dates[index];
                          setState(() {});
                        },
                        child: Column(
                          children: [
                            Center(
                              child: Align(
                                child: Text(
                                  DateFormat.E(myLocale.languageCode)
                                      .format(dates[index]),
                                  style: TextStyle(
                                    fontSize: 18,
                                    color:
                                        dates[index].day == selectedDateTime.day
                                            ? ColorManager.buttonColor
                                            : Colors.grey,
                                  ),
                                ),
                                alignment: Alignment.center,
                              ),
                            ),
                            Text(
                              dates[index].day.toString(),
                              style: TextStyle(
                                fontSize: 14,
                                color: dates[index].day == selectedDateTime.day
                                    ? ColorManager.buttonColor
                                    : Colors.grey,
                              ),
                            ),
                            if (dates[index].day == selectedDateTime.day) ...[
                              CircleAvatar(
                                backgroundColor: ColorManager.buttonColor,
                                radius: 2,
                              )
                            ]
                          ],
                        ),
                      ),
                    ),
                    separatorBuilder: (_, __) => SizedBox(width: 12.w),
                    itemCount: dates.length,
                    scrollDirection: Axis.horizontal,
                  ),
                ),
                SizedBox(height: 10.h),
                ListView.separated(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemBuilder: (_, int currentIndex) => BookingWidget(
                          index: currentIndex,
                        ),
                    separatorBuilder: (_, __) => SizedBox(width: 0.w),
                    itemCount: 5),
              ],
            ))
      ]),
    ],
            ),
        ),
    );
  }
}
