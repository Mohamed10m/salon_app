import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/home/widgets.dart';
import 'package:salon_app/shared/componants/color_manager.dart';

import '../../layout/cubut/shop_layout_cubit.dart';
import '../../layout/cubut/shop_layout_states.dart';
import '../../shared/componants/assets_manager.dart';
import '../profile/notifications/notifications_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<HomeLayoutCubit, HomeLayoutStates>(
        listener: (context, state) {},
        builder: (context, state) {
          return Scaffold(
            backgroundColor: ColorManager.scaffoldBackgroundColor,
            body: Directionality(
              textDirection: TextDirection.rtl,
              child: SingleChildScrollView(
                child: Column(children: [
                  Padding(
                    padding:
                        const EdgeInsets.only(top: 69.0, right: 10, left: 11),
                    child: ListTile(
                      leading: Container(
                        height: 59,
                        width: 58,
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                          image: AssetImage(ImageAssets.userImage),
                        )),
                      ),
                      title: const Text('الاسم',
                          style: TextStyle(
                              fontWeight: FontWeight.w700,
                              fontSize: 22,
                              fontFamily:
                                  'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                      trailing: InkWell(
                        child: Container(
                          height: 19,
                          width: 21,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                            image: AssetImage(ImageAssets.notificationImage),
                          )),
                        ),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const NotificationsScreen()));
                        },
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 35.0),
                    child: Row(
                      children: [
                        const Text('مواعيدي',
                            style: TextStyle(
                                fontWeight: FontWeight.w600,
                                fontSize: 16,
                                fontFamily:
                                    'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                        const Spacer(),
                        InkWell(
                          child: Row(
                            children: [
                              Container(
                                height: 13,
                                width: 13,
                                decoration: const BoxDecoration(
                                    image: DecorationImage(
                                  image: AssetImage(ImageAssets.vector),
                                )),
                              ),
                              const SizedBox(
                                width: 6,
                              ),
                              Text('اضافة موعد',
                                  style: TextStyle(
                                      color: HexColor('#8281F8'),
                                      fontWeight: FontWeight.w600,
                                      fontSize: 12,
                                      fontFamily:
                                          'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'))
                            ],
                          ),
                          onTap: () {},
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 24,
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 35),
                      child: Container(
                          height: 150,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                            color: HexColor('#EC8E6C').withOpacity(0.02),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                                top: 16, right: 16, left: 16),
                            child: Column(
                              children: [
                                ListTile(
                                  leading: Container(
                                    height: 41,
                                    width: 29,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                      image: AssetImage(ImageAssets.userImage),
                                    )),
                                  ),
                                  title: const Text('اسم الحلاق',
                                      style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 13,
                                          fontFamily:
                                              'assets/fonts/Cairo-VariableFont_slnt,wght.ttf')),
                                  subtitle: Text(
                                    'التاريخ: 2023 ,oct 9',
                                    style: TextStyle(
                                        color: HexColor('#212121')
                                            .withOpacity(0.5),
                                        fontWeight: FontWeight.w600,
                                        fontSize: 12,
                                        fontFamily:
                                            'assets/fonts/Cairo-VariableFont_slnt,wght.ttf'),
                                  ),
                                  trailing: const Text('11:00 AM'),
                                ),
                                const SizedBox(
                                  height: 23,
                                ),
                                Row(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 24,
                                      width: 71,
                                      decoration: BoxDecoration(
                                          color: HexColor('#EC8E6C'),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'مكياج',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 24,
                                      width: 74,
                                      decoration: BoxDecoration(
                                          color: HexColor('#8281F8'),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'قص شعر',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                    const SizedBox(width: 20),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 24,
                                      width: 74,
                                      decoration: BoxDecoration(
                                          color: HexColor('#FFC57B'),
                                          borderRadius:
                                              BorderRadius.circular(30)),
                                      child: const Text(
                                        'حلاقة',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ],
                                ),
                                // const SizedBox(height: 18,)
                              ],
                            ),
                          ))),
                  const SizedBox(
                    height: 21,
                  ),
                  const Text('احجز خدمة'),
                  const SizedBox(
                    height: 16,
                  ),
                  buildCardItem(
                      title: 'تصفيف شعر',
                      trailing: '12 ر.س',
                      color: HexColor('#FCC885').withOpacity(0.06),
                      sColor: HexColor('#FCC885'),
                      subtitle: 'هذا النص هو مثال على ما سوف'),
                  const SizedBox(
                    height: 16,
                  ),
                  buildCardItem(
                      title: 'حلاقة',
                      trailing: '12 ر.س',
                      color: HexColor('#8281F8').withOpacity(0.06),
                      sColor: HexColor('#8281F8'),
                      subtitle: 'هذا النص هو مثال على ما سوف'),
                  const SizedBox(
                    height: 16,
                  ),
                  buildCardItem(
                      title: 'مكياج',
                      trailing: '12 ر.س',
                      color: HexColor('#EC8E6C').withOpacity(0.06),
                      sColor: HexColor('#EC8E6C'),
                      subtitle: 'هذا النص هو مثال على ما سوف'),
                  const SizedBox(
                    height: 16,
                  ),
                ]),
              ),
            ),
          );
        });
  }
}
