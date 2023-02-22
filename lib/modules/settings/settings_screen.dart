import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:salon_app/modules/auth/auth__screens/login_screen.dart';
import 'package:salon_app/modules/help_center/help_center.dart';
import 'package:salon_app/modules/payment/payment_screen.dart';
import 'package:salon_app/modules/settings/widgets.dart';
import 'package:salon_app/shared/componants/assets_manager.dart';
import '../../shared/componants/fonts_manager.dart';
import '../appointment/my_appointment.dart';
import '../edit_settings/edit_settings.dart';
import '../profile/profile_screen.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({Key? key}) : super(key: key);

  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  @override
  Widget build(BuildContext context) {
    return   Padding(
          padding: EdgeInsets.only(right: 36.0.w, left: 35.w),
          child: Column(
            children: [
              SizedBox(
                height: 81.h,
              ),
              const Image(image: AssetImage(ImageAssets.userImage)),
              SizedBox(
                height: 16.h,
              ),
              const Text(
                'امنية نهاد',
                style: TextStyle(
                  fontWeight: FontWeightManager.bold,
                  fontFamily: FontConstants.cairoFontFamily,
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 11.h,
              ),
              Text(
                'Example@gmail.com',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 12,
                    color: HexColor('#212121').withOpacity(0.5),
                    fontFamily: 'Poppins'),
              ),
              SizedBox(
                height: 32.h,
              ),
              buildSettingsCardItem(
                color: HexColor("#8281F8").withOpacity(0.04),
                text: 'المعلومات الشخصية',
                image: ImageAssets.personIcon,
                context: context,
                widget: const ProfileScreen(),
              ),
              SizedBox(
                height: 24.h,
              ),
              buildSettingsCardItem(
                color: HexColor("#8281F8").withOpacity(0.04),
                text: 'الاعدادات',
                image: ImageAssets.settingsIcon,
                context: context,
                widget: const EditSettings(),
              ),
              SizedBox(
                height: 24.h,
              ),
              buildSettingsCardItem(
                color: HexColor("#8281F8").withOpacity(0.04),
                text: 'مواعيدى',
                image: ImageAssets.appointmentIcon,
                context: context,
                widget: const MyAppointment(),
              ),
              SizedBox(
                height: 24.h,
              ),
              buildSettingsCardItem(
                color: HexColor("#8281F8").withOpacity(0.04),
                text: 'طرق الدفع',
                image: ImageAssets.bookingIcon,
                context: context,
                widget: const PaymentScreen(),
              ),
              SizedBox(
                height: 24.h,
              ),
              buildSettingsCardItem(
                color: HexColor("#8281F8").withOpacity(0.04),
                text: 'مركز المساعدة',
                image: ImageAssets.helpIcon,
                context: context,
                widget: const HelpCenterScreen(),
              ),
              SizedBox(
                height: 24.h,
              ),
              buildSettingsCardItem(
                color: HexColor("#FF725E").withOpacity(0.06),
                text: 'تسجيل الخروج',
                image: ImageAssets.logoutIcon,
                context: context,
                widget: const LoginScreen(),
              ),
            ],
          )
        );
  }
}
