import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/componants.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../shared/componants/fonts_manager.dart';
import 'add_appointment.dart';

class MyAppointment extends StatelessWidget {
  const MyAppointment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: background(
      child: Padding(
        padding: EdgeInsets.only(top: 53.h, right: 38.w, left: 36.w),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Row(
            children: [
              InkWell(
                  onTap: () {
                    Navigator.pop(context);
                  },
                  child: const Icon(Icons.arrow_back)),
              SizedBox(
                width: 84.w,
              ),
              const Text(
                'مواعيدي',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: FontConstants.cairoFontFamily,
                  fontSize: 16,
                ),
              ),
            ],
          ),
          SizedBox(height: 40.h),
          Column(children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'اليوم',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: FontConstants.cairoFontFamily,
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
                        fontWeight: FontWeight.bold,
                        fontFamily: FontConstants.cairoFontFamily,
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
                            fontWeight: FontWeightManager.semiBold,
                            fontFamily: FontConstants.cairoFontFamily,
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
              onDateChange: (date) {},
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
                  width: 12.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 80.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeightManager.semiBold,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeightManager.light,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
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
                          color: Colors.white,
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
                  width: 12.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 80.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeightManager.semiBold,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeightManager.light,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
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
                          color: Colors.white,
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
                  width: 12.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 80.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeightManager.semiBold,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeightManager.light,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
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
                          color: Colors.white,
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
                  width: 12.w,
                ),
                Container(
                    padding: EdgeInsets.only(
                        top: 13.h, right: 18.w, left: 16.w, bottom: 17.h),
                    height: 80.h,
                    width: 260.w,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.10)),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text(
                              'حلاقة',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeightManager.semiBold,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                            SizedBox(
                              height: 0.8,
                            ),
                            Text(
                              'هذا النص هو مثال يمكن ان يستبدل',
                              style: TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeightManager.light,
                                fontFamily: FontConstants.cairoFontFamily,
                              ),
                            ),
                          ],
                        ),
                        const Spacer(),
                        Text(
                          '7:00 PM',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
                              color: HexColor('#212121').withOpacity(0.30)),
                        ),
                      ],
                    )),
              ],
            ),
          ]),
          SizedBox(
            height: 12.h,
          ),
        ]),
      ),
    ));
  }
}
