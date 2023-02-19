import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/color_manager.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

import '../../../shared/componants/assets_manager.dart';
import '../../../shared/componants/componants.dart';
import 'add_appointment_successfully.dart';

class AddAppointmentScreen extends StatelessWidget {
  const AddAppointmentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var formKey = GlobalKey<FormState>();

    var nameController = TextEditingController();
    var emailController = TextEditingController();

    var phoneController = TextEditingController();
    return Scaffold(
        backgroundColor: ColorManager.scaffoldBackgroundColor,
        body: Container(
          height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.background),
                    fit: BoxFit.cover)),
            child: SingleChildScrollView(
              child: Directionality(
                textDirection: TextDirection.rtl,
                child: Padding(
                  padding: const EdgeInsets.only(top: 53, right: 36, left: 36),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
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
                                fontWeight: FontWeight.w700,
                                fontSize: 16,
                                fontFamily:
                                    'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                          ),
                        ],
                      ),
                      const SizedBox(height: 44),
                      const Text(
                        'اختر اليوم',
                        style: TextStyle(
                            fontWeight: FontWeight.w600,
                            fontSize: 18,
                            fontFamily:
                                'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                      ),
                      const SizedBox(height: 32),
                      Container(
                          padding: EdgeInsets.only(
                              left: 39.0.w, bottom: 25.h, top: 32.h, right: 31),
                          color: Colors.white,
                          child: Directionality(
                              textDirection: TextDirection.ltr,
                              child: SfDateRangePicker(
                                  showNavigationArrow: true,
                                  headerStyle: const DateRangePickerHeaderStyle(
                                      textAlign: TextAlign.center,
                                      textStyle: TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.w700,
                                          color: Colors.black)),
                                  selectionMode:
                                      DateRangePickerSelectionMode.range,
                                  selectionColor: Colors.red,
                                  monthViewSettings:
                                      DateRangePickerMonthViewSettings(
                                    showTrailingAndLeadingDates: true,
                                    viewHeaderStyle:
                                        DateRangePickerViewHeaderStyle(
                                            textStyle: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 15,
                                                color: HexColor('#9C9D9F'))),
                                    enableSwipeSelection: false,
                                  )))),
                      SizedBox(
                        height: 32.h,
                      ),
                      const Text(
                        'الاسم بالكامل',
                        style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500),
                      ),
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
                                      fontWeight: FontWeight.w500)),
                              SizedBox(
                                height: 24.h,
                              ),
                              customFormField(
                                text: "البريد الالكتروني",
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
                                    fontSize: 18, fontWeight: FontWeight.w500),
                              ),
                              SizedBox(
                                height: 24.h,
                              ),
                              customFormField(
                                text: "رقم الهاتف",
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
                                        fontWeight: FontWeight.w700),
                                  ),
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: HexColor('#8281F8'),
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10))),
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
            )));
  }
}
