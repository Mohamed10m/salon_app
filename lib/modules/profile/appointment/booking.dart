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
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Container(
        height: double.infinity,
        decoration: const BoxDecoration(
            image: DecorationImage(
                image: AssetImage(ImageAssets.background), fit: BoxFit.cover)),
        child: Scaffold(
          body: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.background),
                    fit: BoxFit.cover)),
            child: Padding(
                padding: const EdgeInsets.only(top: 71.0, right: 36, left: 36),
                child: SingleChildScrollView(
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
                                    fontFamily:
                                        'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
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
                                    fontFamily:
                                        'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
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
                                        fontFamily:
                                            'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 60,
                          ),
                        ],
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
                              CircleAvatar(
                                radius: 8,
                                backgroundColor: HexColor('#8281F8'),
                              ),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: HexColor('#8281F8'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 31,
                          ),
                          Container(
                            height: 72.h,
                            width: 282,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: HexColor("#8281F8").withOpacity(0.20)),
                            child: Center(
                              child: ListTile(
                                title: const Text(
                                  'حلاقة',
                                ),
                                subtitle: const Text(
                                  'هذا النص هو مثال يمكن ان يستبدل',
                                ),
                                trailing: const Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text('7:00 PM'),
                                ),
                                onTap: () {},
                              ),
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
                              CircleAvatar(
                                  backgroundColor: HexColor('#8281F8'),
                                  radius: 8,
                                  child: const CircleAvatar(
                                    radius: 7,
                                    backgroundColor: Colors.white,
                                  )),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: HexColor('#8281F8'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 31,
                          ),
                          Container(
                            height: 72.h,
                            width: 282,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: HexColor("#EC8E6C").withOpacity(0.20)),
                            child: Center(
                              child: ListTile(
                                title: const Text(
                                  'حلاقة',
                                ),
                                subtitle: const Text(
                                  'هذا النص هو مثال يمكن ان يستبدل',
                                ),
                                trailing: const Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text('7:00 PM'),
                                ),
                                onTap: () {},
                              ),
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
                              CircleAvatar(
                                  backgroundColor: HexColor('#8281F8'),
                                  radius: 12,
                                  child: CircleAvatar(
                                      radius: 11,
                                      backgroundColor: Colors.white,
                                      child: CircleAvatar(
                                          radius: 7,
                                          backgroundColor:
                                              HexColor('#8281F8')))),
                              const SizedBox(
                                height: 12,
                              ),
                              Container(
                                width: 1,
                                height: 50,
                                color: HexColor('#8281F8'),
                              ),
                            ],
                          ),
                          const SizedBox(
                            width: 31,
                          ),
                          Container(
                            height: 72.h,
                            width: 282,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: HexColor("#8281F8")),
                            child: Center(
                              child: ListTile(
                                title: const Text(
                                  'حلاقة',
                                ),
                                subtitle: const Text(
                                  'هذا النص هو مثال يمكن ان يستبدل',
                                ),
                                trailing: const Directionality(
                                  textDirection: TextDirection.ltr,
                                  child: Text('7:00 PM'),
                                ),
                                onTap: () {},
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                )),
          ),
        ),
      ),
    );
  }
}
