import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:intl/intl.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';
import 'package:salon_app/shared/componants/color_manager.dart';

import 'add_appointment.dart';

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
        padding: EdgeInsets.only(top: widget.topPadding, right: 20, left: 20),
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
                    const SizedBox(
                      height: 4,
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
                  height: 32,
                  width: 112,
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
                        const SizedBox(
                          width: 6,
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
            const SizedBox(height: 20),
            SizedBox(
              height: 70,
              child: ListView.separated(
                itemBuilder: (_, int index) => Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 4),
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
                separatorBuilder: (_, __) => const SizedBox(width: 12),
                itemCount: dates.length,
                scrollDirection: Axis.horizontal,
              ),
            ),
            ListView.builder(
                padding: EdgeInsets.zero,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemBuilder: (_, int index) => Row(
                      children: [
                        SizedBox(
                          height: index == 2 ? 182 : 85,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Container(
                                decoration: index == 2
                                    ? BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                          color: HexColor('#8281F8'),
                                        ))
                                    : null,
                                padding: const EdgeInsets.all(3),
                                child: Container(
                                  width: 14,
                                  height: 14,
                                  decoration: BoxDecoration(
                                      color: index == 0 || index == 2
                                          ? HexColor('#8281F8')
                                          : Colors.transparent,
                                      borderRadius: BorderRadius.circular(20),
                                      border: Border.all(
                                          color: HexColor('#8281F8'))),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              if (index != 4)
                                Expanded(
                                  child: Container(
                                    width: 1.w,
                                    height: 54.h,
                                    color: HexColor('#8281F8'),
                                  ),
                                )
                            ],
                          ),
                        ),
                        SizedBox(width: 18.w),
                        Expanded(
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 4),
                            padding: EdgeInsets.only(
                                top: 26.h,
                                right: 18.w,
                                left: 30.w,
                                bottom: 25.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: index == 2
                                    ? HexColor("#8281F8")
                                    : HexColor(
                                            index.isOdd ? '#EC8E6C' : "#8281F8")
                                        .withOpacity(.1)),
                            child: index == 2
                                ? Row(
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            children: [
                                              const Text(
                                                'حلاقة',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 14,
                                                    fontWeight:
                                                        FontWeight.w600),
                                              ),
                                              SizedBox(
                                                width: 130.w,
                                              ),
                                              const Text(
                                                '7:00 PM',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                          SizedBox(
                                            height: 11.h,
                                          ),
                                          const Text(
                                            'هذا النص هو مثال يمكن ان يستبدل \nحيث يمكنك وضع',
                                            style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 12,
                                                fontWeight: FontWeight.w500),
                                          ),
                                          SizedBox(
                                            height: 16.h,
                                          ),
                                          Row(
                                            children: [
                                              Container(
                                                height: 30,
                                                width: 30,
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
                                              Container(
                                                height: 30,
                                                width: 30,
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
                                              Container(
                                                height: 30,
                                                width: 30,
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
                                                width: 100.w,
                                              ),
                                              const Image(
                                                image: AssetImage(
                                                    ImageAssets.clockIcon),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ],
                                  )
                                : Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: const [
                                          Text(
                                            'حلاقة',
                                            style: TextStyle(
                                                fontSize: 14,
                                                fontWeight: FontWeight.w700),
                                          ),
                                          SizedBox(
                                            height: 0.8,
                                          ),
                                          Text(
                                            'هذا النص هو مثال يمكن ان يستبدل',
                                            style: TextStyle(
                                                fontSize: 12,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Text(
                                        '7:00 PM',
                                        style: TextStyle(
                                            color: HexColor('#212121')
                                                .withOpacity(0.30)),
                                      ),
                                    ],
                                  ),
                          ),
                        ),
                      ],
                    ),
                itemCount: 5),
          ],
        ));
  }
}
