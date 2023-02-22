import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import 'add_appointment.dart';

class BookingScreen extends StatefulWidget {
  const BookingScreen({Key? key}) : super(key: key);
  @override
  State<BookingScreen> createState() => _BookingScreenState();
}

class _BookingScreenState extends State<BookingScreen> {
  int currentStep = 0;
  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(top: 71.0, right: 36, left: 36),
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
            SizedBox(
              height: 29.h,
            ),
            DatePicker(
              DateTime.now(),
              initialSelectedDate: DateTime.now(),
              selectedTextColor: HexColor('#8281F8'),
              selectionColor: HexColor('#F5F5F5'),
              dateTextStyle: const TextStyle(color: Colors.grey),
              dayTextStyle: const TextStyle(color: Colors.grey),
              monthTextStyle: const TextStyle(color: Colors.grey),
              onDateChange: (date) {
                // New date selected
                // setState(() {
                //   // _selectedValue = date;
                // });
              },
            ),
            SizedBox(
              height: 33.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          color: HexColor('#8281F8'),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 1.w,
                      height: 54.h,
                      color: HexColor('#8281F8'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 76.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              color: HexColor('#212121').withOpacity(0.30)),
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: HexColor('#8281F8'),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 1.w,
                      height: 54.h,
                      color: HexColor('#8281F8'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 76.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#EC8E6C").withOpacity(0.20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              color: HexColor('#212121').withOpacity(0.30)),
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                     CircleAvatar(

                       radius: 10,
                       backgroundColor:  HexColor('#8281F8'),
                       child: CircleAvatar(

                        backgroundColor: Colors.white,
                        radius: 8,
                        child: CircleAvatar(
                          backgroundColor:  HexColor('#8281F8'),
                          radius: 6,),
                    ),
                     ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 1.w,
                      height: 149.h,
                      color: HexColor('#8281F8'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 15.w,
                ),
                Container(
                  padding: EdgeInsets.only(
                      top: 26.h, right: 18.w, left: 30.w, bottom: 25.h),
                  height: 182.h,
                  width: 260.w,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: HexColor("#8281F8")),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children:  [
                              const Text(
                                'حلاقة',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 14,
                                    fontWeight: FontWeight.w600),
                              ),
                              SizedBox(width: 130.w,),
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
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Image(
                                  image: AssetImage(ImageAssets.barberName),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: HexColor('#FFC57B'),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Image(
                                  image: AssetImage(ImageAssets.barberName),
                                ),
                              ),
                              Container(
                                height: 30,
                                width: 30,
                                decoration: BoxDecoration(
                                  color: HexColor('#FFC57B'),
                                  borderRadius: BorderRadius.circular(25),
                                ),
                                child: const Image(
                                  image: AssetImage(ImageAssets.barberName),
                                ),
                              ),
                              SizedBox(width: 100.w,),

                              const Image(
                                image: AssetImage(ImageAssets.clockIcon),
                              ),

                            ],
                          )
                        ],
                      ),


                    ],
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
            Row(
              children: [
                Column(
                  children: [
                    Container(
                      width: 14,
                      height: 14,
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: HexColor('#8281F8'),
                          ),
                          borderRadius: BorderRadius.circular(20)),
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Container(
                      width: 1.w,
                      height: 54.h,
                      color: HexColor('#8281F8'),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 76.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#EC8E6C").withOpacity(0.20)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                  fontSize: 14, fontWeight: FontWeight.w700),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              color: HexColor('#212121').withOpacity(0.30)),
                        ),
                      ],
                    )),
              ],
            ),
            SizedBox(
              height: 19.h,
            ),
          ],
        ));
  }
}
