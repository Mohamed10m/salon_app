import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';

import '../edit_settings/edit_settings.dart';
import '../help_center/help_center.dart';
import '../payment/payment_screen.dart';
import '../profile/profile_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return Directionality(
        textDirection: TextDirection.rtl,
        child: SingleChildScrollView(
          child: Container(
            decoration: const BoxDecoration(
                image: DecorationImage(
                    image: AssetImage(ImageAssets.background),
                    fit: BoxFit.cover)),
            child: Column(
              children: [
                SizedBox(
                  height: 81.h,
                ),
                const Image(image: AssetImage(ImageAssets.userImage)),
                SizedBox(
                  height: 16.h,
                ),
                const Text('امنية نهاد'),
                SizedBox(
                  height: 11.h,
                ),
                const Text('example@gmail.com'),
                SizedBox(
                  height: 32.h,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('المعلومات الشخصية',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ProfileScreen()));
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 24),
                  child: Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('الاعدادات',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const EditSettings()));
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('مواعيدى',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {},
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                      horizontal: 35.0, vertical: 24),
                  child: Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('طرق الدفع',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const PaymentScreen()));
                        },
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 35.0),
                  child: Container(
                    height: 64.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: HexColor("#8281F8").withOpacity(0.20)),
                    child: Center(
                      child: ListTile(
                        leading: Container(
                          height: 43,
                          width: 43,
                          decoration: const BoxDecoration(
                              image: DecorationImage(
                                  image:
                                      AssetImage(ImageAssets.backgroundIcon))),
                          child: Icon(
                            Icons.person,
                            color: HexColor('#8281F8'),
                          ),
                        ),
                        title: Text('مركز المساعدة',
                            style: Theme.of(context).textTheme.bodyLarge),
                        trailing: const Directionality(
                            textDirection: TextDirection.ltr,
                            child: Icon(Icons.arrow_back)),
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>
                                      const HelpCenterScreen()));
                        },
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
