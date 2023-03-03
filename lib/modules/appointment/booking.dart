
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';
import 'package:salon_app/shared/componants/color_manager.dart';

import 'add_appointment.dart';
import 'booking_widget.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key, required this.topPadding}) : super(key: key);
  final double topPadding;

  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int currentStep = 0;
  List<DateTime> dates = <DateTime>[];

  DateTime selectedDateTime = DateTime.now();

  @override
  void initState() {
    DateTime now = DateTime.now();
    dates.add(now.subtract(const Duration(days: 5)));
    dates.add(now.subtract(const Duration(days: 4)));
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
    return Padding(
        padding:
            EdgeInsets.only(top: widget.topPadding, right: 30.w, left: 30.w),
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اليوم',
                      style: TextStyle(
                        fontWeight: FontWeight.w700,
                        fontSize: 20,
                      ),
                    ),
                    SizedBox(
                      height: 4.h,
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
                const Spacer(),
                Container(
                  height: 32.h,
                  width: 112.w,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(16),
                    color: HexColor('#8281F8'),
                  ),
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (BuildContext context) =>
                                  const AddAppointmentScreen()));
                    },
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset(ImageAssets.addIcon),
                        SizedBox(
                          width: 6.w,
                        ),
                        const Text(
                          'اضافة موعد',
                          style: TextStyle(
                            fontWeight: FontWeight.w600,
                            color: Colors.white,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
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
                        Text(
                          DateFormat('EEE').format(dates[index]),
                          style: TextStyle(
                            fontSize: 18,
                            color: dates[index].day == selectedDateTime.day
                                ? ColorManager.buttonColor
                                : Colors.grey,
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
            SizedBox(height: 20.h),
            ListView.separated(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int currentIndex) =>  BookingWidget(index:currentIndex ,),
                separatorBuilder: (_, __) => SizedBox(width: 0.w),
                itemCount: 5),



          ],
        ));
  }
}

