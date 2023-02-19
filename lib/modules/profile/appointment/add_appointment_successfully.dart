import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import '../../../layout/home_layout/home_layout.dart';

class AppointmentResultScreen extends StatelessWidget {
  const AppointmentResultScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
            body: Container(
              height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage(ImageAssets.background),
                  fit: BoxFit.cover)),
          child: Column(
            children: [
              const SizedBox(
                height: 96,
              ),
              Center(
                child: Container(
                  height: 152,
                  width: 152,
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage(
                              ImageAssets.backgroundAppointmentImage))),
                  child: Container(
                    width: 93,
                    height: 97,
                    decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage(ImageAssets.appointmentImage))),
                  ),
                ),
              ),
              SizedBox(
                height: 24.h,
              ),
              const Text('تم حجز موعدك بنجاح'),
              SizedBox(height: 24.h),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 36.0),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(14),
                    color: HexColor('#8281F8').withOpacity(0.20),
                  ),
                  padding: const EdgeInsets.all(19),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('امنية نهاد'),
                                Text('12 Feb 2:00 PM'),
                              ]),
                          const Spacer(),
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(8),
                              color: HexColor('#8281F8'),
                            ),
                            child: const Padding(
                              padding: EdgeInsets.only(
                                  top: 8.0, bottom: 8.0, right: 18, left: 18),
                              child: Text(
                                'قيد الانتظار',
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15.0,
                      ),
                      const Text(
                          'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة، لقد تم توليد هذا النص من مولد النص العربى، حيث يمكنك '),
                      Align(
                        alignment: Alignment.bottomLeft,
                        child: Text(
                          '125 ر.س ',
                          style: TextStyle(
                            color: HexColor('#8281F8'),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(
                height: 32,
              ),
              SizedBox(
                height: 64.h,
                width: 320.w,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (BuildContext context) =>
                                const HomeLayout()),
                        (route) => false);
                  },
                  child: const Text(
                    'العودة للرئيسية',
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: HexColor('#8281F8'),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              ),
            ],
          ),
        )));
  }
}
