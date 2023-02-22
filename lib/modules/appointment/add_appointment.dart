import 'dart:developer';

import 'package:clean_nepali_calendar/clean_nepali_calendar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';
import 'add_appointment_successfully.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  final NepaliCalendarController _calendarController =
      NepaliCalendarController();

  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();

  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
        child: Padding(
          padding: EdgeInsets.only(top: 53.h, right: 38.w, left: 36.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
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
                    'اضف موعد',
                    style: TextStyle(
                      fontWeight: FontWeightManager.medium,
                      fontFamily: FontConstants.cairoFontFamily,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 44.h),
              const Text(
                'اختر اليوم',
                style: TextStyle(
                  fontWeight: FontWeightManager.semiBold,
                  fontFamily: FontConstants.cairoFontFamily,
                  fontSize: 18,
                ),
              ),
              SizedBox(height: 5.h),
              Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(16)),
                  width: 319.w,
                  height: 306.h,
                  child: Directionality(
                      textDirection: TextDirection.ltr,
                      child: CleanNepaliCalendar(
                        controller: _calendarController,
                        onDaySelected: (day) {
                          log(day.toString());
                        },
                      ))),
              SizedBox(
                height: 32.h,
              ),
              const Text('الاسم بالكامل',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeightManager.medium,
                    fontFamily: FontConstants.cairoFontFamily,
                  )),
              SizedBox(
                height: 24.h,
              ),
              Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      customFormField(
                        text: "الاسم بالكامل",
                        hintStyle: const TextStyle(color: Colors.black87),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "name must not be empty";
                          } else {
                            return null;
                          }
                        },
                        controller: nameController,
                        type: TextInputType.emailAddress,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      const Text('البريد الالكتروني',
                          style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily,
                          )),
                      SizedBox(
                        height: 24.h,
                      ),
                      customFormField(
                        text: "البريد الالكتروني",
                        hintStyle: const TextStyle(color: Colors.black87),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "email must not be empty";
                          } else {
                            return null;
                          }
                        },
                        controller: emailController,
                        type: TextInputType.number,
                      ),
                      SizedBox(
                        height: 32.h,
                      ),
                      const Text(
                        'رقم الهاتف',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeightManager.medium,
                            fontFamily: FontConstants.cairoFontFamily),
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      customFormField(
                        text: "رقم الهاتف",
                        hintStyle: const TextStyle(color: Colors.black87),
                        validate: (String? value) {
                          if (value!.isEmpty) {
                            return "phone must not be empty";
                          } else {
                            return null;
                          }
                        },
                        controller: phoneController,
                        type: TextInputType.number,
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      SizedBox(
                        height: 64.h,
                        width: 320.w,
                        child: ElevatedButton(
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              Navigator.pushAndRemoveUntil(
                                  context,
                                  MaterialPageRoute(
                                      builder: (BuildContext context) =>
                                          const AppointmentResultScreen()),
                                  (route) => false);
                            }
                          },
                          child: const Text(
                            'حفظ',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeightManager.bold,
                              fontFamily: FontConstants.cairoFontFamily,
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                              backgroundColor: HexColor('#8281F8'),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10))),
                        ),
                      ),
                    ],
                  )),
              const SizedBox(
                height: 24,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
