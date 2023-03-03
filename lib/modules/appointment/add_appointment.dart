import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/color_manager.dart';


import '../../../shared/componants/componants.dart';
import '../../shared/componants/fonts_manager.dart';
import '../payment/payment_widget.dart';
import 'add_appointment_successfully.dart';

class AddAppointmentScreen extends StatefulWidget {
  const AddAppointmentScreen({Key? key}) : super(key: key);

  @override
  State<AddAppointmentScreen> createState() => _AddAppointmentScreenState();
}

class _AddAppointmentScreenState extends State<AddAppointmentScreen> {
  var formKey = GlobalKey<FormState>();

  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var dateController = TextEditingController();
  var timeController = TextEditingController();

  var phoneController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: background(
        child: Padding(
          padding: EdgeInsets.only(top: 53.h, right: 30.w, left: 30.w),
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
                    width: 90.w,
                  ),
                  const Text(
                    'اضف موعد',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
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
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(16),
                      color: HexColor('#FFFFFF').withOpacity(0.40)),
                  width: 319.w,
                  height: 306.h,
                  child: Theme(
                    data: ThemeData(
                        colorScheme: ColorScheme(
                            brightness: Brightness.light,
                            primary: ColorManager.buttonColor,
                            onPrimary: Colors.white,
                            secondary: Colors.transparent,
                            onSecondary: Colors.transparent,
                            error: Colors.transparent,
                            onError: Colors.transparent,
                            background: Colors.transparent,
                            onBackground: Colors.blue,
                            surface: Colors.blue,
                            onSurface: Colors.black)),
                    child: CalendarDatePicker(
                      initialDate: DateTime.now(),
                      firstDate: DateTime(2020),
                      lastDate: DateTime(2090),
                      onDateChanged: (date) {},
                    ),
                  )),
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
                        text: "Example@gmail.com",
                        hintStyle: const TextStyle(color: Colors.black),
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
                        text: "996 447 558+",
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
                      Row(
                        children: [
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'التاريخ',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                customFormField(
                                  fill: false,
                                  text: "2/5/2023",
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Password must not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: dateController,
                                  type: TextInputType.name,
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'الوقت',
                                  style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.w500),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                customFormField(
                                  fill: false,
                                  text: "568",
                                  hintStyle:
                                      const TextStyle(color: Colors.black),
                                  validate: (String? value) {
                                    if (value!.isEmpty) {
                                      return "Password must not be empty";
                                    } else {
                                      return null;
                                    }
                                  },
                                  controller: timeController,
                                  type: TextInputType.name,
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('اختر الخدمة',
                              style: TextStyle(
                                  fontSize: 16,
                                  fontFamily: FontConstants.cairoFontFamily,
                                  fontWeight: FontWeight.w700)),
                          SizedBox(
                            height: 24.h,
                          ),
                          Column(
                            children: [
                              FittedBox(
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: HexColor('#EC8E6C')
                                              .withOpacity(0.10),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        'الخدمة',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                          color: HexColor("#8281F8")
                                              .withOpacity(0.10),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        'الخدمة',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: HexColor('#FFC57B')
                                              .withOpacity(0.10),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        'الخدمة',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              FittedBox(
                                child: Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: HexColor('#FFC57B')
                                              .withOpacity(0.10),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        'الخدمة',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40.h,
                                      width: 90.w,
                                      decoration: BoxDecoration(
                                          color: HexColor("#EC8E6C")
                                              .withOpacity(0.10),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        'الخدمة',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 12.w),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 40.h,
                                      width: 110.w,
                                      decoration: BoxDecoration(
                                          color: HexColor('#8281F8')
                                              .withOpacity(0.11),
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: const Text(
                                        'الخدمة',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight:
                                              FontWeightManager.semiBold,
                                          fontFamily:
                                              FontConstants.cairoFontFamily,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      const Align(
                        alignment: Alignment.topRight,
                        child: Text(
                          'الفاتورة',
                          style: TextStyle(
                              fontWeight: FontWeightManager.medium,
                              fontFamily: FontConstants.cairoFontFamily,
                              fontSize: 16),
                        ),
                      ),
                      SizedBox(
                        height: 16.h,
                      ),
                      Container(
                          padding: EdgeInsets.only(
                              right: 25.w, left: 24.w, top: 21.h, bottom: 21.h),
                          height: 186.h,
                          width: 320.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: HexColor('#FFFFFF').withOpacity(0.24),
                          ),
                          child: Column(
                            children: [
                              rowItem(
                                  title: 'المجموع الفرعي', subtitle: '125 ر.س'),
                              const SizedBox(
                                height: 16,
                              ),
                              rowItem(title: 'الضريبة:', subtitle: '12 %'),
                              const SizedBox(
                                height: 16,
                              ),
                              rowItem(
                                  title: 'المجموع الفرعي',
                                  subtitle: 'الاجمالى:'),
                              const SizedBox(
                                height: 16,
                              ),
                            ],
                          )),
                      SizedBox(
                        height: 32.h,
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
                            'احجز موعد',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
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
